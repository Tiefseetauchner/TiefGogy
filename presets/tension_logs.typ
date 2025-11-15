#import "../components/tension_log_01.typ": tension-log
#import "../components/notes_01.typ": notes
#import "../core/i18n.typ": i18n
#import "../core/tiefgogy.typ": tiefgogy

/// Preset to generate a tension log page.
#let preset-tension-log(
  count: 2,
  show-notes: true,
  notes-lines: 4,
  name: true,
  start: 6,
  end: 2,
  scale-max: 100,
  scale-min: 0,
  scale-step: 10,
  danger-at: 70,
  start-date: none,
) = {
  context {
    show: tiefgogy.setup.with(show-name: name, page-counter: false)
    (tiefgogy.title)(i18n().tension-log)

    for i in range(count) {
      let date = if type(start-date) == datetime {
        start-date + duration(days: i)
      } else { none }

      tension-log(
        start: start,
        end: end,
        scale-max: scale-max,
        scale-min: scale-min,
        scale-step: scale-step,
        danger-at: danger-at,
        date: date,
      )

      v(6pt)
      if show-notes {
        notes(notes-lines)
      }
    }
  }
}
