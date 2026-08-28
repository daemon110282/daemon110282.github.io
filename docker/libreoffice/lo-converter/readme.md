# lo-converter

https://oneuptime.com/blog/post/2026-02-08-how-to-run-libreoffice-in-docker-for-document-conversion/view
https://smyt.ru/blog/sozdaem-server-dlya-konvertacii-docx-v-pdf/

## Image

docker build -t lo-converter .

## Convert a file to PDF using LibreOffice in headless mode

### Word document to PDF

docker run --rm -v $(pwd)/docs:/docs lo-converter --headless --convert-to pdf --outdir /docs /docs/report.docx

### Excel spreadsheet to PDF

docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/q_broker_print_settings.xlsx
docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/q_reestr_print_settings.xls
docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/a_depo_print_settings.xlsx
docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/a_broker_print_settings.xlsx

### PowerPoint presentation to PDF

docker run --rm -v $(pwd)/docs:/docs lo-converter --headless --convert-to pdf --outdir /docs /docs/slides.pptx

### HTML to PDF

docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/a_reestr.htm

docker run --rm -v "$(pwd)/docs:/docs" lo-converter --headless --convert-to pdf --outdir /docs /docs/a_reestr_print_settings.html
