#import "i18n.typ": i18n

#let grid-stroke = (paint: luma(70%), thickness: 0.8pt)

#let row-cells(label, column-count, align: left + horizon, fill: none, height: none) = {
  if height == none {
    height = 25pt
  }

  (
    table.cell(align: align, fill: fill)[
      #label
    ],
    ..range(column-count).map(_ => table.cell(inset: (y: height / 2), fill: fill)[]),
  )
}

#let split-row-cells(label, column-count, alignment: left + horizon, fill: none, height: 25pt) = {
  (
    table.cell(align: alignment, fill: fill)[
      #label
    ],
    ..range(column-count).map(_ => table.cell(inset: (y: height / 2), fill: fill)[#align(center + horizon)[|]]),
  )
}

#let weekdays-cells(align: left + horizon, fill: none) = {
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

#let weekdays-short-cells(align: left + horizon, fill: none) = {
  (
    table.cell(align: align, fill: fill, i18n().weekdays-short.monday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.tuesday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.wednesday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.thursday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.friday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.saturday),
    table.cell(align: align, fill: fill, i18n().weekdays-short.sunday),
  )
}

#let weekdays-table(table-heading: none, labels: (), row-height: none) = {
  set text(size: 7.5pt)

  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: grid-stroke,
    table.header(table-heading, ..weekdays-cells(align: center + horizon)),
    ..labels
      .map(label => {
        row-cells(label, 7, height: row-height)
      })
      .flatten(),
  )
}

#let weekdays-short-table(table-heading: none, labels: (), row-height: none) = {
  set text(size: 7.5pt)

  table(
    columns: (50%, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: grid-stroke,
    table.header(table-heading, ..weekdays-short-cells(align: center + horizon)),
    ..labels
      .map(label => {
        row-cells(label, 7, height: row-height)
      })
      .flatten(),
  )
}
