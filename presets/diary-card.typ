#import "../core/tiefgogy.typ": tiefgogy
#import "../components/events_diary_01.typ": events-diary
#import "../components/diary_card_01.typ": diary-card
#import "../core/i18n.typ": i18n

#let preset-diary-card(
  problematic-behaviors: 2,
  name: true,
  set-document-properties: true,
) = {
  context {
    show: tiefgogy.setup.with(
      title: i18n().diary-card,
      set-document-properties: set-document-properties,
      show-name: name,
      page-counter: false,
    )
    (tiefgogy.title)(i18n().diary-card, show-name: name)
    events-diary(table-height: 60pt)
    diary-card(problematic-behaviors: problematic-behaviors)
  }
}
