#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, row-cells, weekdays-table

/// An events diary logging good and bad events over one week.
#let events-diary(show-best-and-worst-event: true, table-height: none) = {
  if table-height == none { table-height = 50pt }
  context {
    grid(columns: (1fr, 1fr))[
      #i18n().week-from #h(70pt) #i18n().week-to-only-to
    ][
      #i18n().medication:
    ]
    {
      stack(
        dir: ttb,
        weekdays-table(
          first-col-width: 1fr,
          labels: (
            i18n().positive-events,
            i18n().negative-events,
          ),
          row-height: table-height,
        ),
        table(columns: (1fr, 1fr), stroke: grid-stroke)[
          #text(size: 7.5pt)[
            #i18n().most-positive-event:]
        ][
          #text(size: 7.5pt)[
            #i18n().most-negative-event:]
        ],
      )
    }
  }
}
