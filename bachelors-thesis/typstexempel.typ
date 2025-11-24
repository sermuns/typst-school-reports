// Dubbelt snedstreck är kodkommentar. 

#set heading(numbering: "1.1")
#set text(lang: "sv")

#show figure.where(kind: table): set figure.caption(position: top) // Den här raden gör så att tabelltexten hamnar ovanpå tabeller. 

// Standarder: tab:_, fig:_, ref:_

= Rubrik 1
Det här är troligtvis den bästa typst-guiden som existerar. 

== Rubrik 2
Hej
\ // Backslash tvingar typst att lägga in en blankrad. 
\
=== Rubrik 3<tredje_rubriken>
Om jag vill referera till @tredje_rubriken gör jag såhär. Tyvärr blir det automatiskt stor bokstav på "Kapitel" men det går att åtgärda genom att skriva @tredje_rubriken[kapitel] istället. Det funkar också att skriva @tredje_rubriken[vadsomhelst] så löser typst siffrorna åt dig. 

== Tabellexempel
@exempeltabell[Tabellen] en snabb copy-paste tabell. Om du vill ha fler kollumner är det bara att öka columns. 
#figure(
  caption: "Tabelltext",

  table(
    columns: 4,
    [*Hejsan*], [*På*], [*Dejsan*],[*tjohej*],
    [Hej], [på], [dig], [igen]
  )
)<exempeltabell>


== Bildexempel

I @gummiankabild[figur] ser du en fin gummianka som du kan kopiera. Bilderna lägger vi i mappen /pictures. 
#figure(
  caption: "Figurtext",
  image( "pictures/gummianka.jpeg")
) <gummiankabild>


= Rubrik 1 igen
Ta och beundra hur fin @gummiankabild[figur] är! Kolla sedan på nästa sida. 


#pagebreak() // Tvingar att det som kommer efter blir på en ny sida. 

= Hur referenser fungerar
Exempel på att använda referens @ref:exempel.
Man skapar refereser i references.bib och bara skriver '\@ref:referensnamn' i texten så löser sig resten. Blir lättast att kopiera från exempelreferenserna där för att skapa nya. 

\
Man måste inte döpa referenserna till "ref:..." men för att det ska bli tydligt att det är en referens och inte en rubrik eller bild så gör vi så. Här är en referens till en hemsida @ref:exempelonline. 


#bibliography("references.bib")