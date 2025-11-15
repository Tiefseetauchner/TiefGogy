#import "i18n.typ": i18n

#let grid-stroke = (paint: luma(70%), thickness: 0.8pt)

#let row-cells(label, column-count, alignment: left + horizon, fill: none, height: none) = {
  if height == none {
    height = 25pt
  }

  (
    table.cell(align: alignment, fill: fill)[
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

#let weekdays-cells(alignment: left + horizon, fill: none) = {
  (
    table.cell(align: alignment, fill: fill, i18n().weekdays.monday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.tuesday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.wednesday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.thursday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.friday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.saturday),
    table.cell(align: alignment, fill: fill, i18n().weekdays.sunday),
  )
}

#let weekdays-short-cells(alignment: left + horizon, fill: none) = {
  (
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.monday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.tuesday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.wednesday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.thursday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.friday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.saturday),
    table.cell(align: alignment, fill: fill, i18n().weekdays-short.sunday),
  )
}

#let weekdays-table(
  short-weekend-names: false,
  table-heading: none,
  labels: (),
  row-height: none,
  first-col-width: 50%,
) = {
  set text(size: 7.5pt)

  table(
    columns: (first-col-width, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: grid-stroke,
    table.header(
      table-heading,
      ..if short-weekend-names {
        weekdays-short-cells(alignment: center + horizon)
      } else {
        weekdays-cells(alignment: center + horizon)
      },
    ),
    ..labels
      .map(label => {
        if type(label) == dictionary and label.at("settings", default: none) != none {
          if label.settings.at("split", default: false) {
            split-row-cells(
              label.content,
              7,
              height: label.settings.at("height", default: row-height),
              alignment: label.settings.at("alignment", default: left + horizon),
              fill: label.settings.at("fill", default: none),
            )
          } else {
            row-cells(
              label.content,
              7,
              height: label.settings.at("height", default: row-height),
              alignment: label.settings.at("alignment", default: left + horizon),
              fill: label.settings.at("fill", default: none),
            )
          }
        } else {
          row-cells(label, 7, height: row-height)
        }
      })
      .flatten(),
  )
}
