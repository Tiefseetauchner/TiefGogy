#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke

/// A tension log logging the tension over a day.
#let tension-log(
  start: 6,
  end: 2,
  scale-max: 100,
  scale-min: 0,
  scale-step: 10,
  danger-at: 70,
  date: none,
) = {
  let hour-cells(start, count) = {
    let hours = range(count)
    hours.map(h => {
      table.cell(inset: (x: 0pt, y: 12pt))[
        #set text(size: 7.5pt)
        #rotate(45deg)[#datetime.display(
          datetime(hour: calc.rem(h + start, 24), minute: 0, second: 0),
          "[hour]:[minute]",
        )]
      ]
    })
  }

  let row-cells(s, start, end, danger-at) = {
    let column-count = end - start + 1
    if column-count < 1 {
      column-count += 24
    }
    let is-danger = s >= danger-at and s < danger-at + scale-step
    let fill = if is-danger { luma(90%) } else { white }
    (
      table.cell(
        fill: fill,
        stroke: grid-stroke,
        inset: (x: 2pt, y: 4pt),
      )[
        #set text(size: 7.5pt, weight: if is-danger { "bold" } else { "regular" })
        #s
      ],
      ..range(column-count).map(_ => table.cell(fill: fill, stroke: grid-stroke)[]),
    )
  }

  let scale-rows(max, step) = {
    range(max, -1, step: -step)
  }


  let header() = context {
    grid(
      columns: (70%, 30%),
    )[][
      #i18n().date: #{ if type(date) == datetime { text(size: 9pt, weight: "light")[#date.display("[day].[month].[year]")] } }
      #line(length: 100%)
    ]
  }

  box()[
    #header()
    #v(10pt)


    #let column-count = end - start + 1
    #if column-count < 1 {
      column-count += 24
    }

    #table(
      columns: (1.1fr, ..range(column-count).map(_ => 1fr)),
      align: center,
      inset: (x: 2pt, y: 2pt),
      stroke: (x: grid-stroke, y: grid-stroke),

      table.header(
        [
          #table.cell()[]
        ],
        ..hour-cells(start, column-count),
      ),

      ..scale-rows(scale-max, scale-step)
        .map(s => {
          (
            ..row-cells(s, start, end, danger-at),
          )
        })
        .flatten(),
    )
  ]
}
