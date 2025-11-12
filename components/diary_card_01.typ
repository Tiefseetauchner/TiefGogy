#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, row-cells, split-row-cells, weekdays-short-table

#let diary-card() = {
  context {
    {
      weekdays-short-table(
        table-heading: [Befinden],
        row-height: 0pt,
        labels: (
          [Example 1],
          [Example 2],
          [Example 3],
          [Example 4],
          [Example 5],
        ),
      )
    }
  }
}
