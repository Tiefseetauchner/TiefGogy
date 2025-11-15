#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, row-cells, weekdays-table

/// An events diary logging good and bad events over one week.
#let events-diary(show-best-and-worst-event: true) = {
  context {
    grid(columns: (1fr, 1fr))[
      #i18n().week-from #h(70pt) #i18n().week-to-only-to
    ][
      #i18n().medication:
    ]
    {
      weekdays-table(
        first-col-width: 1fr,
        labels: (
          i18n().positive-events,
          i18n().negative-events,
        ),
        row-height: 50pt,
      )
      grid(columns: (1fr, 1fr))[
        #i18n().most-positive-event:
      ][
        #i18n().most-negative-event:
      ]
      v(10pt)
    }
  }
}
