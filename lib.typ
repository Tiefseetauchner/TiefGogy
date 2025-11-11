#import "core/i18n.typ": i18n, languages, select-language
#import "components/stress_protocol_01.typ": stressprotocoll

#let tiefgogy(
  title: none,
  name: none,
  page-counter: true,
  body,
) = {
  context {
    set text(font: "Unbounded", hyphenate: true)
    set page(
      margin: 24pt,
      footer: [
        #set text(size: 9pt, weight: "light")
        #align(left)[2025 Lena Tauchner]

        #if page-counter {
          context {
            let page-num = here().page()
            let page-count = counter(page).final()

            align(right)[ #i18n().page #page-num / #page-count.last() ]
          }
        },
      ],
    )

    table(
      stroke: none,
      columns: (70%, 30%),
      inset: 0pt,
      row-gutter: 5pt,
      table.cell(
        [
          #set text(size: 2em)
          #title
        ],
        colspan: if name == none { 2 } else { 1 },
      ),
      if type(name) == str {
        name
      } else if name == true {
        align(left + bottom)[#i18n().name:]
      },
      table.cell(colspan: 2, line(length: 100%)),
    )

    body
  }
}
