#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, weekdays-table

#let diary-card(problematic-behaviors: ()) = {
  context {
    {
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
      if problematic-behaviors != none and problematic-behaviors.len() != 0 {
        weekdays-table(
          short-weekend-names: true,
          table-heading: i18n().dc1.headings.problematic-behavior,
          row-height: 0pt,
          labels: problematic-behaviors
            .map(b => {
              (
                [*#b*],
                i18n().dc1.questions.pressure,
                i18n().dc1.questions.acted-upon,
              )
            })
            .flatten(),
        )
      }
    }
  }
}
