//==============================================================================
// report_template.typ - v0.1
// 2025-07-17 Erik Frisk
// Small template for reports

#import "@preview/lovelace:0.3.0": *

#let report(
  title: [Report Title],
  authors: (
    (
      name: "John Doe",
      liuid: "johndoe",
      email: "email@example.com",
    ),
    (
      name: "Samuel Åkesson",
      liuid: "sermuns",
      email: "email@example.com",
    ),
  ),
  size: 10pt,
  lang: "en",
  date: none,
  font: "New Computer Modern",
  body,
) = {
  let lang_strings = (
    "en": (
      email: "E-mail",
      references: "References",
      section: "Section",
      algorithm: "Algorithm",
      figure: "Figure",
      table: "Table",
    ),
    "sv": (
      email: "E-post",
      references: "Referenser",
      section: "Avsnitt",
      algorithm: "Algoritm",
      figure: "Figur",
      table: "Tabell",
    ),
  )

  set page(paper: "a4")
  set text(lang: lang, size: size, font: font)
  set par(justify: true, leading: .8em)

  set bibliography(
    title: lang_strings.at(lang).at("references"),
    style: "the-institution-of-engineering-and-technology",
  )

  show link: set text(blue.darken(30%))
  show heading.where(level: 2): set heading(numbering: none)
  show heading: set block(below: 1.0em, above: 2em)
  set heading(numbering: "1.")
  set heading(supplement: lang_strings.at(lang).at("section"))

  set math.equation(numbering: "(1)")
  set math.mat(delim: "[")

  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location()),
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  show figure: set block(above: 2em, below: 2em)

  show figure.where(kind: raw): set figure.caption(position: top)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)

  show figure.where(kind: "algorithm"): set figure(
    supplement: lang_strings.at(lang).at("algorithm"),
    gap: 0.8em,
  )
  show figure.where(kind: image): set figure(
    supplement: lang_strings.at(lang).at("figure"),
  )
  show figure.where(kind: table): set figure(
    supplement: lang_strings.at(lang).at("table"),
    gap: 0.8em,
  )

  show raw: set text(font: "IBM Plex Mono")

  // A nice little background for python and matlab code, with line numbers
  show raw.where(lang: "python"): it => {
    show raw.line: line => {
      text(fill: gray)[#line.number]
      h(1em)
      line.body
    }
    box(fill: luma(96%), inset: 0.55em, it)
  }

  // Make "Figure X" .. "Table Y" *bold*
  show figure.caption: it => {
    show regex("^\w+\s\d+:"): strong
    it
  }

  // Start title page
  set page(footer: [
    #h(1fr)
    #if date == none {
      text(size: 10pt, emph(datetime.today().display()))
    } else {
      text(size: 10pt, emph(date))
    }
  ])
  grid(
    align: (right, left),
    columns: (0.112fr, 0.8fr),
    column-gutter: 15mm,
    [
      // #context v(page.height * 0.10 / 4 - 1.5em)
      #line(angle: 90deg, length: 99%, stroke: 1.0pt)
    ],
    [#box(height: 96%, stroke: 0pt)[
        #set par(justify: false)
        #context v(page.height * 0.10 / 2 + 5em)

        #text(size: 22pt, weight: "regular", title)

        #v(1fr)

        #for author in authors {
          text(size: 12pt, weight: "regular")[
            #upper(author.name)
            #if author.keys().contains("email") [
              #linebreak()
              #h(7mm)
              #lang_strings.at(lang).at("email"): #author.email
            ]
            #if author.keys().contains("liuid") [
              #linebreak()
              #h(7mm)
              // #h(1fr)
              LiU-ID: #author.liuid
            ]
            #linebreak()
            #v(0.1em)
          ]
        }
      ]
    ],
  )
  counter(page).update(0)
  pagebreak()
  set page(footer: none)
  set page(header: [
    #set text(size: 10pt)
    #h(1fr)
    #context counter(page).display()
    #line(length: 100%, stroke: 0.5pt, start: (0mm, -3mm))
  ])
  body
}

#let nonumeq(eq) = {
  set math.equation(numbering: none)
  eq
}

// Style algorithms a little nicer
#let pseudocode-list = pseudocode-list.with(
  booktabs: true,
  booktabs-stroke: 1pt + black,
  hooks: 0.75em,
  line-gap: 1em,
)
