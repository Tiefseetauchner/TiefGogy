/// List of available languages.
#let languages = (
  english-us: "en-us",
  deutsch-de: "de-de",
)

#let lang = state("language-state", languages.english-us)

/// Selects a language to use in the document. Select from `languages`.
#let select-language(language) = {
  lang.update(language)
}

#let i18n() = {
  let i18n-en-us = (
    page: "Page",
    name: "Name",
    date: "Date",
    condition: "Condition",
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
    self-harm: "Self harm",
    weekdays: (
      monday: "Monday",
      tuesday: "Tuesday",
      wednesday: "Wednesday",
      thursday: "Thursday",
      friday: "Friday",
      saturday: "Saturday",
      sunday: "Sunday",
    ),
    weekdays-short: (
      monday: "Mo",
      tuesday: "Tu",
      wednesday: "We",
      thursday: "Th",
      friday: "Fr",
      saturday: "Sa",
      sunday: "Su",
    ),
    dc1: (
      headings: (
        mood: [Mood],
        emotional-space: [Emotional space],
        self-care: [Self care],
        problematic-behavior: [Problematic behavior],
      ),
      questions: (
        trust-in-therapy: [*Trust in therapy?* (from 0 = not at all to 5 = a lot)],
        dissociative-symptoms: [*Dissociative symptoms?* (from 0 = none to 5 = many)],
        trauma-intrusions: [*Trauma related intrusions?* (Count per day)],
        intrusions-stress: [*Stress caused by intrusions?* (from 0 = not at all to 5 = extremely strong)],
        sleep-quality: [*Sleep Quality?* (from 0 = very bad to 5 = amazing)],
        feeling-of-emotions: [*Sense of own emotions?* (from 0 = not at all to 5 = very strongly)],
        categorizing-of-emotions: [*Categorizing of own emotions?* (from 0 = not at all to 5 = very well)],
        access-to-emotions: [*Access to own emotions?* (from 0 = not at all to 5 = very possible)],
        did-eat: [*Ate something?* (Yes/No)],
        enough-fluids: [*Sufficient hydration?* (In cups)],
        showered-brushed-teeth: [*Showered?* | *Brushed teeth?* (Yes/No)],
        pressure: [Pressure to act? (from 0 = not at all to 5 = extremely strong)],
        acted-upon: [Did act? (Yes/No)],
      ),
    ),
  )

  let i18n-de-de = (
    page: "Seite",
    name: "Name",
    date: "Datum",
    condition: "Befinden",
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
    self-harm: "Selbstverletzung",
    weekdays: (
      monday: "Montag",
      tuesday: "Dienstag",
      wednesday: "Mittwoch",
      thursday: "Donnerstag",
      friday: "Freitag",
      saturday: "Samstag",
      sunday: "Sonntag",
    ),
    weekdays-short: (
      monday: "Mo",
      tuesday: "Di",
      wednesday: "Mi",
      thursday: "Do",
      friday: "Fr",
      saturday: "Sa",
      sunday: "So",
    ),
    dc1: (
      headings: (
        mood: [Befinden],
        emotional-space: [Emotionale Welt],
        self-care: [Selfcare],
        problematic-behavior: [Problemverhalten],
      ),
      questions: (
        trust-in-therapy: [*Vertrauen in die Therapie?* (von 0 = gar nicht bis 5 = sehr gut)],
        dissociative-symptoms: [*Dissoziative Symptome?* (von 0 = gar keine bis 5 = sehr viele)],
        trauma-intrusions: [*Traumabezogene Intrusionen?* (Anzahl pro Tag)],
        intrusions-stress: [*Intusionen Belastung?* (von 0 = gar nicht bis 5 = sehr stark)],
        sleep-quality: [*Schlafqualität?* (von 0 = sehr schlecht bis 5 = ausgezeichnet)],
        feeling-of-emotions: [*Wahrnehmen der eigenen Emotionen?* (von 0 = gar nicht bis 5 = sehr stark)],
        categorizing-of-emotions: [*Einordnen der eigenen Emotionen?* (von 0 = gar nicht bis 5 = sehr gut)],
        access-to-emotions: [*Zugriff auf eigene Emotionen?* (von 0 = gar nicht bis 5 = sehr gut)],
        did-eat: [*Mahlzeit eingenommen?* (Ja/Nein)],
        enough-fluids: [*Ausreichend Flüssigkeit?* (Angabe in Litern)],
        showered-brushed-teeth: [*Geduscht?* | *Zähne geputzt?* (Ja/Nein)],
        pressure: [Drang? (von 0 = gar nicht bis 5 = sehr stark)],
        acted-upon: [Handlung? (Ja/Nein)],
      ),
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
