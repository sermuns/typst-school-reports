#let darken(..args) = {
  let output = ()
  for this in args.pos() {
    output.push(table.cell(fill: black.lighten(85%), this))
  }
  output
}

#let style(details, body) = {
  let group = "PUM02"
  let version = if "version" in details {
    details.version
  } else {
    details.history.at(0)
  }
  let date = if "date" in details {
    details.date
  } else {
    details.history.at(1)
  }

  set document(
    date: toml(bytes("date = " + date)).date,
    title: details.title,
  )
  set text(
    font: "New Computer Modern",
    size: 12pt,
    lang: "sv",
  )
  show raw: set text(font: "IBM Plex Mono")
  set page(margin: 2cm)
  set table(
    fill: (x, y) => {
      if y == 0 { black.lighten(70%) }
    },
  )

  set bibliography(style: "ieee.csl")

  // Tabelltexter ska vara ovanpå tabeller.
  show figure.where(kind: table): set figure.caption(position: top)

  // Figurer som kan brytas upp tillåts brytas upp.
  show figure: set block(breakable: true)

  show figure: pad.with(y: 1em)

  // Gör "Figur X" .. "Tabel Y" i *fet stil*
  show figure.caption: it => {
    // matchar exempelvis "Figur 1", "Tabell 2"...
    show regex("^\w+\s\d+:"): strong
    it
  }

  show heading: text.with(font: "Source sans pro")

  show outline.entry: it => {
    v(2pt)
    if it.level != 1 { return it }
    v(5pt)
    strong(it)
  }

  {
    // titelsida
    set page(header: none, footer: none)
    set align(center)
    set par(spacing: 20pt)
    v(1fr)

    line(length: 100%)
    image("pictures/logo.svg", width: 7em)
    text(3em)[*#details.title*]
    stack(
      dir: ltr,
      spacing: 1cm,
      [Version #version],
      group,
      date,
    )
    line(length: 100%)

    v(1fr)
  }

  pagebreak()

  if details.at("simple", default: false) {
    body
    return
  }

  // Bibliografin ska följa rubrikstandard.
  show bibliography: set heading(numbering: "1.1.")

  // Ny sida vid level 1-rubrik.
  show heading.where(level: 1): it => pagebreak(weak: true) + it
  set heading(numbering: "1.1.1.")
  set page(
    // Sidhuvud
    header: {
      set par(spacing: 0em)
      set place(dy: -7pt)
      place(bottom+left, dy: -4pt, image("pictures/logo.svg", height: 40%))
      place(bottom+center, details.title)
      place(bottom+right, date)
      line(length: 100%)
    },
    // Fotnot
    footer: context {
      set par(spacing: .5em)
      line(length: 100%)
      align(right, counter(page).display("1 / 1", both: true))
    },
  )

  [
    #set align(center)
    #text(2em)[*Projektidentitet*]

    *Medlemmar*
    #table(
      columns: 3,
      inset: .5em,
      table.header[*Namn*][*Ansvarsområde*][*Mail*],
      [Alice Almgren], [Teamledare], [alial202\@student.liu.se],
      [Anton Taber], [Testledare], [antta671\@student.liu.se],
      [Axel Berg], [Arkitekt], [axebe390\@student.liu.se],
      [Isabel Neubauer], [Dokumentansvarig], [isane541\@student.liu.se],
      [Jakob Tormalm], [Analysansvarig], [jakto054\@student.liu.se],
      [Samuel Tuvstedt], [Backendutvecklingsledare], [samtu593\@student.liu.se],
      [Samuel Åkesson], [Konfigurationsansvarig], [samak519\@student.liu.se],
      [Simon Gunnarsson],
      [Frontendutvecklingsledare],
      [simgu061\@student.liu.se],

      [Stina Åström], [Kvalitetssamordnare], [stias606\@student.liu.se],
    )

    *Kund:*\
    Digitaliseringsavdelningen, Linköpings universitet

    *Handledare:*\
    Eric Ekström

    *Examinator / kursansvarig:*\
    Lena Buffoni
  ]

  pagebreak()

  if details.at("history") != none {
    text(2em)[*Dokumenthistorik*]
    table(
      columns: (1fr,) * 5,
      inset: .5em,

      [*Version*], [*Datum*], [*Ändringar*], [*Granskad av*], [*Utfärdat av*],
      ..details.history
    )
  }

  pagebreak()

  outline()

  pagebreak()

  body
}