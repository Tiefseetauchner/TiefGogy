#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, weekdays-table

/// Creates a simple diary card with common questions about different relevant areas of life
/// to mark over one week.
#let diary-card(problematic-behaviors: ()) = {
  context {
    weekdays-table(
      short-weekend-names: true,
      table-heading: i18n().dc1.headings.mood,
      row-height: 0pt,
      labels: (
        i18n().dc1.questions.trust-in-therapy,
        i18n().dc1.questions.dissociative-symptoms,
        i18n().dc1.questions.trauma-intrusions,
        i18n().dc1.questions.intrusions-stress,
        i18n().dc1.questions.sleep-quality,
      ),
    )
    weekdays-table(
      short-weekend-names: true,
      table-heading: i18n().dc1.headings.emotional-space,
      row-height: 0pt,
      labels: (
        i18n().dc1.questions.feeling-of-emotions,
        i18n().dc1.questions.categorizing-of-emotions,
        i18n().dc1.questions.access-to-emotions,
      ),
    )
    weekdays-table(
      short-weekend-names: true,
      table-heading: i18n().dc1.headings.self-care,
      row-height: 0pt,
      labels: (
        i18n().dc1.questions.did-eat,
        i18n().dc1.questions.enough-fluids,
        (content: i18n().dc1.questions.showered-brushed-teeth, settings: (split: true)),
      ),
    )
    if problematic-behaviors != none and (type(problematic-behaviors) == int or problematic-behaviors.len() != 0) {
      let c = if type(problematic-behaviors) == int {
        problematic-behaviors
      } else {
        problematic-behaviors.len
      }
      let problematic-behaviors-list = if type(problematic-behaviors) == int {
        range(problematic-behaviors).map(_ => none)
      } else {
        problematic-behaviors
      }
      weekdays-table(
        short-weekend-names: true,
        table-heading: i18n().dc2.headings.problematic-behavior,
        row-height: 0pt,
        labels: range(c)
          .map(i => {
            let b = problematic-behaviors-list.at(i)
            (
              if b == none {
                grid(
                  columns: 2,
                  gutter: 5pt,
                  (i18n().dc2.questions.problematic-behavior)(i + 1), align(left + bottom, line(length: 80%)),
                )
              } else {
                [#(i18n().dc2.questions.problematic-behavior)(i + 1) #b]
              },
              (content: i18n().dc2.questions.pressure-acted-upon, settings: (split: true)),
            )
          })
          .flatten(),
      )
    }
  }
}
