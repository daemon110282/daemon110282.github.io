# Markdown

- [Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Спецификации

- [CommonMark Spec](https://commonmark.org/help/)
- GitHub Flavored Markdown Spec [(GFM)](https://github.github.com/gfm/) - autolink literals, footnotes, strikethrough, tables, tasklists

## Настройки VS Code

1. [Markdown настройки](https://thisdavej.com/build-an-amazing-markdown-editor-using-visual-studio-code-and-pandoc/)
   1. [vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
   2. [Pandoc](http://pandoc.org/installing.html) для экспорта md в Word, RTF
      1. [vscode-pandoc](https://marketplace.visualstudio.com/items?itemName=DougFinke.vscode-pandoc)

## Технологии

- Web
  - [remark js](https://remark.js.org/)
    - plugin
      - [rehype-raw](https://github.com/rehypejs/rehype-raw) - HTML support
      - [remark-gfm](https://github.com/remarkjs/remark-gfm) - GFM Spec support
- Mobile
  - IOS
    - [swift-markdown](https://github.com/swiftlang/swift-markdown)
  - [Android](https://android-arsenal.com/tag/60?sort=updated&category=1)
    - [markwon](https://noties.io/Markwon/#supported-markdown-features)
      - All markdown features listed in commonmark spec are supported
      - including support for inlined/block HTML code, markdown tables, images and syntax highlight
