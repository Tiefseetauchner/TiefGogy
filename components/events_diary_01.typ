#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke

#let row-cells(label, column-count, align: left + horizon, fill: none) = {
  (
    table.cell(align: align, fill: fill)[
      #label
    ],
    ..range(column-count).map(_ => table.cell(inset: (y: 25pt), fill: fill)[]),
  )
}

#let weekend-cells(align: left + horizon, fill: none) = {
  (
    table.cell(align: align, fill: fill, i18n().weekdays.monday),
    table.cell(align: align, fill: fill, i18n().weekdays.tuesday),
    table.cell(align: align, fill: fill, i18n().weekdays.wednesday),
    table.cell(align: align, fill: fill, i18n().weekdays.thursday),
    table.cell(align: align, fill: fill, i18n().weekdays.friday),
    table.cell(align: align, fill: fill, i18n().weekdays.saturday),
    table.cell(align: align, fill: fill, i18n().weekdays.sunday),
  )
}

#let events-diary() = {
  context {
    grid(columns: (1fr, 1fr))[
      #i18n().week-from #h(30pt) #i18n().week-to-only-to
    ][
      #i18n().medication:
    ]
    {
      set text(size: 7.5pt)
      table(
        stroke: grid-stroke,
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        table.header(i18n().what-happened, ..weekend-cells(align: center + horizon)),
        ..row-cells(i18n().positive-events, 7),
        ..row-cells(i18n().negative-events, 7),
        table.cell(colspan: 4, inset: (y: 10pt))[
          #i18n().most-positive-event:
        ],
        table.cell(colspan: 4, inset: (y: 10pt))[
          #i18n().most-negative-event:
        ],
      )
    }
  }
}
