# TiefGogy

![Cover Image of TiefGogy, showcasing the different worksheets](./cover.png)

TiefGogy aims to be a resource to create and design worksheets for different kinds of fields. From therapy over pedagogy to architecting software solutions, everything\* is covered!

\* Barely anything.

## Usage

To use TiefGogy with the Typst web app, choose “Start from template” and select TiefGogy.

To import the package manually in your Typst project, use:

```typst
#import "@preview/tiefgogy:0.1.0": *
```

### Presets

Creates a page of tension logs. See [Components](#components) for more information.

```typst
#let preset-tension-log(
  count: 2, // How many tension logs to display
  show-notes: true, // Whether to show notes after the tension logs
  notes-lines: 4, // How many lines to display for the notes
  name: true, // Whether to display a name or, if content, display said name
  start: 6, // See components/tension-log
  end: 2, // See components/tension-log
  scale-max: 100, // See components/tension-log
  scale-min: 0, // See components/tension-log
  scale-step: 10, // See components/tension-log
  danger-at: 70, // See components/tension-log
  start-date: none, // The date to start the tension logs at. Counts up for each tension log.
)
```

### tiefgogy

Basic setup is done via tiefgogy.setup:

```typst
// Sets up formatting for tiefgogy, like font, margins, ...
#show: tiefgogy.setup.with(
    title: none, // if set, creates a title page and sets the document title
    show-name: false, // if set, displays a name field next to headings of level 1
    page-counter: true, // if true, will display a page counter in the bottom right corner
    author: none, // if set, will display an author on the title page and set the document author
)
```

To display a title without using h1, use tiefgogy.title:

```typst
// Displays a page title, equivalent to h1 but with more control
#(tiefgogy.title)(
    "Title",
    show-name: false, // if set to true, will display a name field. If set to a string or content, will display that in the name field
)
```

### Localization

Tiefgogy is localized. Currently, deutsch-de and english-us are supported:

```typst
#select-language(languages.english-us)
```

### Components

`tension-log` creates a tension log to track the amount of inner tension over a day.

```typst
#tension-log(
  start: 6, // Hour to start at
  end: 2, // Hour to count up to
  scale-max: 100, // Maximum of scale
  scale-min: 0, // Minimum of scale
  scale-step: 10, // How much to increase the steps by
  danger-at: 70, // Marked line
  date: none, // Display a preset date in the date field
) 
```

`notes` displays lines for notes.

```typst
#notes(
    3 // number of lines to display
)
```

`events-diary` creates a week overview of good and bad events as well as, optionally, a best and worst event line

```typst
#events-diary(
    show-best-and-worst-event: true // whether to display the best and worst event fields
)
```

`diary-card` is a function to create a useful diary of feelings and good and bad habits.

```typst
#diary-card(
    problematic-behaviors: () // A list of problematic behaviors to list with pressure to act upon and whether one acted upon the pressure fields
)
```

`card` is a basic card displayed to fill with information.

```typst
#card(
    width: auto, // how wide the card should be
    card-stroke: (paint: luma(90%), thickness: 2pt), // Stroke of the card
    title-font-color: none, // color of the text in the title field
    title-fill: none, // color of the fill in the title field
    body-font-color: none, // color of the text in the main field
    body-fill: none, // color of the fill in the main field
)[Title][
    Body text
]
```

## License and Contributions

TiefGogy is currently under semi active development. Feedback, bug reports, and suggestions are welcome. Please open an issue or contribute via pull requests if you have ideas for improvement.

This package is released under the MIT License.
