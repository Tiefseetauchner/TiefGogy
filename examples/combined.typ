#import "@preview/tiefgogy:0.1.0": *

#show: tiefgogy.setup.with(
  title: "My weekly log",
  show-name: true,
  author: "Tiefseetauchner",
)

#set page(flipped: true)

#diary-card()

#pagebreak(weak: true)
#set page(flipped: false)

= Tension log

#tension-log()
#tension-log()
#tension-log()

#pagebreak(weak: true)

= Tension log

#tension-log()
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  card(width: 100%)[What is tension?][
    Tension is a feeling in your body. It could be, for example, a pressure in your chest. Tension is not inherently bad, but at too high levels, it can be detremental to your health.
  ],
  card(width: 100%)[What is a tension log?][
    A tension log helps categorizing your tension and helps you know when you should apply skills to lower tension. Tension logs have a threshold at which the tension is unbearable.
  ],
)
#notes(17)
