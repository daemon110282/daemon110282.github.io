# server.py - Flask-based document conversion API
import os
import subprocess
import tempfile
from pathlib import Path
from flask import Flask, request, send_file, jsonify
from werkzeug.utils import secure_filename

app = Flask(__name__)

ALLOWED_EXTENSIONS = {
    'docx', 'doc', 'xlsx', 'xls', 'pptx', 'ppt',
    'odt', 'ods', 'odp', 'rtf', 'csv', 'html', 'htm'
}

OUTPUT_FORMATS = {'pdf', 'docx', 'xlsx', 'html', 'txt', 'png'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/convert', methods=['POST'])
def convert():
    """Convert an uploaded document to the specified format."""
    if 'file' not in request.files:
        return jsonify({'error': 'No file uploaded'}), 400

    file = request.files['file']
    target_format = request.form.get('format', 'pdf').lower()

    if not allowed_file(file.filename):
        return jsonify({'error': f'Unsupported file type: {file.filename}'}), 400

    if target_format not in OUTPUT_FORMATS:
        return jsonify({'error': f'Unsupported output format: {target_format}'}), 400

    filename = secure_filename(file.filename)
    if not filename:
        return jsonify({'error': 'Invalid file name'}), 400

    # Save the uploaded file to a temporary directory
    with tempfile.TemporaryDirectory() as tmpdir:
        input_path = os.path.join(tmpdir, filename)
        file.save(input_path)
        profile_dir = os.path.join(tmpdir, 'lo-profile')

        # Run LibreOffice conversion
        result = subprocess.run([
            'libreoffice',
            '--headless',
            '--norestore',
            f'-env:UserInstallation={Path(profile_dir).as_uri()}',
            '--convert-to', target_format,
            '--outdir', tmpdir,
            input_path
        ], capture_output=True, text=True, timeout=120)

        if result.returncode != 0:
            return jsonify({'error': 'Conversion failed', 'details': result.stderr}), 500

        # Find the converted output file
        base_name = os.path.splitext(filename)[0]
        output_path = os.path.join(tmpdir, f'{base_name}.{target_format}')

        if not os.path.exists(output_path):
            return jsonify({'error': 'Output file not found'}), 500

        return send_file(
            output_path,
            as_attachment=True,
            download_name=f'{base_name}.{target_format}'
        )


@app.route('/health')
def health():
    return jsonify({'status': 'ok'})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)