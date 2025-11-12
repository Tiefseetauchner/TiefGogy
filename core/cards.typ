#let card(
  title,
  content,
  width: auto,
  card-stroke: (paint: luma(90%), thickness: 2pt),
  title-font-color: none,
  title-fill: none,
  body-font-color: none,
  body-fill: none,
) = {
  title-font-color = if title-font-color == none { black } else { title-font-color }
  body-font-color = if body-font-color == none { black } else { body-font-color }

  context {
    let calc-width = if width == auto {
      let title-width = measure(title).width
      let content-width = measure(content).width
      calc.min(calc.max(title-width, content-width), 200pt)
    } else {
      width
    }

    stack(
      dir: ttb,
      box(
        radius: (top: 5pt),
        fill: title-fill,
        width: calc-width,
        inset: 10pt,
        stroke: card-stroke,
      )[#text(fill: title-font-color)[#title]],
      box(
        inset: 10pt,
        fill: body-fill,
        width: calc-width,
        radius: (bottom: 5pt),
        stroke: card-stroke,
      )[#text(fill: body-font-color)[#content]],
    )
  }
}
