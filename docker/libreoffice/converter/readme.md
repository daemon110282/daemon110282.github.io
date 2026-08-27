# Conversion API

https://oneuptime.com/blog/post/2026-02-08-how-to-run-libreoffice-in-docker-for-document-conversion/view

## Convert a Word document to PDF via the HTTP API

curl -X POST http://localhost:5000/convert \
  -F "file=@report.docx" \
  -F "format=pdf" \
  --output report.pdf

## Convert an Excel file to PDF

curl -X POST http://localhost:5000/convert \
  -F "file=@financials.xlsx" \
  -F "format=pdf" \
  --output financials.pdf