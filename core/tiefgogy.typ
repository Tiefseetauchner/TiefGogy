#import "i18n.typ": i18n



#let tiefgogy = (
  setup: (
    title: none,
    show-name: false,
    page-counter: true,
    author: none,
    body,
  ) => {
    context {
      set document(
        title: title,
        author: "Template: Lena Tauchner <tiefseetauchner@lukechriswalker.at>"
          + if author != none { "Compiled by: " + author },
      )

      set text(font: "Unbounded", hyphenate: true)
      set page(
        margin: 24pt,
        footer: [
          #set text(size: 9pt, weight: "light")

          #if page-counter {
            context {
              let page-num = here().page()
              let page-count = counter(page).final()

              align(right)[ #i18n().page #page-num / #page-count.last() ]
            }
          },
        ],
      )

      if title != none {
        align(horizon)[
          #text(size: 68pt)[
            #title
          ]
          #v(-40pt)
          #if author != none { [by #author] }
        ]

        pagebreak()
      }

      show heading: it => {
        if it.level == 1 {
          set text(size: 12pt)
          table(
            stroke: none,
            columns: if show-name == none { auto } else { (70%, 30%) },
            inset: 0pt,
            row-gutter: 5pt,
            table.cell(
              [
                #set text(size: 2em)
                #it
              ],
            ),
            if type(show-name) == str {
              align(left + bottom)[#i18n().name: #text(weight: "light")[#show-name]]
            } else if show-name == true {
              align(left + bottom)[#i18n().name:]
            },
            table.cell(colspan: if show-name == none { 1 } else { 2 }, line(length: 100%)),
            v(3pt)
          )
          return
        }

        it
      }

      body
    }
  },
  title: (
    title,
    show-name: none,
  ) => {
    table(
      stroke: none,
      columns: if show-name == none { auto } else { (70%, 30%) },
      inset: 0pt,
      row-gutter: 5pt,
      table.cell(
        [
          #set text(size: 2em)
          #title
        ],
      ),
      if type(show-name) == str {
        align(left + bottom)[#i18n().name: #text(weight: "light")[#show-name]]
      } else if show-name == true {
        align(left + bottom)[#i18n().name:]
      },
      table.cell(colspan: if show-name == none { 1 } else { 2 }, line(length: 100%)),
    )
  },
)
