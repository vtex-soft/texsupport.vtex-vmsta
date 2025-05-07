# VMSTA journal document class

[https://www.vmsta.org/journal/VMSTA](https://www.vmsta.org/journal/VMSTA)

Distributed files include:

- `doc/vmstadoc.pdf` - author's instructions
- `vmsta_sample.tex` - LaTeX source for sample article
- `vmsta_sample.pdf` - a sample article
- `vmsta_template.tex` - LaTeX template file
- `sty/vmsta2.cls` - journal LaTeX class file
- `sty/vmsta2-dist.cls` - journal LaTeX class configuration file
- `bib/vmsta2-mathphys.bst` - BibTeX style
- `bib/biblio.bib` - BibTeX database sample
- `_config.yml` - settings for GitHub pages, just ignore it

## Compile

### Requirements

Minimal required version of LaTeX system is at least **2021**.

LuaLaTeX is preferable engine to compile, but pdfLaTeX works too.

### Command line

```
    lualatex paper
```

or

```
    pdflatex paper
```

Produce bbl:

```
    bibtex paper
```

## Note on version 2

-   Due to heavy recent years changes in the LaTeX kernel, VMSTA journal class was updated.
-   Main text and math font changed to new TX fonts.
-   Text box height adjusted and frame box added.
-   Couple minor changes in LaTeX template syntax.

## Troubleshooting

### Latin Modern add-ons

-   Due to some bugs (or aesthetic oddities) in the new TX fonts, Latin Modern alternatives added.
-   If You want turn them off use these document class options:
    -   `nolmlargesymbols` - restore main brackets from TX fonts;
    -   `nolmsymbols` - restore `\mathcal` from TX fonts;
    -   `nolmoperators` - restore `\bar` from TX font;
    -   `nolmaddons` - restore all the mentioned redefinitions from TX font.

## Bug reports

<p style="margin-left: 34pt;">
Please submit bug report, issues or feature requests to
<a href="mailto:latex-support@vtex.lt">latex-support@vtex.lt</a>.
</p>

VTeX UAB, 2025/05/07
