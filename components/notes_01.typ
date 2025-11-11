#import "../core/i18n.typ": i18n

#let notes(lines) = {
  text(10pt, weight: "bold")[#i18n().notes]
  v(4pt)

  for _ in range(lines) {
    line(length: 100%, stroke: (paint: luma(70%), thickness: 0.5pt))

    v(9pt)
  }
}
