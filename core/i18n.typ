#let languages = (
  english-us: "en-us",
  deutsch-de: "de-de",
)

#let lang = state("language-state", languages.english-us)

#let select-language(language) = {
  lang.update(language)
}

#let i18n() = {
  let i18n-en-us = (
    page: "Page",
    name: "Name",
    date: "Date",
    notes: "Notes",
    tension-log: "Tension log",
    week-from: "Week from",
    week-to-only-to: "to",
    week-to: "Week to",
    medication: "Medication"
  )

  let i18n-de-de = (
    page: "Seite",
    name: "Name",
    date: "Datum",
    notes: "Notizen",
    tension-log: "Spannungsprotokoll",
    week-from: "Woche vom",
    week-to-only-to: "bis",
    week-to: "Woche bis",
    medication: "Medikation"
  )

  let sel-lang = lang.final()

  if sel-lang == languages.english-us {
    i18n-en-us
  } else if sel-lang == languages.deutsch-de {
    i18n-de-de
  } else {
    assert(false, message: "Selected language '" + sel-lang + "' is not available yet.")
  }
}
