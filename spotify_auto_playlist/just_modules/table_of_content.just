# Generate all `table of content (TOC)` listed here
[group('toc')]
@tocs:
    echo "{{BLUE}}Generating all TOCs{{NORMAL}} ..."
    just toc-readme
    just toc-claude
    just toc-todo
    echo "{{GREEN}}All TOCs generated{{NORMAL}}"

[group('toc')]
[private]
@toc file_path:
    echo "{{BLUE}}Generating TOC for {{file_path}}{{NORMAL}}"
    gh-md-toc --insert --no-backup --hide-footer {{file_path}}
    echo "{{GREEN}}{{file_path}} generated{{NORMAL}}"

# Generate `table of content (TOC)` for README.md
[group('toc')]
[private]
@toc-readme:
    @just toc README.md

# Generate `table of content (TOC)` for CLAUDE.md
[group('toc')]
[private]
@toc-claude:
    @just toc CLAUDE.md

# Generate `table of content (TOC)` for TODO.md
[group('toc')]
[private]
@toc-todo:
    @just toc TODO.md



