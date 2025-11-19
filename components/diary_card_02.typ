#import "../core/i18n.typ": i18n
#import "../core/common.typ": grid-stroke, weekdays-table

#let diary-card-dbt(problematic-behaviors: ()) = {
  context {
    stack(
      dir: ttb,
      weekdays-table(
        short-weekend-names: true,
        table-heading: i18n().dc2.headings.mood,
        row-height: 0pt,
        labels: (
          i18n().dc2.questions.trust-in-therapy,
          i18n().dc2.questions.self-compassion,
          i18n().dc2.questions.temp1,
          i18n().dc2.questions.recovering-sleep,
          i18n().dc2.questions.dissociative-symptoms,
          i18n().dc2.questions.trauma-intrusions,
          i18n().dc2.questions.intrusions-stress,
          i18n().dc2.questions.suicidal-thoughts,
        ),
      ),
      weekdays-table(
        short-weekend-names: true,
        table-heading: i18n().dc2.headings.new-ways,
        row-height: 0pt,
        labels: (
          (content: i18n().dc2.questions.new-ways-thought-of-tried, settings: (split: true)),
          i18n().dc2.questions.sports,
          i18n().dc2.questions.sufficient-fluid-intake,
          i18n().dc2.questions.comforting-activities,
          i18n().dc2.questions.did-therapy-tasks,
        ),
      ),
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
      },
      weekdays-table(
        short-weekend-names: true,
        table-heading: i18n().dc2.headings.sen-networks,
        row-height: 0pt,
        labels: (
          i18n().dc2.questions.sen-frequency,
          i18n().dc2.questions.sen-intensity,
        ),
      ),
    )
  }
}
