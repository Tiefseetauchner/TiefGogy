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
    medication: "Medication",
    what-happened: "What happened?",
    positive-events: "Comforting events",
    most-positive-event: "Most comforting event",
    negative-events: "Discomforting events",
    most-negative-event: "Most discomforting event",
    weekdays: (
      monday: "Monday",
      tuesday: "Tuesday",
      wednesday: "Wednesday",
      thursday: "Thursday",
      friday: "Friday",
      saturday: "Saturday",
      sunday: "Sunday",
    ),
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
    medication: "Medikation",
    what-happened: "Was ist passiert?",
    positive-events: "Angenehme Ereignisse",
    most-positive-event: "Angenehmstes Event",
    negative-events: "Unangenehme Ereignisse",
    most-negative-event: "Unangenehmstes Event",
    weekdays: (
      monday: "Montag",
      tuesday: "Dienstag",
      wednesday: "Mittwoch",
      thursday: "Donnerstag",
      friday: "Freitag",
      saturday: "Samstag",
      sunday: "Sonntag",
    ),
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
