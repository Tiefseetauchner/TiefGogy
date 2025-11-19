#import "i18n.typ": i18n

#let title-text(
  title,
  show-name: none,
) = {
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
}

/// Base methods of tiefgogy
///
/// - `setup(title: none, show-name: false, page-counter: true, author: none, body)`: Sets up TiefGogy
///   - `title`: Generates a title page and sets the title of the document
///   - `show-title-page`: Whether or not to display a title page
///   - `show-name`: Whether the name field should be shown with headings
///   - `page-counter`: Whether a page counter should be shown
///   - `author`: Sets the 'Compiled by:' of the output document
/// - `title(title, show-name: none)`: Generates a title if headings of level one are not desired
///   - `title`: The title to be shown (positional)
///   - `show-name`: Whether to show a name
#let tiefgogy = (
  setup: (
    title: none,
    show-title-page: false,
    author: none,
    show-name: false,
    page-counter: true,
    set-document-properties: true,
    body,
  ) => {
    context {
      if set-document-properties {
        set document(
          title: title,
          author: i18n().meta.template
            + ": Lena Tauchner <tiefseetauchner@lukechriswalker.at>"
            + if author != none { i18n().meta.compiled-by + ": " + author },
        )
      }
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

      if show-title-page and title != none {
        align(horizon)[
          #text(size: 68pt)[
            #title
          ]
          #v(-40pt)
          #if author != none { [#i18n().meta.by #author] }
        ]

        pagebreak()
      }

      show heading: it => {
        if it.level == 1 {
          set text(size: 12pt)
          title-text(it, show-name: show-name)
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
    context {
      title-text(title, show-name: show-name)
    }
  },
)
