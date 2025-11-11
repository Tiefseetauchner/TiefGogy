#import "../core/i18n.typ": i18n



#let row-cells(label, column-count) = {
  (
    table.cell(
      stroke: grid-stroke,
      inset: (x: 2pt, y: 4pt),
    )[
      #set text(size: 7.5pt, weight: if is-danger { "bold" } else { "regular" })
      #s
    ],
    ..range(column-count).map(_ => table.cell(fill: fill, stroke: grid-stroke)[]),
  )
}

#let diary-log() = {
  context {
    grid(columns: (1fr, 1fr))[
      #i18n().week-from #h(30pt) #i18n().week-to-only-to
    ][
      #i18n().medication:
    ]
  }
  table(
    colums: 8,
    ..row-cells(i18n().)
  )
}
