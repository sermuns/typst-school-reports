#import "@preview/wordometer:0.1.4": word-count
#let highlight-frag = false

#let frag1 = highlight.with(fill: if highlight-frag { blue.lighten(80%) })
#let frag2 = highlight.with(fill: if highlight-frag { red.lighten(80%) })
#let frag3 = highlight.with(fill: if highlight-frag { green.lighten(80%) })
#let frag4 = highlight.with(fill: if highlight-frag { purple.lighten(80%) })

#let minus = list.with(marker: text(1.5em)[*`-`*])
#let plus = list.with(marker: text(1.5em)[*`+`*])

// Latex math to typst: https://qwinsi.github.io/tex2typst-webapp/
#set math.equation(numbering: "(1)") // Numrera ekvationer 

// Referens till ekvation blir (1)... etc
// #show ref: it => {
//   let eq = math.equation
//   let el = it.element
//   if el == none or el.func() != eq { return it }
//   link(el.location(), numbering(el.numbering, ..counter(eq).at(el.location())))
// }

// Figurer som kan brytas upp tillåts brytas upp.
#show figure: set block(breakable: true)

// Gör "Figur X" .. "Tabell Y" i *fet stil*
#show figure.caption: it => {
  // matchar exempelvis "Figur 1", "Tabell 2"...
  show regex("^\w+\s\d+:"): strong
  it
}

// Tabelltexter ska vara ovanpå tabeller.
#show figure.where(kind: table): set figure.caption(position: top)

// Lite mer avstånd ovanför och under alla figurer
#show figure: pad.with(y: 1em)

// 
// #show heading.where(level: 4): it => block(width: 100%)[
//   #set text(11pt)
//   #smallcaps(it.body)
// ]

// 1.1.1.1. ska vara grå
#show heading.where(level: 4): text.with(fill: black.lighten(30%))

// Alla rubriker är Avsnitt, förutom 1., som är Kapitel
#set heading(supplement: [Avsnitt])
#show heading.where(level: 1): set heading(supplement: [Kapitel])

#show raw: set text(font: "IBM Plex Mono")

// #show "TIDIG": box(image("pictures/logo.svg"))

// Indentera i början av nytt stycke
#set par(
  first-line-indent: 2em,
  spacing: 0.65em,
)

// titelsida
#set page(
  margin: (top: 3cm, left: 4cm, right: 3cm, bottom: 1.5cm),
)
#set text(font: "PT Sans", lang: "sv")

#[
  #set align(right)
  Linköpings universitet | Institutionen för datavetenskap\
  Examensarbete på grundnivå, 15hp | Datateknik\
  2025 | LIU-IDA/LITH-EX-G--25/031--SE // Ska inte vara fetstil sen.
  //2023 | LIU-IDA/LITH-EX-G-\-23/020-\-SE // Vet inte vad det här är för siffor men kopierade från annat arbete. Ska se över //SamuelT
]
\
\
#v(1fr)
#grid(
  columns: (3cm, 1fr),
  rows: (2cm, 0.5cm, 2cm, auto),
  align: (left + top),

  [],
  text(20pt, [TIDIG - Tidredovisningssystem för Digitaliseringsavdelningen på LiU]),
  [],

  line(length: 100%),
  [],
  text(13pt)[TIDIG - Time Reporting System for the Digitalisation Division at LiU],
  [], // Digitalisation Division (se https://liu.se/en/organisation/liu/uf/digit) /Isabel
  text(
    11pt,
    [
      *Alice Almgren\
      Axel Berg\
      Simon Gunnarsson\
      Isabel Neubauer\
      Anton Taber\
      Jakob Tormalm\
      Samuel Tuvstedt\
      Samuel Åkesson\
      Stina Åström*\

      \
      Handledare: Eric Ekström\
      Examinator: Lena Buffoni
    ],
  )
)
#v(2fr)

#[
  #set align(bottom)
  #set rect(
    inset: 8pt,
    fill: white,
    width: 100%,
  )

  #grid(
    columns: 2,
    column-gutter: 1fr,
    align: bottom,
    image("pictures/liu-logo.svg", height: 1.8cm),
    [
      Linköpings universitet\
      SE–581 83 Linköping\
      013-28 10 00, www.liu.se
    ],
  )]


#pagebreak()

//Feedback från Lena:
// Ni har en bra och detaljerat rapport, bara små saker som ska fixas, vänligen åtgärda dem och ladda upp den slutliga versionen av rapporten före den 17 juni så godkänner jag den för publicering.


// - ni numrerar forskningsfrågor i slutsats, skulle ha varit bra att numerära dom i inledningen också, lättare at läsa (löst av anton 11/6)


// - ni har ingen bild eller riktig beskrivning av själva produkten, det är en del av resultat i sig (löst av anton 11/6)


// - vissa begränsningar kan tydliggöras, t.ex jag antar att ni använder ASP-NET för det är en krav från kunden, är det rätt tolkning? 


// - I diskussionen ni tar mycket up processer, men i 6.1.5 Tekniska erfarenheter - ni diskuterar inte tekniska val eller begränsningar och vad ni skulle göra annorlunda om ni görde projektet igen.

// mariginaler på sidorna och uppe och nere på sidan.
#set page(margin: (top: 3cm, left: 3.5cm, right: 3.5cm, bottom: 3.5cm))
#set align(top + left)

#set page(numbering: "i")

#set par(justify: true)

#heading(outlined: false)[Upphovsrätt]
Detta dokument hålls tillgängligt på Internet – eller dess framtida ersättare – under 25 år från publiceringsdatum under förutsättning att inga extraordinära omständigheter uppstår.
Tillgång till dokumentet innebär tillstånd för var och en att läsa, ladda ner, skriva ut enstaka kopior för enskilt bruk och att använda det oförändrat för ickekommersiell forskning och för undervisning. Överföring av upphovsrätten vid en senare tidpunkt kan inte upphäva detta tillstånd. All annan användning av dokumentet kräver upphovsmannens medgivande. För att garantera äktheten, säkerheten och tillgängligheten finns lösningar av teknisk och administrativ art.
Upphovsmannens ideella rätt innefattar rätt att bli nämnd som upphovsman i den omfattning som god sed kräver vid användning av dokumentet på ovan beskrivna sätt samt skydd mot att dokumentet ändras eller presenteras i sådan form eller i sådant sammanhang som är kränkande för upphovsmannens litterära eller konstnärliga anseende eller egenart.
För ytterligare information om Linköping University Electronic Press se förlagets hemsida https://ep.liu.se/ .

#linebreak()
#heading(outlined: false)[Copyright]
The publishers will keep this document online on the Internet – or its possible replacement – for a period of 25 years starting from the date of publication barring exceptional circumstances.
The online availability of the document implies permanent permission for anyone to read, to download, or to print out single copies for his/hers own use and to use it unchanged for non-commercial research and educational purpose. Subsequent transfers of copyright cannot revoke this permission. All other uses of the document are conditional upon the consent of the copyright owner. The publisher has taken technical and administrative measures to assure authenticity, security and accessibility.
According to intellectual property law the author has the right to be mentioned when his/her work is accessed as described above and to be protected against infringement.
For additional information about the Linköping University Electronic Press and its procedures for publication and for assurance of document integrity, please refer to its www home page: https://ep.liu.se/.

// Copyright:
#[
  #set rect(
    inset: 8pt,
    fill: white,
    width: 100%,
  )

  #grid(
    columns: (20pt, 1fr),
    rows: 150pt,
    align: horizon + left,
    rect[#text("©", 13pt)],
    rect[
      Alice Almgren\
      Axel Berg\
      Simon Gunnarsson\
      Isabel Neubauer\
      Anton Taber\
      Jakob Tormalm\
      Samuel Tuvstedt\
      Samuel Åkesson\
      Stina Åström\
    ],
  )
]


#pagebreak()
#set text(font: "New Computer Modern", 11pt)
#set align(left)

#[
  #set align(center)
  #heading(outlined: false)[Sammanfattning]
  //- _Två rubriker skrivna på svenska (sammanfattning) och engelska (abstract)_
  //- _högst 150 ord, inga radbrytningar, inga referenser/källor_
  //- _Innehåll: kort beskrivning av problem, syfte, metod, resultat, slutsatser_

  #word-count(t => [

  // SamuelT 20/5 omarbetad. 
  
  Den här kandidatrapporten redogör för arbetsprocessen och utvecklingen av ett tidredovisningssystem som beställts av Digitaliseringsavdelningen (DIGIT) vid Linköpings universitet. Rapporten behandlar frågeställningar kring hur man kan skapa värde för kunden, vilka erfarenheter som kan vara värdefulla för framtida projekt, nyttan av att skapa och följa upp en systemanatomi samt konsekvenserna av att dela upp en webbapplikation i frontend- respektive backend-servrar med separata arbetsgrupper. Slutsatser som drogs inkluderar att användningen av ett Scrum-ramverk med tydliga sprintuppgifter bidrog till ökad produktivitet. Samtidigt visade det sig att uppdelningen mellan frontend och backend ställde höga krav på kommunikation mellan grupperna, men möjliggjorde också ett effektivt parallellt arbete. En viktig teknisk lärdom var att tidig planering av datatyper och databasschema underlättade implementationen för både frontend och backend. Den färdiga produktens användbarhet uppmättes till ett genomsnittligt värde på 79 enligt SUS-metoden, vilket indikerar en god användarupplevelse.
  //Alice 22/5 feedback: Kanske lägga till nåt kort om systemanatomin-slutsatts?
  
  
  //#t.words
  
  ])

  #word-count(t => [
  #text(lang: "en")[
    #heading(outlined: false)[Abstract]

    // SamuelT 20/5 omarbetad. 
    
    This bachelor's thesis details the work process and development of a time reporting system commissioned by the Digitalization Division (DIGIT) at Linköping University. The report addresses questions regarding how to provide value for the client, which experiences may be valuable for future projects, the benefits of creating and following a system anatomy, and the consequences of separating a web application into frontend and backend servers with separate development teams. Key findings include that the use of a Scrum framework with clearly defined sprint tasks contributed to increased productivity. Furthermore, the division between frontend and backend imposed high demands on communication between the teams but also enabled efficient parallel work. An important technical lesson was that early planning of data types and database schema facilitated implementation for both frontend and backend. The final product's usability was measured according to the SUS method to an average score of 79, indicating a good user experience.
  
 
    // #t.words
    
  ]
])

  //_Strukturen på rapporten från_ #highlight[https://www.ida.liu.se/~TDDD83/info/material/TDDD83-Exjobbsanvisning.pdf]

  //_En till guide för rapportskrivande: #highlight[https://www.kau.se/bibliotek/skriva-referera/skriva/skriva-akademiskt/att-skriva-en-vetenskaplig-uppsats-eller-rapport] _

]

#pagebreak()

= Tillkännagivanden
Vi riktar ett uppriktigt och stort tack till vår handledare Eric Ekström för det stöd och den vägledning som tillhandahållits under genomförandet av detta kandidatarbete. Vi önskar även tacka vår uppdragsgivare, Digitaliseringsavdelningen vid Linköpings universitet, som har möjliggjort detta projekt. Slutligen vill vi framföra vårt tack till examinator Lena Buffoni och Linköpings universitet. 

#pagebreak()
#show outline.entry.where(level: 1): set text(weight: "semibold")

#outline(indent: 0.7cm, depth: 3)

#pagebreak()

= Figurer // Vanlig rubrik som syns innehållsförteckningen
#outline(
  title: [],
  target: figure.where(kind: image),
)

#pagebreak()

= Tabeller // Vanlig rubrik som syns innehållsförteckningen
#outline(
  title: [],
  target: figure.where(kind: table),
)

#pagebreak()

= Ordlista
\
// OBS: Vid inlämning, kolla igenom att alla definitioner här faktiskt nämns i resten av rapporten. Om inte, ta bort definitionen från listan. /IN
== Projektspecifika termer
#let projekt-termer = (
  "Administratör": [En användare som kan hantera uppgifter och skapa rapporter och sammanställningar],
  "Aktivitet": [Ett ID som används för att koppla en uppgift till faktureringställe],
  "DIGIT": [Digitaliseringsavdelningen vid LiU],
  "LiU": [Linköpings Universitet],
  "Roll": [En användares roll i systemet, tidredovisare eller administratör],
  "TIDIG": [Tidredovisningssystem för Digitaliseringsavdelningen],
  "Tidredovisare": [LiU-medarbetare som redovisar arbetad tid],
  "Tidredovisning": [Processen där tidredovisare rapporterar tid arbetad på uppgifter],
  "Uppgift": [En arbetsuppgift som tidredovisare kan rapportera tid till],
)
#[
  #show table.cell.where(x: 0): strong
  #set text(10pt)
  #figure(caption: "Projektspecifika termer som används i rapporten", table(
    align: left,
    columns: (1fr, 3fr),
    ..projekt-termer.pairs().flatten()
  ))<Projektspecifika_def>
]
// Bokstavsordning!
== Generella termer
#let generella-termer = (
  //"ASP.NET": [Ett ramverk för att bygga webbapplikationer. I detta projekt använder vi C\# som programmeringsspråk tillsammans med ramverket],
  "Azure": [En samling molnbaserade tjänster tillhandahållet av Microsoft],
  //"Azure DevOps": [Integration och automatisering av mjukvaruutveckling och informationsteknologi],
  "Backend": [Den delen av systemet som behövs för att bland annat interagera med databas och autentisera användare],
  ".csv": [Ett filformat. Står för _Comma separated values_],
  //"C#": [Ett programmeringsspråk som användas för backendutveckling],
  "Discord": [En kommunikationstjänst som erbjuder röstsamtal],
  //"Entity Framework Core": [Ett gränssnitt för att förenkla och abstrahera kommunikationen mellan ett .NET-program och en databas @ref:efcore.],
  "EER-diagram": [_Extended Entity Relationship_, en datamodell för databasdesign],
  //"Figma": [Ett webbaserat verktyg för att skapa prototyper för utseende på hemsidor och appar @ref:figma.],
  "Feature freeze": [Sista fasen i en mjukvaruprodukt, när inga fler funktioner ska byggas, utan endast finjusteringar och buggfix återstår.],
  "Frontend": [Den delen av systemet som användare upplever och interagerar med. I projektets fall är det webbsidan.],
  "Kanban": [En agil metod för att visualisera arbetsflöden och hantera pågående arbete genom en tavla],
  "LCP": [_Largest contentful paint_ @ref:LCP. En metod för att mäta prestanda. LCP är tiden i sekunder det tar för det största elementet på en webbsida att ladda in],
  "LiU-ID": [Ett användarnamn som används för digitala tjänster på Linköpings universitet],
  //"NSwag": [Ett bibliotek i .NET som automatiskt genererar dokumentation för ändpunkter skrivna i ASP.NET.],
  "Produktbacklogg": [Lista över prioriterade funktioner och krav som ska utvecklas i produkten],
  "Produktägare": [Ansvarig för produktbackloggen, prioriterar krav och ser till att teamet skapar värde under sprintar],
  //"Scrum": [En agil mjukvaruutvecklingsprocess som bygger på iterativt arbete i tidsbegränsade sprintar],
  "Scrum Master": [En coach som säkerställer att scrumprocessen följs och stödjer teamet under sprintar],
  "Sprint": [En tidsbegränsad arbetscykel i Scrum som varar en till fyra veckor, där teamet utvecklar och implementerar uppgifter och funktioner från sprintbackloggen],
  "Sprintbacklogg": [De uppgifter och funktioner som valts ut från produktbackloggen för den aktuella sprinten],
  "Sprintplanering": [Ett möte där teamet väljer vilka uppgifter som ska genomföras under den kommande sprinten],
  "Sprint review": [Ett möte i slutet av en sprint där teamet redovisar vilka uppgifter och funktioner som har eller inte har levererats under den senaste sprinten],
  "Sprint retrospektiv": [Ett möte i slutet av en sprint där teamet reflekterar över hur det gått, samt identifierar förbättringsområden till kommande sprintar],
  "SQL": [_Structured Query Language_. Ett standardspråk för databashantering],
  "SSO": [_Single Sign On_, ett verktyg för autentisering av användare],
  //"SUS": [_System Usability Score_. En skala för att mäta användbarheten på ett system, baserat på användares upplevelse av dess funktionalitet och design],
  //"Svelte": [Ett ramverk för att bygga webbapplikationer. I detta projektet använder vi TypeScript som programmeringsspråk tillsammans med ramverket],
  //"TypeScript": [Ett typat programmeringsspråk som användas för frontendutveckling],
  //"UI": [Användargränssnittet för produkten],
  "Utvecklingsteam": [En grupp som utvecklar och levererar funktionalitet i sprintar],
)
#[
  #set text(10pt)
  #set par(justify: false)
  #show table.cell.where(x: 0): strong
  #figure(caption: "Generella termer som används i rapporten", table(
    align: left,
    columns: (1fr, 3fr),
    ..generella-termer.pairs().flatten()
  ))<Generella_def>
]

#let projekt-termer-counters = (
  projekt-termer.pairs().map(it => (upper(it.at(0)), counter(it.at(0))))
).to-dict()
#show regex(projekt-termer.keys().join("\b(?i)|\b")): it => context {
  if projekt-termer-counters.at(upper(it.text)).get().first() > 0 { return it }
  projekt-termer-counters.at(upper(it.text)).step()
  emph(it)
}
#let generella-termer-counters = (
  generella-termer.pairs().map(it => (upper(it.at(0)), counter(it.at(0))))
).to-dict()
#show regex(generella-termer.keys().join("\b(?i)|")): it => context {
  if generella-termer-counters.at(upper(it.text)).get().first() > 0 { return it }
  generella-termer-counters.at(upper(it.text)).step()
  emph(it)
}

// Borttagna 14 mars pga används inte i rapporten /IN
//      [*ESLint:*], [Ett statiskt kodanalysverktyg för JavaScript och TypeScript som hjälper till att identifiera och åtgärda kodproblem],
//       [*MS Teams:*], [En kommunikationsplattform och samarbetsverktyg],
//      [*Google Drive:*], [En molnbaserad filhanterare där dokument kan sparas och delas med andra],
//       [*Burndown-chart:*], [Grafisk visualisering av kvarvarande arbete],



//[*LCP:*], [Tiden det tar för det största synliga innehållet på en webbsida att laddas och visas för användare] -Bortaget av Alice 14/3 då det fanns dubletter.



// Super-duper-fancy numrering av level-1 rubriker.
#set heading(numbering: "1.1")
#show heading.where(level: 1): it => {
  pagebreak()
  grid(
    align: horizon,
    column-gutter: 0.5em,
    columns: 2,
    rows: (4cm, auto),
    // [], [],
    box(
      fill: black,
      inset: 0.5em,
      {
        for i in range(7) {
          place(
            center,
            dx: i * -.2em,
            line(
              stroke: black,
              start: (0em, 4em),
              end: (0em, -4em),
            ),
          )
        }
        text(white, counter(heading).display())
      },
    ),
    it.body,
  )
  v(3em)
}

#set page(
  numbering: "1",
  header: {
    set place(dy: 1.2em)
    set align(center)
    // stack(
    //   dir: ltr,
    //   spacing: .5em,
    //   align(horizon, image("pictures/logo.svg", height: 2em)),
    //   align(horizon)[TIDIG]
    // )
    place(left+horizon, image("pictures/logo.svg", height: 2em))
    line(length: 100%)
  }
)
#counter(page).update(1)

= Inledning
Den här rapporten redogör det kandidatarbetet som utfördes våren 2025 av gruppen PUM02 i kursen TDDD96 på Linköpings universitet (_LiU_). Arbetet handlade om att skapa det webbaserade tidredovisningssystemet TIDIG (Tidredovisningssystem för Digitaliseringsavdelningen) till DIGIT (Digitaliseringsavdelningen på LiU).

== Motivering
DIGIT // Anton feedback 22/5: Behöver vi skriva "på LiU" här med tanke på att vi precis skrivit att DIGIT är "Digitaliseringsavdelningen på LiU" två rader upp? -ISABEL FIXAT
har under lång tid haft ett undermåligt system för tidredovisning för sina anställda. De anställda arbetar ofta på flera projekt parallellt och måste därmed redovisa hur mycket tid de lägger på respektive projekt. Detta är viktigt då de anställdas tidredovisning är underlag för fakturering till diverse kunder. Det nuvarande systemet saknar ett användarvänligt gränssnitt. //Från resultatet på den analys som presenteras i @res:värde så fick projektgruppen uppfattningen av att det nuvarande systemet saknar ett användarvänligt gränssnitt. 
// Jakob 22/5, kanske endast borde säga icke användarvänligt, gammalt betyder inte dåligt i sig
// Jakob 23/5, fixat  

== Syfte
// Stina ändrade 14/4 efter eriks feedback
// Jakob 22/5 Syftet: dåtid. "Som en del av detta skapas en ..." nutid?
Syftet med projektet är att utveckla en användarvänlig och effektiv lösning för tidsrapportering, anpassad efter DIGIT:s behov. Som en del av detta skapas en systemanatomi vars stöd för projektets genomförande utvärderas i rapporten.

Rapporten syftar även till att identifiera erfarenheter gällande att arbeta i en projektgrupp för att utveckla en mjukvaruprodukt. Rapporten behandlar också effekten av att arbeta med Scrum och uppdelningen i två tydliga arbetsgrupper för frontend respektive backend vid utvecklingen av en webbapplikation.

// Stina 14/4: Tog bort nedanstående stycke från syftet då jag uppdaterade efter eriks feedback
// Systemet skulle möjliggöra registrering av arbetstid på ett strukturerat sätt samt ge chefer en översikt över rapporterad tid och uppdrag. Lösningen skulle fungera som en ersättare till DIGIT:s tidigare system.
// DIGIT:s språkstandard enligt https://sprakbruk.fi/artiklar/genitiv-av-forkortningar/

#box[
  == Frågeställning <frågeställning>
  Rapporten besvarar följande frågeställningar:
  \
  #frag1[
    + Hur kan tidredovisningssystemet TIDIG implementeras så att man skapar värde för kunden?  //Hur kan ETT tidsredo..?
  ] // Hur kan system X implementeras så att man skapar värde för kunden?
  #frag2[
    + Vilka erfarenheter kan dokumenteras från TIDIG som kan vara intressanta för framtida projekt?
  ] 
  #frag3[
    + Vilket stöd kan man få genom att skapa och följa upp en systemanatomi?
  ]
  #frag4[
    + Vilka för- och nackdelar finns med att dela upp en webbapplikation som TIDIG i en frontend- respektive backend-server med separata arbetsgrupper?
  ]
  \
]

//- Vilka designmässiga beslut är avgörande för att säkerställa ett användarvänligt system?
//- Hur påverkar val av typsnitt och layout användarvänligt upplevelse i systemet?

//- Vilka tekniska beslut är avgörande för att säkerställa ett effektivt system?

// SARA (System för ArbetsRapportering och Analys)

//Fråga Lena om man måste ha fler frågeställningar

//SamuelT: Ingen prestiege alls i de här frågeställningarna. Försökte bara komma på något. Tänker att de slutgiltiga frågeställningarna ska vara sammanhängande och kanske lite fler än 3.
// - Hur skapar man ett tidredovisningssystem som är så enkelt som möjligt att använda?
// - Hur kan man använda sig av frågeformulär för att skapa en en kravspec för ett mjukvaruprojekt?
// - Vad kan man göra redan i designfasen av en databas för att den ska vara både snabb och lätt att förstå?



// // Antons frågeställningar start
// - Hur mycket påverkas användarens effektivitet av ett modernt system? //låt kund visa hur många klick som behövs i gamla och nya systemet. Låt kund ta tid på gamla systemet och nya.

// - Hur påverkas en användare negativt av ett nytt system? Kommer tiden för att lära sig ett nytt system vara en värd investering? // Kanske är svårt att testa i samband med att leveransen är till kund. Men vi kan ju ta svar via enkäter i samband med prestandatesterna?

// - Kommer användare använda funktioner som implementerats i ett nytt system om ett gammalt system med sämre funktionalitet men användare är vana vid fortfarande finns tillgängligt? // Enkäter, enkäter, enkäter
// //alternativt:

// - Hur kan man implementera ett tidsrapporteringsprogram för att få användare att inte fortsätta använda det gamla systemet? // Fokuserar mer på vad som behöver göras

// - Kommer användningen av ett system öka om systemet är tillgängligt på en mobil?
// // Antons frågeställningar slut

// Exempel på frågeställningar: https://www.ida.liu.se/~TDDD83/info/material/TDDD83-Exjobbsanvisning.pdf


== Avgränsningar
//SamuelT: Tänker att vi skulle kunna skriva huuuur många som helst men att vi försöker hålla oss någorlunda kortfattade här. Men några fler än de jag skrev nu kan vi trycka dit tycker jag.
//Simon 04-14 Uppdaterat de tidigare avgränsningarna så de låter mer som avgränsningar. Även lagt till några nya ideer på avgränsningar.
Arbetet och projektet har haft följande avgränsningar baserat på kurskrav, kundens krav och projektgruppens val.
\
*Från kurs:*
- Projektets omfattning begränsades till totalt 3600 timmar, vilket innebär 400 timmar per gruppmedlem för 9 medlemmar.

*Från kund:*
- Produkten stödjer inloggning med LiU-ID via LiU-SSO men andra autentiseringslösningar inkluderas inte.
- Produkten följer LiU:s grafiska profil samt uppfyller tillgänglighetskraven EN 301 549 @ref:ETSI2021 och WCAG 2.1 @ref:W3C2024.
- Produktens backend är baserad på C\# och ASP.NET, och systemet driftsätts på DIGIT:s egna servrar.
//- Produktens användbarhet utvärderas med kontinuerliga användarintervjuer (10 personer per vecka) snarare än kvantitativa enkäter. Alice 14/4 feedback: -Vi gör inte detta så tog bort det just nu
// Jakob 22/5. Tror inte vi har med något på engelska (utom koden, men då kanske det borde förtydligas)
// Jakob 23/5, fixat

*Från projektgrupp:*
- Produktens gränssnitt är på svenska och koden skrivs på engelska. Inga andra språk används.

// Jakob 22/5, Kontext låter som angliscism, tycker sammnhang är bättre
// Isabel 23/5: "Kontext" står det på kandidat-powerpoint på lisam
== Kontext
//_Enligt slide från TDDD96 lisam: "Kontext – allt som har med kursen att göra som har
//betydelse för beslut och resultat – inte mer kurs sedan"_
Kursen _Kandidatprojekt i programvaruutveckling_ med kurskod _TDDD96_ ges av Linköpings Universitet till studenter som går civilingenjörslinjer inom datateknik och mjukvaruteknik. Kursens upplägg består i huvudsak av att studenter, uppdelade i grupper om åtta till nio personer, åtar sig ett projekt från en extern uppdragsgivare och skriver ett gemensamt kandidatarbete utifrån det projektet. I kursen ingår också en individuell erfarenhetssammanfattning där vardera student beskriver sina erfarenheter under projektet. Vidare ingår också föreläsningar, seminarium och en konferens /*21 maj 2025*/ då projektet presenteras för resterande kursdeltagare. Kandidatgrupperna hade stöd och vägledning av en handledare som de träffade varje vecka.
// Jakob 22/5, sista meningen låter konstig
// jakob 23/5 fixat

=== Dokument tillhörande kandidatarbetet <dokument>
Utöver denna kandidatrapport har andra dokument upprättats. Dessa dokument är följande:

- Arkitekturdokument

- Gruppkontrakt

- Kravspecifikation

- Kvalitetsplan

- Projektplan

- Testplan
// Stina 20/5: Tog bort dokument från metoden
//För mer ingående information om dessa dokument hänvisas läsaren till @resultat:dokument.


=== Roller och ansvar <roller_ansvar>
Kandidatgruppen som är ansvarig för kandidatarbetet består av nio tredjeårsstudenter varav fyra medlemmar studerar civilingenjörsutbildningen i datateknik och fem medlemmar studerar civilingenjörsutbildningen i mjukvaruteknik. Varje enskild projektmedlem har en specifik grupproll med tillhörande ansvar. Nedan listas dessa roller och en kort beskrivning följer sedan gällande deras relaterade ansvar.

*Teamledare:* Teamledaren ansvarar för att leda och fördela arbetet inom gruppen. Hen ser också till att målen uppfylls och att processer följs. Vidare agerar teamledaren coach och ser till att det råder god arbetsmiljö. Teamledaren representerar kandidatgruppen utåt och ansvarar för att en projektplan skrivs. Teamledaren har rätt att ta det slutgiltiga beslutet om det behövs för att arbetet ska fortskrida.

*Analysansvarig:* Analysansvarig ansvarar för att hålla kontakten med kunden som beställt produkten. Hen tar reda på kundens verkliga behov och agerar förhandlingspart och ger insyn mot övriga gruppen. Analysansvarig ansvarar för kravspecifikationen, att kraven dokumenteras och ser till att kraven uppfylls.

*Arkitekt:* Arkitekten ansvarar för arkitekturdokumentet och att arkitekturen över produkten dokumenteras. Hen ser till att en stabil arkitektur tas fram och identifierar komponenter och gränssnitt. Arkitekten har rätt att ta övergripande teknikval och har, om det behövs, det sista ordet i tekniska frågor efter teamledaren. Sist behöver arkitekten kunna kommunicera bärande idéer.


*Dokumentansvarig:* Dokumentansvarig ansvarar för att ta fram dokumentmallar som ska användas under projektet och underhållning av dessa. Hen ser till att en logotyp tas fram, skapar ändringsrutiner och ansvarar för att leveranser sker till gruppens deadlines.

*Kvalitetssamordnare:* Kvalitetsarbete utförs av alla roller genomgående under alla delar i projektet. Kvalitetssamordnare ansvarar i synnerhet för initiativtagande och har uppföljningsansvar gällande kvalitetsarbetet. Hen ser också till att erfarenheter dokumenteras och att en kvalitetsplan skrivs och efterföljs. Vidare ansvarar hen för gruppens utbildning och ger inspiration till fortsatt kvalitetsarbete. Kvalitetssamordnaren planerar och budgeterar med övriga i gruppen och ser över hur mycket kvalitet får kosta.

*Konfigurationsansvarig:* Konfigurationsansvarig bestämmer vad som skall versionshanteras och vilka ändringar som ingår i en utgåva (eng. _release_). Hen ansvarar för att välja och underhålla verktyg för versions- och konfigurationshantering. Sist ser konfigurationsansvarig till att verktygen används på rätt sätt under projektet.

*Testledare:*
Testledaren beslutar om systemets status och sköter den dynamiska verifieringen och valideringen av systemet genom exekvering. Vidare ansvarar hen för att en testplan skrivs och att tester rapporteras. Hen ser också till att hålla rimlig distans till det som testas. Sist testar testledaren kvalitetskraven tillsammans med kvalitetssamordnaren.

*Backendutvecklingsledare:* Backendutvecklingsledaren ansvarar för den detaljerade designen av produkten. Hen ansvarar för att leda och fördela utvecklingsarbetet för backenddelen av projektet. Backendutvecklingsledaren har rätt att fatta beslut om utvecklingsmiljö och ser till att organisera projektmedlemmarnas tester.

*Frontendutvecklingsledare:* Frontendutvecklingsledare ansvarar för den detaljerade designen av produkten. Hen ansvarar för att leda och fördela utvecklingsarbetet för frontenddelen av projektet. Frontendutvecklingsledaren har rätt att fatta beslut om utvecklingsmiljö och ser till att organisera projektmedlemmarnas tester.

//== Kunskap och kompetenser
//Avsnittet beskriver den kunskap och kompetenser som är nödvändig för ett framgångsrikt projekt, samt den individuella kompetensen som finns inom projektgruppen inför projektet.


//=== Dokumentation
//Det valda dokumentationsprogrammet _Typst_ är en dokumenthanterare som ger användarna ett synkroniserat arbetsflöde med en textredigeringsinmatning och en visuell representation. Eftersom programmet är nytt för flertalet gruppmedlemmar krävs en del kunskap om hur samarbete, hantering av dokument, källhänvisning och andra funktioner i Typst används.

= Bakgrund
Kapitlet redogör för kundens bakgrund till projektet samt projektgruppens tidigare erfarenheter av liknande projektarbeten och relevanta kompetenser.
// _Ibland bygger ett examensarbete på ett specifikt uppdrag vilket kan göra det svårt att ge hela sammanhanget i inledningskapitlet utan att det blir för långrandigt (inledningen ska ju väcka läsarens intresse). Då kan ett bakgrundskapitel användas för att ge en mer detaljerad beskrivning av själva uppdraget. Det kan till exempel handla om någon form av kravspecifikation eller dylikt. Detta kapitel ska enbart användas vid behov._

// Alice 25feb: Enligt slide frpn tddd96 lisam ska del 2 bakgrund besvara: Varför vill kunden utveckla system X? Vilka är era tidigare projekterfarenheter? Förbättringspunkter? Bra erfarenheter?

== Kundens bakgrund
DIGIT på LiU startade år 2023 och arbetar med att tillhandahålla, utveckla och förvalta en IT-miljö för medarbetare och studenter på universitetet. De strävar att leverera användarcentrerade lösningar med universitetets behov i fokus som är säkra, stabila och kostnadseffektiva @ref:DIGIT.

// Axel 14/4: "... för applikationsenheten och projektutveckling". Borde det vara projekt- och utvecklingsenheten?
DIGIT är uppdelad i åtta enheter med olika ansvarsområden som samverkar och träffas regelbundet. Enheterna heter Applikationsenheten, Digitala resursenheten, Projekt- och utvecklingsenheten, IT-arbetsplatsenheten, IT-infrastrukturenheten, IT-serviceenheten och Nära IT-stödenheten @ref:DIGIT. Det nuvarande tidredovisningssystemet skapar främst värde för applikationsenheten och projektutvecklingsenheten. //Stina: Hittade info om detta i mötesprotokollet från första kundmötet

//Alice 25feb: ska man nämna att dem inte gillar orginala systemets UI?


== Projektgruppens bakgrund
//Alice 14/3 Eftersom detta nämns redan i kontexten så har jag avkomenterat detta. Det kan vara så att den delen i kontexten ska flyttas hit men vi tar det då tänker jag (vid feedback).
//Alice utkommenterade: Projektgruppen består av nio tredjeårsstudenter vid Linköpings universitet varav fyra medlemmar studerar civilingenjörsutbildningen i Datateknik och fem medlemmar studerar civilingenjörsutbildningen i Mjukvaruteknik.


Projektgruppen har teoretisk kunskap inom programutvecklingsmetodik från kursen _TDDC93 - Programutvecklingsmetodik_. Även om de flesta saknar praktisk erfarenhet att tillämpa metoderna i projektarbeten har medlemmarna en grundläggande förståelse vad gäller agila arbetsmetoder, kravhantering och systemdesign. Vidare har samtliga projektmedlemmarna erfarenheter av teamarbete från projektarbeten i sina studier. För studenterna inom datateknik har kurserna _TSEA29 - Konstruktion med mikrodatorer_ och _TSEA83 - Datorkonstruktion_ givit viktiga erfarenheter av att arbeta utifrån en kravspecifikation och en projektplan.

//Vidare har medlemmarna kompetens i objektorienterad programmering då samtliga har läst kurserna _TDDE30/TDDD78 - Objektorienterad programmering och Java_ samt _TDDE25 - Perspektiv på data- och mjukvaruteknik_, där mindre projekt genomfördes i grupper om två till tre personer.

//Studenterna inom mjukvaruteknik har även erfarenheter av att arbeta i större grupper. I kursen _TDDD92 - AI-Projekt_ samarbetade fem till sju personer för att implementera en gemensam AI-agent. Även kurserna _TDDD80 - Projekt: Mobila och sociala applikationer_ och _TDDE35 - Storskaliga distribuerade system och nätverk_ har bidragit med värdefulla insikter gällande projektarbete.


Utöver detta har projektmedlemmarna deltagit i ett flertal datorlaborationer inom olika kurser med samarbete i par. 
Vissa medlemmar i projektgruppen har även egna erfarenheter av mjukvaruutveckling, projektarbete och teamarbete genom ideellt arbete och fritidsaktiviteter.

Med dessa erfarenheter är projektgruppen överens om att planering är viktigt för att säkerställa jämn arbetsbelastning. Preliminära veckoplaneringar och regelbundna möten är fördelaktiga eftersom det ger en tydlig överblick av projektets framgång. Kommunikation ses som en av de viktigaste faktorerna för ett framgångsrikt projekt och det är viktigt att alla projektmedlemmar tar eget ansvar för att bidra till ett effektivt samarbete.


Det finns en bred kunskapsresurs i projektgruppen inom webbprogrammering. Vissa i projektgruppen har erfarenheter av frontend-utveckling från personliga projekt i samma skala som kandidatprojektet. Däremot finns potential för utveckling inom det programmeringsspråk som ska användas för frontend, TypeScript och Svelte-ramverket. Det ska också nämnas att studenterna inom mjukvaruteknik har erfarenhet inom systemutveckling som involverar både frontend och backend från kursen _TDDD80 - Projekt: Mobila och sociala applikationer_. 

Gällande backend-utveckling har en del i gruppen erfarenhet av databaser, SQL och molnplattformen Azure från tidigare kurser. En begränsning finns då programmeringsspråket som ska användas för backend är C\#, vilket är ett språk som få har erfarenhet av. Däremot har samtliga i gruppen läst kursen _TDDE30/TDDD78 - Objektorienterad programmering och Java_ som troligtvis underlättar inlärning och objektorienterad programmering i C\#. Vidare finns det bristande kunskap om hur ramverket ASP.NET fungerar.



//=== Projektgruppen
//Projektgruppen har teoretisk kunskap inom programutvecklingsmetodik från kursen _TDDC93 - Programutvecklingsmetodik_.
//Även om de flesta saknar praktisk erfarenhet att tillämpa metodikerna i projektarbeten har medlemmarna en grundläggande förståelse vad gäller agila arbetsmetoder, kravhantering och systemdesign. Vidare har medlemmarna kompetens i objektorienterad programmering och tidigare erfarenheter av att arbeta i projekt i grupp. 

//=== Frontend
//Det finns en bred kunskapsresurs i projektgruppen inom webbprogrammering. Vissa i projektgruppen har även erfarenheter av frontend-utveckling från personliga projekt i samma skala som kandidatprojektet. Det finns potential för utveckling inom det programmeringsspråk som ska användas för frontend, TypeScript, och hur _Svelte_-ramverket används.

//=== Backend
//En del av gruppen har erfarenhet av databaser, molnplattformen Azure och _Structured Query Language_ (_SQL_) från tidigare kurser. Begränsning finns då programmeringsspråket som ska användas för backend är C\#, vilket är ett språk som få har erfarenhet av. Det finns medlemmar i gruppen som har erfarenhet med objektorienterad programmering med liknande syntax vilket innebär att en övergång inte bör vara svår. Det finns bristande kunskap om hur ramverket ASP.NET fungerar.




= Teori
// Bra exempel finns: https://www.ida.liu.se/~TDDD83/info/material/TDDD83-Exjobbsanvisning.pdf

Detta kapitel beskriver den relevanta teorin och lägger grund för att besvara frågeställningarna i @frågeställning. Detta innefattar programspråk, ramverk, bibliotek, arbetsmetoder och verktyg.
//Alice 25faeb: Enligt tddd96 lisam ståre om teorin: " Vad behöver läsaren veta för att förstå resten av rapporten?"


//- _alla aspekter som finns i frågeställningen ska belysas i teorin med relevanta referenser_
//- _fokuset ligger på själva produkten som ska utvecklas, *inte* på processerna (Scrum, Git)_
//- _Annat namn på denna rubrik är *Relaterat arbete*_
// Stina 7 mars: Var har ni hittat information att man inte ska skriva om processer? För alla publicerade kandidatrapporter i TDDD96 som jag hittat har gjort det
//- Ta upp vad "värde" är generellt, och vad värde är för just vår kund (enkelt att använda, snabbt, följer tillgänglighetskrav).  //IN


== Programspråk, ramverk och bibliotek
För att utveckla produkten har gruppen tagit hjälp av ett flertal programspråk, ramverk och bibliotek vilka är beskrivna nedan.

=== HTML
HTML är en förkortning av _Hyper Text Markup Language_ och är den teknologi som definierar strukturen och innehållet för webbsidor @ref:html. Genom olika element som till exempel text, bilder och sektioner, utgör HTML grunden för att bygga webbsidor.

=== CSS
CSS står för _Cascading Style Sheets_ och är ett språk som används för att ge webbsidor sin layout och utseende @ref:css. Den styr hur HTML-elementen ska visas på skärmen genom att exempelvis definiera positionering, färger, typsnitt och marginaler. I CSS definieras grupper av stilregler i klasser, vilka kan appliceras på HTML-element för att ändra deras utseende.

// Jakob 22/5, man kanske borde definera vad CSS regler är i css delen först
// jakob 23/5 fixat
=== Tailwind CSS
Tailwind CSS är ett CSS-ramverk som tillåter utvecklare att skriva CSS direkt i HTML @ref:tailwindcss. Ramverket är "utility-first", vilket innebär att en uppsättning fördefinierade klasser används istället för att skapa egna CSS-regler. Detta möjliggör snabb och effektiv utveckling av webbapplikationer. Tailwind CSS innehåller klasser för att hantera layout, marginaler och textanpassning.

=== DaisyUI
DaisyUI är ett insticksprogram till Tailwind CSS som förenklar utvecklingen av användargränssnitt genom att tillhandahålla färdiga komponenter @ref:daisyUI. Den innehåller klassnamn som hjälper utvecklaren att designa och anpassa grundläggande komponenter såsom knappar, textrutor, sökrutor med mera. Detta resulterar i att utvecklaren behöver skriva mindre kod och därmed sparar tid.

=== JavaScript
JavaScript är ett dynamiskt och objektorienterat programmeringsspråk som används för att skapa interaktivitet och manipulera objekt inom en värdmiljö, vanligtvis webbläsare @ref:ecma262. Språket erbjuder en flexibel syntax utan typdeklarationer och bygger på objekt med egenskaper och metoder. JavaScript är en grundpelare för modern webbutveckling.

=== TypeScript
TypeScript är ett programmeringsspråk som bygger på JavaScript och tillför statisk typning @ref:typescript. Det kompileras till JavaScript och kan därför köras i alla miljöer där JavaScript fungerar. TypeScript gör det möjligt att upptäcka typrelaterade fel redan vid kompilering, vilket ökar kodens säkerhet och underlättar underhåll. Språket behåller JavaScripts objektorienterade och dynamiska karaktär men adderar verktyg för att hantera större och mer komplexa kodbaser.


=== Svelte
Svelte är ett modernt ramverk för utveckling av webbapplikationer, som kan användas med JavaScript eller TypeScript @ref:svelte_info. Svelte använder inte en virtuell DOM till skillnad från andra populära ramverk såsom React och Angular. Detta innebär att koden kompileras till optimerad JavaScript som endast uppdaterar specifika delar av DOM:en vid behov, vilket resulterar i bättre prestanda.

En fördel med Svelte är dess enkelhet, då inga ytterligare bibliotek eller beroenden krävs @ref:svelte_info. Dessutom har ramverket en lättförståelig och intuitiv syntax vilket gör det lämpligt för nybörjare inom webbprogrammering.

=== C\# och .NET

C\# är ett objektorienterat programmeringsspråk utvecklat av Microsoft @ref:Csharp_documentation. Det används inom bland annat utveckling av hemsidor och datorspel och har fördelarna att det fungerar på många plattformar och har en stor och aktiv användarbas.

.NET är utvecklingsplattformen som C\# körs på. Den innehåller runtime-miljön, standardbibliotek, kompilatorer och verktyg som behövs för att bygga, köra och distribuera applikationer.

=== ASP.NET

ASP.NET är ett ramverk för att utveckla webbservrar i .NET @ref:asp.net. Alla ändpunkter definieras som metoder i klasser, där dessa klasser kallas för "controllers". Varje metod motsvarar ett HTTP-anrop, till exempel GET eller POST, och returnerar vanligtvis ett svar i form av HTML, JSON eller en statuskod.

=== Entity Framework Core
Entity Framework Core är ett verktyg för att förenkla och abstrahera kommunikationen mellan ett .NET-program och en databas @ref:efcore.
Verktyget kopplar en klass i C\#-koden i .NET-programmet till en tabell i databasen och innehåller även funktionaliteten att uppdatera databasens tabeller efter att en ändring har gjorts i koden.

== Arbetsprocesser
De arbetsprocesser som projektgruppen har arbetat med under projektet och kontinuerligt utvärderat förklaras nedan i detalj.

=== Fasplanering // Hänvisa till Software Engineering: Theory and Practice (av Pfleeger)
Ett projektarbete kan delas in i fyra faser @ref:agil-projektledning @ref:andersen-Systemutvekling.
Den första fasen är _analysfasen_. Syftet med analysfasen är att projektgruppen ska förbereda sig genom att analysera hur projektet ska se ut, bilda sig en uppfattning om hur slutprodukten ska bli och säkerställa att det går att genomföra projektet så att kundens krav och behov blir uppfyllda. Den andra fasen är _planeringsfasen_ som är till för att realisera projektbilden och upprätta projektplaner. Efter planeringsfasen kommer _genomförandefasen_ vars syfte är att realisera planer och design som tidigare skapats. Den består i sin tur av en etablering-, realisering- och överlämningsfas. Under _etableringsfasen_ påbörjas genomförandet av projektet och verifiering av att planeringen följs. 
Därefter kommer _realiseringsfasen_ som är den fas där projektets slutresultat tas fram. I den här fasen implementeras designen som tagits fram i etableringsfasen. Vid start av _överlämningsfasen_ är produkten färdigtestad och all dokumentation är upprättad. Vidare blir kund informerad om hur de använder och underhåller produkten. Projektets slutresultat överlämnas och det säkerställs att allt blir formellt accepterat av kunden. Den sista fasen är _avslutningsfasen_ och under denna fas dokumenteras erfarenheter från projektets gång. 

=== Scrum <scrum_beskrivning>
Scrum är en agil arbetsmetod där små tvärfunktionella team samarbetar för att utveckla en produkt i korta cykler, kallade sprintar @ref:agile-scrum. I slutet av varje sprint presenteras en fungerande version av produkten.

==== Roller
I Scrum tilldelas de olika projektmedlemmarna olika roller med olika ansvarsområden såsom produktägare, Scrum master och utvecklingsteam @ref:essentials_of_software_engineering. Scrum master fungerar som en coach och säkerställer att Scrum följs, och ser till att teamet arbetar effektivt. _Produktägare_ representerar kunden och ansvarar för produktbackloggen. Utvecklingsteamet består av ett antal utvecklare som producerar mjukvaran.

==== Möten
// Axel 14/4: "strukturera och utvärdera och kontinuerligt" byta första och till ,
En sprint består av flera aktiviteter såsom sprintplaneringsmöte, dagligt Scrum-möte, sprint review och sprint retrospektiv @ref:essentials_of_software_engineering. Dessa aktiviteter syftar till att strukturera och utvärdera och kontinuerligt förbättra arbetet.
//Alice 25feb: Ha med ett scrumdiagram kke?

Sprinten startar med en sprintplanering där produktägaren tillsammans med teamet bestämmer vad som ska implementeras under denna sprint @ref:essentials_of_software_engineering. Varje arbetsdag hålls även ett dagligt Scrum-möte på ungefär 15 minuter då samtliga teammedlemmar uppdaterar varandra om sitt arbete och kan be om hjälp vid behov.
Under mötet svarade varje projektmedlem på följande frågor:
  - Vad har du gjort sedan senaste mötet?
  - Vad ska du göra fram till nästa möte?
  - Har du fastnat på något och behöver hjälp?


_Sprint review_ är ett möte som hålls i slutet av varje sprint @ref:essentials_of_software_engineering. Produkten inspekteras och produktbackloggen ändras vid behov. Utvecklingsteamet demonstrerar arbetet, besvarar frågor, diskuterar vad som gick bra, problemen som de stötte på och hur dessa löstes. Teamet diskuterar även vad som är nästa steg i implementeringen.

_Sprint retrospektiv_ är ett möte som hålls sista dagen av sprinten, efter sprint review @ref:essentials_of_software_engineering. Teammedlemmarna diskuterar resultatet, lärdomar och tar med sig detta inför planeringen av nästa sprint.

==== Backlogg
Varje sprint har en tillhörande sprint backlogg som är en ordnad lista med de uppgifter som ska genomföras under den givna tidsperioden @ref:essentials_of_software_engineering. Denna backlogg baseras på produktbackloggen som innehåller de krav och användarhistorier som är kvar att implementera och hanteras utav produktägaren.



=== System Usability Scale (SUS) <sus_beskrivning>
SUS (_System Usability Scale_) är en skala som mäter användbarhet på system @ref:sus. Den genomförs i samband med användartestning efter att en användare har använt exempelvis en webbsida. Den baseras på 10 påståenden som användare ska rangordna på en skala 1-5. En femma innebär att de håller med helt och hållet, medan en etta innebär att de verkligen inte håller med. Följande påståenden ingår i SUS-formuläret:

\
  + Jag tror att jag skulle vilja använda denna produkt ofta.
  + Jag tyckte att denna produkt var onödigt komplicerad.
  + Jag tyckte att denna produkt var lätt att använda.  
  + Jag tror att jag kommer behöva hjälp av en teknisk person för att kunna använda denna produkt.
  + Jag tycker att de olika funktionerna i denna produkt är väl samordnade.
  + Jag tyckte att det var för mycket inkonsekvens i produkten.
  + Jag kan tänka mig att de flesta skulle lära sig att använda denna produkt mycket snabbt.
  + Jag tyckte att denna produkt var mycket besvärlig att använda.
  + Jag kände mig väldigt trygg när jag använde denna produkt.
  + Jag behövde lära mig mycket innan jag kunde komma igång med denna produkt.
\

// Latex math to typst: https://qwinsi.github.io/tex2typst-webapp/
$
S &= 2.5 dot sum_(i = 1)^10 s_i \
$ <sus:summa>

$
s_i &=
cases(x_i - 1 & ", om" i " är udda (1, 3, 5, 7, 9)",
5 - x_i & ", om " i " är jämn (2, 4, 6, 8, 10)")
$ <sus:odd_even>

Baserat på användarnas svar beräknas en slutpoäng enligt @sus:summa och @sus:odd_even @ref:sus. För udda numrerade frågor subtraheras 1 från poängen, medan jämnt numrerade frågor beräknas genom att subtrahera poängen från 5, se @sus:odd_even. Detta beror på att udda frågor är positiva påståenden till skillnad från jämna som är negativa påståenden. Justeringen resulterar i att alla frågor får en poäng mellan 1 och 4. Slutligen multipliceras summan av de justerade värdena med 2.5 för att få en slutpoäng som varierar mellan 0 och 100.

Resultatet ger en bra indikation på systemets användbarhet, där ett högre poäng indikerar bättre användbarhet @ref:sus. En poäng på 51 eller lägre tyder på dålig användbarhet och bör åtgärdas omedelbart. En poäng runt 68 anses vara acceptabel, men det finns utrymme för förbättring. En poäng på 80.3 eller högre indikerar en mycket bra användbarhet.

=== Sustainability Awareness Framework (SusAF) <susaf_beskrivning>

Sustainability Awareness Framework (SusAF) @ref:susaf är en metod för att utvärdera en produkts sociala, individuella, miljömässiga, tekniska samt ekonomiska hållbarhet. Metoden genomförs genom att i grupp diskutera dimensionerna ur olika aspekter enligt en förutbestämd mall.

Resultatet blir ett Sustainability Awareness Diagram (SusAD) som visualiserar den direkta och indirekta effekten som produkten har på samhället. Varje effekt kategoriseras efter dimension och hur direkt- eller indirekt effekten är.

== Verktyg
Under arbetet med projektet har de nedan beskrivna verktygen använts av gruppen. 

=== Systemanatomi
En _systemanatomi_ är ett hjälpmedel för att visualisera och konkretisera funktionaliteten av ett system. Järkvik @ref:the-system-anatomy[s. 14-16] väljer att definiera begreppet systemanatomi som ett verktyg för att kommunicera om och planera system. Varje byggblock i en systemanatomi kallas för en _anatom_, och motsvarar en användarfunktion @ref:the-system-anatomy.

=== Kanban-bräde <teori:kanban>
Kanban-bräde är ett verktyg som visualiserar arbetsflödet och ger en tydlig överblick av arbetsfördelningen och framstegen @ref:kanban-for-scrum. Den består av kort som motsvarar uppgifter som kan röra sig mellan olika kolumner i brädet som motsvarar olika faser:
- *Att göra:* Uppgifter som ingår i sprintbackloggen men som ännu inte påbörjats.
- *Pågående:* Uppgifter som är under arbete men ännu inte färdigställda.
- *Granskning:* Uppgifter som är färdiga men ska granskas av en annan projektmedlem.
- *Godkänd:* Uppgifter som är slutförda och godkända.

Kanban-bräden kan visualiseras i Azure DevOps som beskrivs i @devops.

=== Azure DevOps <devops>
Azure DevOps är en plattform utvecklad av Microsoft med syftet att förenkla processen att utveckla programvara @ref:devOps. Den innehåller agila verktyg som stödjer arbete enligt Kanban och Scrum, inklusive olika typer av bräden. Det kan även integreras med GitHub eller tillhandahålla Git-lagringsplatser. Dessutom innehåller Azure DevOps verktyg för testning, kontinuerlig integrering och leverans. Under arbetet användes även dess funktionalitet med Kanban-bräden och sprinter för att organisera arbetet.


=== Figma
Figma är ett molnbaserat designverktyg för att skapa, dela och testa designer för webbsidor, mobilapplikationer och andra digitala produkter @ref:figma. Det möjliggör samarbete i realtid, där flera personer kan redigera samtidigt. Verktyget innehåller stöd för att skapa prototyper utan att skriva kod samt möjligheten att skapa återanvändbara UI-komponenter och andra användbara funktioner som effektiviserar designprocessen.

=== Visual Studio Code
Visual Studio Code är en modern och lätthanterlig programutvecklingsmiljö som utvecklats av Microsoft @ref:vscode. Den har stöd för de flesta programmeringsspråk och kan köras på flera olika operativsystem. Den erbjuder flera smarta inbyggda funktioner såsom inbyggd terminal, felsökningsverktyg och ett stort antal tillägg. Dessutom finns det inbyggt stöd för Git, vilket gör det enklare att samarbeta med andra utvecklare.

= Metod <metod>
//- _Använd underrubriker om arbetet delas upp i olika delar, t.ex. förstudie, implementation och utvärdering_
//- _Replikerbarhet_
//- _Under rubriken ”Metod” anges vilken metod/metoder som använts för att få fram resultaten som presenteras i texten. Du bör också analysera valet av metod genom att motivera varför metoden fungerar bäst i sammanhanget. Beskrivningen av metod/metoder ska vara så noggranna och utförliga att gången i arbetsprocessen ska kunna upprepas._ (Källa: https://www.kau.se/bibliotek/skriva-referera/skriva/skriva-akademiskt/att-skriva-en-vetenskaplig-uppsats-eller-rapport)

Detta kapitel beskriver de metoder som användes för att besvara frågeställningarna som beskrivs i @frågeställning.

 // 30 april: Isabel och Alice har skrivit om "Inledande arbete" till att handla mer om planering och projektetsfaser 
// Frågeställning 2 tar upp erfarenheter om planering och fasuppdelning i resultat/diskussion
#frag2[
  == Projektets faser <metod:faser>
  I början av projektet skapades en projektplanering som omfattade en analysfas, planeringsfas, genomförandefas och avslutningsfas. Fasplanen var som följande:

- I *Analysfasen* ingick att skriva _kravspecifikation_, utvärdera gruppens kapacitet för projektet och genomföra en SusAF-analys. Syftet med SusAF-analysen var att säkerställa en bra och hållbar slutprodukt och resultatet redovisas i @resultat:susaf. För vidare information om analysfasen hänvisas läsaren till @inledande-arbete.
 // Anton feedback 22/5: Detta känns konstigt. Kanske ge en sammanfattning av vad vi läser i avsnitt 4.2 för att sedan säga "också". Tycker dessutom att "också" låter väldigt informellt. Kanske använda "även" istället eller helt skippa något ord eftersom vi inte riktigt går in på vad som ingår i kapitlet vi refererar till? --Alice 23/5 gjorde om lite nu. Hoppas de ä ok. 

- *Planeringsfasen* utgick att planera projektet och skapa en design för TIDIG. Relevanta planeringsdokumenten för vårt projekt var _projektplanen_ och _kvalitetsplanen_. Vidare skapades en _testplan_ och designdokumenten _systemanatomin_ och _arkitekturdokumentet_ skapades för att strukturera upp hur projektet skulle utvecklas.

- *Genomförandefasen* realiserade planer och design som tidigare skapades.

// Axel 22/5: Etablering-, realiserings-, och överlämningsfaserna nämns inte som faser i rubriksbeskrivningen. Antar att etablering och realisering är en del av genomförandefasen, borde göra det tydligare genom inskjutna punkter och/eller explicit skriva att de ingår i genomförandefasen. Samma för överlämning --ALICE 23/5: Det står förkklarat i teoridelen
  - Under *etableringsfasen* utbildades medlemmar i projektets tekniker och en bedömning gjordes utifrån planeringens realiserbarhet. 

  - Under *realiseringsfasen* genomfördes det som beskrivits i planeringen och den design som tagit fram i etableringsfasen implementerades.

  - Vid starten av *överlämningsfasen* var produkten färdigtestad och all dokumentation var upprättad. Vidare blev kunden informerad om hur de använder och underhåller produkten. Projektets slutresultat överlämnades och det säkerställdes att allt blev formellt accepterat av kunden. 

- Den sista fasen var *avslutningsfasen*. Under denna del av projektet dokumenterades de olika erfarenheter från projektets gång. Varje medlem skrev, enligt bedömningskriterierna för kandidatkursen, en individuell erfarenhetssammanfattning och tillsammans skrev gruppen ett gemensamt kandidatarbete.
]
#frag1[

  == Inledande arbetet <inledande-arbete>
  Innan arbetet med produkten påbörjades behövde projektgruppen ta gemensamma beslut gällande arbetssätt och roller. 
  //Inledningsvis tilldelades projektmedlemmarna roller och ansvarsområden. Dessa beskrivs i @roller_ansvar. För att tilldela rollerna fick projektmedlemmarna rangordna dessa i ett gemensamt, delat, Google kalkylark och sedan togs ett gemensamt beslut om rollfördelningen baserat på gruppens preferenser.
  Ett gruppkontrakt togs fram för att fastställa hur samarbetet i gruppen skulle fungera. För att ge en detaljerad bild av hur arbetet skulle genomföras togs ett antal dokument fram, beskrivna i @dokument. Dessa dokument uppdaterades och reviderades kontinuerligt under projektets gång för att säkerställa att arbetsmetoderna följdes och att dokumentationen förblev aktuell.
  //Gruppkontraktet innehöll information om kommunikationskanaler, beslutsfattande, konflikthantering och hur gruppen skulle hantera situationer såsom sena ankomster och bristande arbetsinsats.

  Därefter beslutades vilka ramverk och programmeringsspråk som skulle användas i projektet. Projektmedlemmar med tidigare erfarenhet presenterade och motiverade sina val och därefter togs ett gemensamt beslut genom omröstning.

  Det som avslutade det inledande arbetet av projektet var ett kundmöte där kunden gick igenom sitt nuvarande system för projektgruppen och förklarade sitt behov och sina förväntningar på det nya systemet. Detta lade grunden för de dokument som framställts under projektet, särskilt för kravspecifikationen.

  // Stina 20/5: Tog bort dokument eftersom vi inte nämner det mer i texten
  //== Dokumentation <resultat:dokument> 
  // Relaterar till att skapa värde för kunden
  //Ett antal dokument framställdes för att ge detaljerad information om hur arbetet skulle utföras. Dessa dokument uppdaterades och reviderades kontinuerligt under projektets gång för att säkerställa att arbetsmetoderna följdes och att dokumentationen förblev aktuell. Dokumentens innehåll beskrivs nedan.

  //=== Projektplan
  // Axel 14/4: Kanske inte är några problem men här används "aktiviteter", vilket möjligtvis kan förvirras med det definerade begreppet "aktivitet"
  //Projektplanen innehåller en bakgrund till både projektet och projektgruppen. Den beskriver hur projektgruppen kommunicerar internt och externt samt presenterar en projektplanering, vilket inkluderar milstolpar, aktiviteter och beslutspunkter. Dokumentet innehåller även risker och strategier för riskhantering.
  

  //=== Kravspecifikation
  //Detta dokument definierar den önskade slutprodukten och fungerar som en överenskommelse mellan kunden och projektgruppen. Dokumentet innehåller en beskrivning av systemet, dess begränsningar samt funktionella och icke-funktionella krav.

  //=== Arkitekturdokument
  //I detta dokument beskrivs systemets övergripande struktur, komponenter och hur de samverkar. Den innehåller även motiveringar till designval samt den bakomliggande filosofin som är grunden för systemets utformning.

  //=== Kvalitetsplan
  //Kvalitetsplanen beskriver kvalitetsarbetet vilket inkluderar beskrivning av kodstandarder, processer och mätningar. Kvalitetsplanen beskriver även hur dessa utvärderas och förbättras för att säkerställa att systemet håller hög kvalitet.

  //=== Testplan
  //Här definieras testningsprocessen för systemet. Detta inkluderar hur tester ska genomföras, dokumenteras och vilka verktyg som används till detta.

  //=== Testrapport
  //Detta dokument är en uppföljning på testplanen som utvärderar testresultatet samt bedömer produktens kvalitet.
]

#frag4[
  == Utbildning i form av workshoppar <metod:utbildning>

  // SamuelT ändrade formulering på sista meningen.
  // Ändrade från workshops till workshoppar då det är korrekt enligt SAOL
  Innan utvecklingen av produkten påbörjades, anordnade gruppen två interna workshoppar. Den ena workshoppen fokuserade på backend-utveckling och konfiguration medan den andra fokuserade på frontend-utveckling. Alla uppmuntrades att delta på båda workshopparna för att bekanta sig med de språk och verktyg som skulle användas under projektets gång. Projektmedlemmar med kunskap inom vardera tekniskt område ansvarade för att förbereda material och uppgifter till övriga medlemmar. Innehållet i dessa workshoppar var en blandning av teoretisk genomgång och praktiska moment, där projektmedlemmarna kunde diskutera, samarbeta och dela kunskap med varandra.

  Under backend- och konfigurationsworkshoppen introducerades och installerades konfigurationsverktyg. Uppgiften på backend-workshoppen var att skapa två ändpunkter, en för att ta emot en lista med redovisade tider och en för att lägga till en redovisad tid. För utförandet fanns en enkel förberedd webbsida som visade de redovisade tiderna och gjorde det möjligt att redovisa tid. Ytterligare en förberedelse var given kod med en lista som sparar redovisade tider som en startpunkt.

  I workshoppen som fokuserade på frontend följde projektmedlemmarna en handledning i ramverket Svelte där man fick skriva grundläggande kod i TypeScript.

  == Arbetsuppdelning i frontend och backend
  // Stina: Detta relaterar till frågeställningen om att arbeta i separat frontend och backend grupp
  // Simon: reforma hela punkten 05-02
  Projektgruppen delades in i två huvudsakliga arbetsgrupper med fokus på frontend- respektive backend-utveckling med egna utvecklingsledare. Utvecklingsledarna hade ett större ansvar för att leda och samordna arbetet inom sin grupp. Uppdelningen gjordes för att minimera förvirring och överlappande arbete. Genom att dela upp gruppen kunde medlemmarnas varierande kompetens tas tillvara på. Vissa hade sedan tidigare mer erfarenhet av backend och andra av frontend, vilket gjorde det naturligt att arbeta i separata spår.
  
  Valet att arbeta uppdelat grundade sig också i projektmedlemmarnas individuella intressen. Flera av projektmedlemmarna tyckte olika delar av utvecklingsarbetet verkade mer givande. Dessutom speglade valet kring uppdelningen gruppens uppfattning om hur ett projektteam skulle vara strukturerat, med arbetsuppgifter fördelade efter kompetens och intresse.
  
  Grupperna arbetade till stor del självständigt, med egna möten och separata sprintuppgifter. Utöver detta samlades hela projektgruppen två gånger per sprint för gemensamma sprintmöten och avstämning.
  
  Samarbete mellan grupperna skedde löpande under projektets gång, främst när nya gränssnitt implementerades och krävde ny logik från backend-servern.
  Syftet var att skapa tydliga ansvarsområden inom respektive arbetsgrupp, samtidigt som varje medlem skulle behålla en god helhetsförståelse genom regelbunden kommunikation. 


  // Resultat/diskussion: Denna struktur skapade tydlighet och bättre fokus i respektive arbetsgrupp samtidigt som en helhetsbild behölls genom regelbunden kommunikation. 
  
  //Frontendgruppen ansvarade för att ta fram en designprototyp i verktyget Figma. När en första version var klar gav backendgruppen feedback och genomförde SUS-tester på designen internt i projektgruppen.
]
//Alice 14/4 feedback: "Frontend-gruppen ansvarade för att ta fram en designprototyp"... relevant att ta upp här? Om ja, kanske isf prata mer om backend?
// Isabel 23/4: nämn *varför* vi har delat upp oss på detta sätt. T ex att applikationen innehåller mycket frontend och backend och krävde separata team som specialiserade sig på respektive del, för att kunna uppnå bästa resultat. Passar kanske bättre i resultat/diskussion senare

#frag1[
  == Utveckling av arbetsprocess
  // Stina 20/5: Har flyttat mycket härifrån till resultat eller teori
  Projektgruppen valde att inledningsvis arbeta med en klassisk version av Scrum, såsom beskrivet i @scrum_beskrivning, i kombination med ett Kanban-bräde, som beskrivet i @teori:kanban. Till skillnad från en klassisk version av Scrum fokuserade projektgruppen inte på att leverera en fungerande produkt i slutet av varje sprint, och hade därmed inte regelbundna demonstrationer för kunden. Arbetsprocessen anpassades genom kontinuerliga utvärderingar under projektets gång. Syftet med att etablera en tydlig metodik var att skapa ett strukturerat och effektivt arbetssätt, vilket i sin tur förväntades bidra till ökat kundvärde.////Alice 22/5 feedback: BRA att ni ref till frågeställning snyggt!

  I slutet av varje sprint hölls ett avslutningsmöte som motsvarade både sprint retrospektiv och sprint review. Under mötet diskuterade gruppen sprintens resultat, nästa steg i implementeringen, förbättringsförslag till nästa sprint och problem som uppstått. Projektmedlemmarna fick även anonymt besvara ett formulär, enligt beskrivningen i @utv-formulär, för att bedöma sprintens genomförande. Gruppen utgick sedan efter förbättringsförslagen och bestämde vad i arbetsprocessen som skulle ändras till nästa sprint. //Alice 22/5 feedback: Nämna kort om vårt formulär?
  //Stina: Fixat!

  Denna iterativa förbättringsprocess ledde till att en arbetsmetod utvecklades som var anpassad till projektgruppens behov och arbetssätt. Förbättringarna och resultatet av denna arbetsmetod beskrivs i @resultat:scrum. 
]

#frag1[
  == Kvalitetsmätningar <kvalitetsmätningar> // Hette innan "Mätningar på kvalité"/"Produktkvalitet" /IN
  För att uppfylla de kvalitetskrav som fastställts i projektets kravspecifikation genomfördes kontinuerliga mätningar av prestanda, användbarhet och tillförlitlighet. Syftet med mätningarna var att säkerställa att produkten skapar värde för kunden.
  
  För att mäta prestanda och säkerställa att LCP @ref:LCP inte överskred 2,5 sekunder i minst 95% av testfallen användes verktyget _lighthouse-ci_ @ref:lighthouse-ci. En pipeline sattes upp i Azure DevOps som automatiskt genererade en sammanställning över alla Web Vitals-värden @ref:webvitals, inklusive LCP. //Alice 22/5 feedback: Ni sa LCP ovan så kanske ha med detta där ist?
  Under mätningarna användes en konsekvent bandbredd genom att emulera 4G-nätverk, för att minska varians. //Alice 22/5 feedback: Bör inte lighthouse vara skriven kursivt som allt annat?
  //Stina:Fixat!
  // Isabel 22/5: Emulerades ett 4G-nätverk på riktigt? Om inte så kan man ta bort det exemplet
  //Stina: det gjordes det

  // Isabel 22/5: Om vi tar upp användbarhetstesterna här behöver vi nämna resultatet från dem i Resultatet. (Just nu nämns bara det andra fallet när externa personer testade)
  //Stina: Resultatet finns i tabellen och nämns i diskussionen
  Användbarhetstester, enligt metoden som beskrivits i @sus_beskrivning, genomfördes vid två tillfällen under produktens utvecklingsfas. Det första testtillfället ägde rum under den andra sprinten och då deltog samtliga 9 projektmedlemmar. De utförde totalt 8 definierade uppgifter i systemet, med syftet att identifiera tidiga brister i användarupplevelsen. Det andra testtillfället skedde under den femte sprinten och då deltog 13 externa personer. Varje medlem i projektgruppen hade ansvaret för att hålla i användartester för en till två personer. Vid detta tillfälle fick deltagarna utföra fyra fördefinierade uppgifter, utformade för att täcka största delen av produktens funktionalitet.
  Syftet var att säkerställa att produkten uppfyllde kvalitetskravet om ett genomsnittligt betyg på minst 68 poäng i en SUS-mätning. Efteråt fyllde de i ett SUS-formulär med tio påståenden om deras användarupplevelse och betygsatte hur väl varje påstående stämde på en skala från ett till fem. 
  // Isabel 22/5: Det skulle passa bättre att ha frågorna i teorin, där vi pratar om hur poängen beräknas utifrån udda/jämna frågor. 
  //Stina: Har flyttat det

  
  Utöver SUS-formuläret fick testdeltagarna även möjligheten att ge generell feedback och förbättringsförslag på produkten. Den insamlade feedbacken diskuterades sedan på ett av projektgruppens möten och relevanta åtgärder vidtogs med syftet att förbättra systemets användbarhet.

  För att säkerställa systemets tillförlitlighet skapades automatiserade tester med målet att täcka 95% procent av backend-koden genom _statement coverage_. _Statement coverage_ innebär att varje rad i koden testas minst en gång. Det var även önskvärt att öka testningens _branch coverage_, som innebär att testerna täcker alla möjliga logiska grenarna i koden.
  // Isabel 22/5: Lade till sista meningen om branch coverage eftersom vi tar upp det i resultatet


  // Vid projektets början hölls ett uppstartsmöte tillsammans med hela gruppen och kunden där kunden berättade hur de ville ha produkten. Anteckningarna från mötet låg till grund för projektets _Kravspecifikation_ @ref:kravspecifikation som är projektgruppens och kundens överenskomna krav på produkten. Under arbetets gång har _Kravspecifikationen_ uppdaterats i samförstånd med kunden och efterföljts genomgående i programutvecklingen.

  //Kunden har från projektets start betonat vikten av att systemet ska vara användarvänligt. För att säkerställa att produkten uppnår kundens krav har regelbundna användbarhetstester genomförts i slutet av varje sprint, när produkten varit testbar. Testningen har genomförts av externa personer för att få olika perspektiv på produkten och har bestått av ett antal tydligt definierade uppgifter i systemet. Efteråt har testdeltagarna fyllt i ett SUS-formulär med tio påståenden om sina upplevelser av systemet och betygsatt hur väl dessa påståenden stämmer på en skala ett till fem. En mer detaljerad beskrivning av SUS finns i @sus_beskrivning.
  //Genom att genomföra användbarhetstester regelbundet har utvecklingen kunnat ske i samspel med användarna, vilket har gjort att designförbättringar för ökad användbarhet har gjorts löpande.
]

#frag2[
  == Erfarenhetsinsamling // Metod för att fånga erfarenheter
  //Alice 25feb: enligt lisam tddd96 ska vara i metoden: "Metod för att fånga erfarenheter"
  // Alice 6/3: Kopplat till frågeställning: Vilka erfarenheter kan dokumenteras från programvaruprojekt _TRS_ som kan vara intressanta för framtida projekt?
  // Hur vi fångar erfarenheter
  // hur vi använder dessa erfarenheter för att koppla till (diskussionen)

  // Axel 14/4: Ska man skriva "för beskrivning", räcker inte "se @scrum_beskrivning"?
  I genomförandet av kandidatprojektet samlades erfarenheter in av gruppen och medlemmarna. Erfarenheterna handlade om projektarbetet, den centrala arbetsprocessen _Scrum_ och tekniska lärdomar.
  // Den centrala arbetsmetoden i fokus var _Scrum_, se @scrum_beskrivning för beskrivning.
  //Den analyserades i slutet av varje sprint genom en enkät som skickades ut till gruppens medlemmar.
  //Varje sprint pågick i en vecka.
  //Dessutom hölls en utvärdering i slutet av varje sprint som inkluderade en diskussion i helgrupp om hur sprint-processen har fungerat.

  
  === Utvärdering av process
  Under tidens gång anpassades den huvudsakliga arbetsmetoden _Scrum_, och även mindre processer, utefter utvärderingar som genomfördes under sprint retrospektiv. Under mötet diskuterades och dokumenterades både positiva och negativa erfarenheter från sprinten. Följande frågor användes som utgångspunkt för diskussionen:
  - Vad gick bra respektive dåligt under sprinten?
  - Vilka problem uppstod och hur löstes dessa?
  - Vad kan förbättras eller göras annorlunda inför nästa sprint?

//ALICE nämna att kvalitetsansvarig såg tll att samla in erfarenheter till kandidaten.  antal uppgifter
//Stin 22/5: Åtgärdat
  
  Insikterna från utvärderingen dokumenterades och sammanställdes av kvalitetssamordnaren och användes sedan som underlag vid planeringen av nästa sprint.

  === Utvärderingsformulär <utv-formulär>
  I slutet av varje sprint fick samtliga projektmedlemmar anonymt besvara ett formulär för att bedöma sprintens genomförande. Formuläret bestod av skalfrågor där en etta representerar missnöje och en femma nöjdhet. 

  Insamlad data analyserades för att identifiera förbättringsområden.
  Formuläret bestod av följande frågor: 
  + Var sprintmålen tydliga och realistiska?
  + Hade teamet en god kommunikation och samarbete under sprinten?
  + Kunde de planerade uppgifterna levereras i tid och med god kvalitet?
  + Sprint retrospektiv hjälpte oss att identifiera förbättringsområden och utvecklas som team.
  + Arbetsbelastningen under sprinten var rimlig och hållbar.
  + Jag är överlag nöjd med hur denna sprint genomfördes.


=== Processdokumentation
För att dokumentera erfarenheter under projektets gång, fördes ett protokoll under varje möte, med undantag för dagligt Scrum-möte. Protokollet var särskilt viktigt under möten som rörde uppstart av sprint och utvärdering av sprint.
Det var betydelsefullt för att kunna reflektera över det utförda arbetet och följa de förändringar som genomfördes i Scrum-processen. Kvalitetssamordnaren antecknade förändringarna till efterkommande sprint och sammanställde antal avklarade sprintuppgifter. 
]
#frag3[
  == Systemanatomi<metod:systemanatomi>
  
  Under projektets ////Alice 22/5 feedback: I 4.1 säger vi att vi skapade den endast i planeringsfasen (och i resultatet säger vi att faserna slogs ihop) // Anton korrigerade detta 23/5
  planeringsfas skapades en systemanatomi med syfte att ge en översikt över systemet TIDIG:s funktioner och egenskaper.
  Projektgruppen delade upp sig i tre arbetsgrupper som designade varsin systemanatomi. Vid skapandet av systemanatomin utgick varje arbetsgrupp från systemets användarfunktioner. För att identifiera användarfunktionerna användes kraven som definierats i kravspecifikationen.
  
  Vid skapandet av varje anatom för systemanatomin identifierades de underliggande funktioner och komponenter som krävdes för anatomen i fråga @ref:the-system-anatomy. Därmed identifierades alla beroenden mellan funktioner och komponenter. Dessa kopplades sedan ihop med pilar baserat på vilka funktioner och komponenter som interagerar med varandra. Slutligen strukturerades anatomerna upp i följande abstraktionslager:

  \
  + Användarfunktioner
  + Användargränssnitt
  + Serverfunktioner
  + Databassystem
  + Hårdvara
  \

  Efter att de tre grupperna skapat ett utkast vardera för systemanatomin sammanställdes dessa till en slutlig systemanatomi. Systemanatomin justerades utifrån återkoppling från handledare och examinator i kursen.

  Tanken var att under projektets gång kontinuerligt följa upp och uppdatera systemanatomin för att säkerställa en gemensam förståelse av systemets struktur och beroenden. I @resultat:systemanatomi redogörs det faktiska utfallet.

  #box[
  === Utvärdering av systemanatomin
  
  Under slutfasen av projektet gjordes en utvärdering för att få en bild över hur gruppen upplevde att systemanatomin hjälpte utvecklingen och om det upplevdes att systemanatomin användes som den skulle. En enkät skickades ut till varje deltagare som värderade olika påståenden på skalan 1-5. 1 motsvarar att påståendet inte stämde och 5 motsvarar att påståendet stämde bra.
  //Alice 22/5 feedback: Tror indenterat stycke ej behövs här // Anton korrigerade detta 23/5
  Enkäten bestod av följande påståenden:

  \
  + Systemanatomin hjälpte mig att få en överblick över hela systemet. 
  + Jag förstod bättre hur olika delar av systemet hängde ihop tack vare systemanatomin.
  + Systemanatomin underlättade vårt arbete med att planera utvecklingen.
  + Jag använde systemanatomin regelbundet under projektets gång.
  + Jag tror att systemanatomin hade fungerat bättre om vi la mer tid på att uppdatera den.
  + Jag skulle rekommendera att använda systemanatomi i liknande projekt.
  + Jag upplevde att systemanatomin bidrog till ett bättre slutresultat.
  \
  Resultatet för enkäten redovisas i @resultat:utvärdering_av_systemanatomin.
  ]

]

= Resultat
//- _Resultat presenteras faktamässigt, objektivt_
//- _Ingen analys, diskussion eller värdering ännu. Det sker i nästa rubrik._
//- _Resultat-rubriken ska ha samma rubriker som Metod-rubriken (t ex förstudie, implementation, utvärdering)_
//- _Innehåll: redovisa kortfattat men i detalj vilka tekniker som har använts (men inte hur de är implementerade): t ex SQL, Flask._
//- _Läs mer här som alltid:_ https://www.ida.liu.se/~TDDD83/info/material/TDDD83-Exjobbsanvisning.pdf

Detta kapitel beskriver det system och de processer som har utvecklats för att besvara frågeställningarna i @frågeställning, med stöd av de metoder som beskrivs i @metod. Här presenteras även projektgruppens gemensamma erfarenheter från arbetet.
//Alice 22/5 feedback: Lägga till om att vi visar vårt resultat som relaterar till våra frågeställningar? Ex:  "detta kapitel redovisar de resultat som framkommit under projektet och som relaterar till frågeställningarna i Avsnitt..." Nåt åt de hållet?


#frag1[
  == Värde för kunden <res:värde>
  Genom att uppfylla alla krav i kravspecifikationen kunde värde för kunden säkerställas.//Alice 22/5 feedback: Meningen får det att låta som att värde för kunden säkersställs genom att man "strävar" efter kraven, ej uppfyllelse. 
  //stina:fixat
  Utöver detta anpassades även applikationen efter användning på mindre skärmstorlekar såsom mobila enheter. 

  För att minska risken för missförstånd har kontinuerlig kontakt med kunden upprätthållits under projektets gång. Vid oklarheter eller frågor har projektets analysansvarige och konfigurationsansvarige kontaktat kunden via mejl, och vid behov deltagit på kundmöten. 

  För att få en djupare förståelse för kundens behov genomfördes en undersökning där ett formulär skickades ut till de anställda på DIGIT. Formuläret innehöll frågor om hur det nuvarande tidsrapporteringssystem används, dess för- och nackdelar samt förbättringsförslag. Resultatet gav en djupare förståelse av användarnas behov och önskemål. Detta togs i beaktande vid utformandet av TIDIG för att skapa värde för kunden. 
  
  /*Följande frågor ingick i formuläret:
  
  + Vilka funktioner eller aspekter i det nuvarande systemet tycker du fungerar bra och vill att vi behåller i det nya systemet?
  + Vilka är de största problemen du upplever med det nuvarande systemet? Är det någonting som känns onödigt eller krångligt?
  + Finns det några specifika funktioner du saknar i det nuvarande systemet?'
  + Vilka förbättringar skulle göra det lättare för dig att använda ett nytt tidredovisningssystem?
  + Använder du import/export-funktionen? Om ja, när och varför gör du det?
  + Hade du velat ha en mobilversion av tidredovisningssystemet?
  + Har du några exempel på gränssnitt som tilltalar dig och som du vill att vi ska efterlikna?
  + Skulle det vara enklare för dig att registrera arbetstid genom att ange start- och sluttid istället för att bara fylla i det totala antalet arbetade timmar?
  + Har du några övriga kommentarer eller förslag på förbättringar?
  
  Formuläret innehöll även specifika frågor till administratörer, dessa visas nedan:
  + Hade du velat ha en sökfunktion för att söka på specifika personer och projekt?
  + Hade du velat ha en funktion som visar flextid och räknar ut hur mycket tid som är kvar att spendera på projektet?
  */

  //Alice 14/4 feedback: Jag gillar det som står här men jag skulle nästan ta detta mer som metod. But idk.
  //Stina: har för mig att detta var i metoden tidigare men att eric ville att vi skulle flytta det hit
  //Alice 22/5 feedback: Jag håller typ kvar lite vid metod relatera. MEN det som jag hellre vill ge feedback på: Vi visar typ alla frågor och formulär för annat här, men vi visar inte resultatet/frågorna av denna. Kanske vara nice och lägga in det?
  //Stina: lade in det

  == Kvalitetsmätningar
  Resultatet av de mätningar som utfördes på webbapplikationens LCP @ref:LCP visas i @LCP-resultat. Resultatet baseras på innehållet i main-branchen och ändpunkten /tasks, som visar uppgifter som användaren är tilldelad. Alla mätningar, med undantag för den som genomfördes den första maj, resulterade i tider under den övre gränsen på 2.5 sekunder enligt produktens kvalitetskrav. 
  Direkta mätningar i en webbläsare visade istället ett //Alice 22/5 feedback: "visar" => visade?
  //stina: fixat
  genomsnittligt LCP-värde på 0.3 sekunder, vilket tyder på att den automatiska mätningen ger missvisande resultat.
  // SamuelT 5/5: Ändrade "routen" till "ändpunkten" så det matchar resten av texten. 
  // Isabel 22/5: Vad innebär *användarens webbläsare*? Räcker det med att skriva "manuella mätningar i en webbläsare visar ..." ?
//stina: fixat
  #figure(
    table(
      columns: 11,
      [*Datum*], [*15/4*], [*16/4*], [*17/4*], [*18/4*], [*20/4*], [*21/4*],[*22/4*],[*23/4*],[*24/4*],[*1/5*],
      [*LCP*], [2.2], [2.2], [2.2], [2.2],[2.3], [2.3],[2.3],[2.3], [2.1], [2.9]
    ),
    caption: [Resultatet av LCP-mätningar i sekunder],
  )<LCP-resultat>

  Resultatet från SUS-mätningarna presenteras i @SUS-resultat, medan de påståenden som användes i mätningarna beskrivs i @kvalitetsmätningar. Användartesterna som utfördes under den andra sprinten utfördes internt inom projektgruppen medan testerna under den femte sprinten utfördes av externa personer. Båda mätningarna resulterade i SUS-poäng som överskred den nedre gränsen på 68 poäng, i enlighet med produktens kvalitetskrav. Återkopplingen från testpersonerna i samband med testerna som genomfördes under den femte sprinten beskrev systemet som visuellt tillfredsställande, lättförståeligt och familjärt då det följde LiU:s gränssnitt. Det fanns även förbättringsrekommendationer som innefattade kommentarer på vissa ord som var svåra att tyda och generella fel i designen. Under testningen upptäcktes även buggar i systemet som därmed kunde åtgärdas av gruppen. //Alice 22/5 feedback: Nämna att vi hittade buggar.
  //Stina:fixat
  //Alice 22/5 feedback: Minns ej om ni tagit upp det innan, men tycker det är bra att ta upp här att första gången var intern SUS testning och andra extern. OCH om ni inte har med det i diskussionen skulle jag tycka det vore bra att lägga till lite snack om att SUS mätningarna troligen var bättre första g PGA att det var just internt. 
  // Stina: Det nämns i metod men förtydligade det och lagt till lite i diskussionen

  #figure(
      table(
        columns: 12,
        table.cell(rowspan: 2)[*Sprint*],
        table.cell(colspan: 10)[*Medelvärde på SUS-fråga*],table.cell(rowspan: 2)[*Totalt*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*],[*7*], [*8*], [*9*], [*10*],
          [*2*], [4.17], [2.0], [4.0], [1.5], [4.3], [2.3],[4.8], [1.7], [4.7], [1.8],[81.7],
        [*5*], [3.92], [1.92], [3.92], [1.46], [4.15], [2.08],[4.46], [1.62], [4.08], [1.77],[79.23]
      ),
      caption: [Resultat från SUS tester],
    )<SUS-resultat>

  // Stina: denna del behöver uppdateras när vi vet hur mycket kod som täcks av testerna
  För backend-koden skapades automatiserade tester i syfte att uppfylla kvalitetskravet om 95 % testtäckning. I slutet av projektet uppnåddes 77% _statement coverage_ och 75% _branch coverage_. 

  //- _Analysera/diskutera resultatet _
  //- _Referera till källor som är relevanta för diskussionen_
  //- _Läs mer här:_ https://www.ida.liu.se/~TDDD83/info/material/TDDD83-Exjobbsanvisning.pdf
]


#frag1[
  == Processbeskrivning <resultat:processbeskrivning>
  Avsnittet beskriver hur projektgruppen har arbetat med Scrum kombinerat med Kanban-bräde samt hur arbetssättet har utvecklats under projektets gång.
  // • Hur har ni arbetat i projektet?
  // • Dokumentera process i fokus, förbättra process, utvärdera förbättringen
  // • Beskrivning av mätningar – inkl mätningar av kvalitetskrav

  === Process i fokus <resultat:scrum>
  // Stina: flyttat delar av det som stod här tidigare till metoden. Här försöker jag beskriva exakt hur vi har jobbat och vår variant av Scrum.

  Projektgruppen arbetade i sprintar på en till tre veckor. I början av varje sprint tilldelades samtliga medlemmar någon av följande roller: Scrum master, produktägare eller medlem i utvecklingsteamet. Scrum mastern ansvarade för att leda möten, produktägaren hanterade sprintbackloggen och samtliga medlemmar i teamet var ansvariga för att genomföra uppgifterna. Teamledaren hade permanent rollen som Scrum master eftersom båda roller har liknande ansvarsområden. Initialt var kvalitetssamordnaren produktägare men ansvaret fördelades sedan mellan tre projektmedlemmar: frontendutvecklingsledaren, backendutvecklingsledaren och den dokumentansvarige. 

  En produktbacklogg upprättades, baserad på de milstolpar och aktiviteter som definierats i projektplanen. Inför varje sprint skapades även en sprintbacklogg som visualiserades med hjälp utav ett Kanban-bräde i Azure DevOps. Mötesprotokoll för sprintplanerings- samt retrospektiv-mötena skapades även för att säkerställa att alla relevanta ämnen behandlades.

  Inför varje planeringsmöte fick produktägarna i uppgift att förbereda ett förslag på sprintbacklogg. Inledningsvis gick projektgruppen igenom samtliga sprintuppgifter i helgrupp, tilldelade ansvar och prioriterade dessa på en skala från ett till fyra, där fyra motsvarade högst prioritet. Processen utvecklades därefter baserat på utvärderingar för att bland annat effektivisera planeringsmötena. //Alice 22/5 feedback: Processen utvecklades väll inte för mötenas skull?
  //Stina: Fixat!
  Mötet inleddes därefter med att gruppen gemensamt gick igenom de sprintuppgifter som berör samtliga projektmedlemmar, såsom exempelvis dokumentation. Därefter delades gruppen upp i frontend och backend. Varje utvecklingsledare gick då igenom relevanta sprintuppgifter inom sitt arbetsområde. Slutligen samlades hela gruppen igen för gemensam återkoppling, tekniska diskussioner och bedömning av sprintens rimlighet.

  De dagliga Scrum-möten hölls initialt på distans via Discord klockan 12:30, men detta ändrades sedan till klockan 11:03 för att passa projektmedlemmarnas schema. Till en början hade projektgruppen separata mötesprotokoll för Scrum-relaterade möten respektive vanliga gruppmöten. Dessa mötespunkter integrerades sedan till ett kombinerat mötesprotokoll för att samla all dokumentation på samma ställe.

  Uppgifterna organiserades i olika kategorier på Kanban-brädet som baserades på sprintens övergripande mål. Dessa kategorier var generellt dokumentskrivning samt frontend- och backendutveckling. Under den sista sprinten av produktens utvecklingsfas gick utvecklingsledarna igenom kravlistan och milstolparna i projektplanen. Sprintuppgifterna skapades utifrån det som återstod att implementera och organiserades i kategorier beroende på vilket krav de relaterade till.

  För att visualisera uppgifternas prioritet färgkodades uppgifterna, där varje färg representerade en viss prioriteringsnivå. De flesta uppgifter tilldelades en ansvarig person under sprintplaneringsmötet, men under de tre första sprintarna lämnades vissa uppgifter utan en utsedd ansvarig. //Alice 22/5 feedback: I vissa fall allmän eller för denna gång? Har för mig att vi såg till att alla uppg fick ansvarig person
  //Stina: Skrev om lite men i frontendgruppen var det iaf många uppgifter utan ansvarig
  Projektmedlemmar som senare under sprinten hade tid att utföra uppgiften kunde därmed skriva upp sig som ansvariga. //Alice 22/5 feedback: Det somm kommer här, var det inte precis de ni nyss sa?
  //Stina: Tog bort det

  Projektgruppen strävade efter att inte skapa nya sprintuppgifter efter sprintplaneringsmötet avslutats. Om det ändå ansågs nödvändigt att lägga till nya uppgifter, markerades detta tydligt i uppgiftens titel att det var en nyligen tillagd uppgift. Sprintuppgifter som inte hann färdigställas under en sprint flyttades över till nästkommande sprintbacklogg. Ett undantag var den femte sprinten som varade i tre veckor och innehöll ett möte i mitten av sprinten då det var tillåtet att skapa nya sprintuppgifter.

  === Utvärdering av process //IN, flyttat en del av denna till metoden

  Resultatet från de första fyra sprinterna presenteras i @formulär-veckoresultat vars frågor beskrivs i @utv-formulär. Fråga 4 besvarades inte efter den första sprinten eftersom sprint retrospektiv inte hade genomförts då. //Projektgruppen arbetade inte i sprinter under vecka 12 till 13 på grund av uppehåll i arbetet i samband med tentamensperiod./Isabel 23/5: tog bort veckor då de inte nämns någon annanstans

  #figure(
    table(
      columns: 7,
      [*Sprint*],
      [*Fråga 1*],
      [*Fråga 2*],
      [*Fråga 3*],
      [*Fråga 4*],
      [*Fråga 5*],
      [*Fråga 6*],

      [*1*], [3.44], [2.56], [2.56], [-], [3.67], [3.00],
      [*2*], [4.11], [3.78], [3.67], [4.00], [3.89], [4.22],
      [*3*], [3.22], [3.56], [3.11], [3.56], [3.78], [3.67],
      [*4*], [4.22], [3.00], [3.67], [3.67], [4.33], [3.78],
      [*5*], [4.00], [3.67], [3.44], [3.78], [3.00], [3.89],
    ),
    caption: [Medelresultat på reflektionsformulär],
  )<formulär-veckoresultat>

  // Anton feedback 22/5: Går det att få alla rader på samma sida? Ser udda ut
  //Stina: ser ut att vara på samma sida nu iaf
  #box[
  I slutet av varje sprint, under mötet för sprint retrospektiv, sammanställdes uppgifternas status på Kanban-brädet för att ge en översikt över sprintens resultat. Resultatet presenteras i @sprintresultat och visar att antalet uppgifter i sprintarna ökade över tid. 

  #figure(
    caption: "Sprintuppgifternas placering i Kanban-brädet i slutet av varje sprint.",
    image("pictures/sprintresultat.png"),
  ) <sprintresultat>
  ]

  // SamuelT 22/5: Tycker det är lite fult med två rubriker på figuren. Alltså figurtext och Titel. 
  //Stina: Fixat

  #pagebreak()
  // Anton feedback 22/5: Måste det vara pagebreak här? Utan den så kanske vi får plats med en större bild med mer detaljer
  == SusAF <resultat:susaf> //granskasavisabel
  //Alice 22/5 feedback: Hate to break it men det kanske behövs en ny bild med större ikoner. Det är väldigt svårt att läsa/oläsbart vissa postitlappar -FIXAT
  Resultatet av SusAF-analysen är både det Sustainability Awareness Diagram (SusAD) som syns i @susad.// och kartläggning av de viktigaste effekterna och önskade åtgärder i @synt. 
  Gruppen valde att markera positiva effekter med grön färg och ett plus (+) medan negativa effekter markerats gula och ett minus (-).
  
  SusAD synliggör risker och möjligheter som gruppen identifierade med produkten och deras beroenden. Potentiella möjligheter och positiva aspekter med systemet skulle, enligt SusAF-analysen, kunna vara att medarbetare sparar värdefull tid med ett smidigt rapporteringssystem vilket i sin tur hade kunnat bidra till ett mindre stressigt arbetsklimat. En potentiell risk hade däremot kunnat vara att vissa har svårare att sätta sig in i nya system och att systemet därför hade kunnat innebära en stressfaktor för dem.

  #figure(
    image("pictures/susad.svg"),
    caption: [SusAD över produkten]
  )<susad>
  // Jakob 22/5, bidrar den här något? För det första är innehåller extremt svårt att läsa om man inte har en pdf, sen är texterna inte renskrivna. Se nedan kommentar också

  #pagebreak()
  //@synt visar till vänster de hot och möjligheter som uppfattades viktigast av gruppen, och till höger visas idéer till hur hotet kan hanteras, eller möjligheten kan tas tillvara på.
  //Alice 22/5 feedback: Nämna att vi inte gjorde alla åtgärder. Ex möte med UX-designer. 
  
  //#figure(
  //  image("pictures/syntes.svg"),
  //  caption: [Identifierade risker och deras åtgärder]
  //)<synt> // Jakob 22/5. Tycker samma här som ovan. Finns många texter som hade behövt mer sammanhang, typ "Backup 3-2-1 lösning". Om något så tycker jag att vi borde sammanställa vad som står på bilden i text istället.

]
#frag2[
  == Gemensamma erfarenheter <resultat:gemensamma_erfarenheter>
  // • Överförbara (se slide 8 lisam kandidatarbete för mer info)
  // • Goda, mindre bra
  // • I projektets alla faser
  // • Tekniska, process-relaterade

  //Alice slut (info enligt lisam tddd96 atm den 25feb)
//ALICE FIXAR
  //SamuelT 22/5: Tycker inte riktigt det blir grammatiskt najs första meningen. -Alice 23/5 åtgärdat
  De gemensamma erfarenheterna inkluderar de processrelaterade och tekniska erfarenheter som erhållits av projektgruppen  under projektets gång. Scrum i relation till sprintuppgifter behandlas här och för mer ingående information hänvisas läsaren till @resultat:processbeskrivning.

  // Anton feedback 22/5: Jag tycker hela den här delen känns väldigt konstig. Det hade varit tydligare att skriva typ "De gemensamma erfarenheterna inkluderar de processrelaterade och tekniska erfarenheter som projektgruppen har erhållit under projektets gång. Detta inkluderar inte de erfarenheter som relaterar till Scrum, som istället finns tillgängligt i Avsnitt 5.4". Förövrigt så nämner vi Scrum i en hel rubrik i detta avsnitt vilket känns konstigt med tanke på att vi sagt att vi scrumrelaterade saker finns i avsnitt 5.4. -Alice 23/5 åtgärdat

  === Processrelaterade erfarenheter
  Under projektets genomförande har flera processrelaterade erfarenheter förvärvats. Dessa har uppkommit genom interna utbildningar, genomförandet av Scrum och lärdomar från projektgruppens kommunikation.
  
  ==== Projektets faser och planering <resultat:planering>
  Arbetet med olika projektfaser, som beskrivs i @metod:faser, har resulterat i flera erfarenheter kring planering. Den första fasen, analysfasen, inkluderade arbete med kravspecifikationen, men på grund av kursens tidiga inlämningsdatum för resterande dokument påbörjades även projektplanen och kvalitetsplanen under analysfasen. Detta resulterade i att analysfasen och planeringsfasen kombinerades till en fas där kraven samlades in parallellt med framställandet av projektplan och resterande dokument. Den ursprungliga tidplanen utgick från projektplanens milstolpar som placerades ut i projektets faser och innehöll en veckas tidsbuffert i slutet av projektet för eventuella förseningar. 

  När halva projekttiden passerat, och projektet befann sig i realiseringsfasen, behövde tidplanen justeras drastiskt eftersom flera milstolpar hade försenats. Det berodde på att det fortfarande saknades en komplett design av webbsida och implementationen med LiU-SSO hade försenats. 
  //Alice 22/5 feedback: berodde på istället för handlade om? -ISABEL FIXAT
  Denna försening resulterade i att den planerade tidsbufferten tog slut. Detta ledde till en större omorganisering av projektets tidplan då milstolpar tog längre än väntat att uppnå och den gamla tidplanen var för optimistisk.  
  Den nya tidplanen lade ett mindre fokus på projektets faser och etablerade istället nya perioder för produktutveckling och dokumentarbete i enlighet med Scrums iterativa sprintar. 
  De sprintuppgifter som togs fram efter omplaneringen utgick från milstolparna och kraven från kravspecifikationen, till skillnad från tidigare. 
  Vidare bestämdes ett datum för feature freeze då sprintuppgifterna skulle vara klara och då fokuset skulle läggas på testning och buggfixar. Slutligen färdigställdes systemet i tid för överlämning till kund. 

  // Isabel 21/5: Kanske ha med kommentarerna som står nedan
  //Den nya planeringen tog i åtanke både projektet, men även kursrelaterade åtaganden såsom dokument och seminarier. De nya sprintuppgifterna som skapades i samband med planeringen utgick från projektets milstolpar och krav från kravspecifikationen. Vidare bestämdes även ett datum för _feature freeze_ då sprintuppgifterna skulle vara klara, och då fokus skulle läggas på testning och korrigering av fel i koden. Den nya planeringen resulterade i nytt fokus och tydlighet gällande vad som skulle bli klart och när.
  //Den behöll dock avslutningsfasen och överlämningsfasen som senarelades till vecka 21 och 22. Möjligheten att flytta fram datumen berodde på att gruppen tänkt lägga allt fokus i slutet av projektet på dokumentskrivning av kandidatrapport, erfarenhetssammanfattningar och seminarier. Men nu skulle detta alltså ske parallellt med utvecklingen av TIDIG. 

  //TIDIGARE TEXTEN:
  
  //På grund av kursens inlämningsdatum för centrala dokument behövdes arbetet med projektplanen och kvalitetsplanen påbörjas parallellt med kravspecifikationen, som annars skulle skett i analysfasen. 
  //Detta skedde också innan en arbetsprocess hade etablerats. Följaktligen sammanfogades analysfasen och planeringsfasen till en sammanslagen fas. Vidare upprättades vissa dokument under etableringsfasen, vilka normalt sett upprättas i planeringsfasen. Dessa dokument bestod av testplanen samt designdokument såsom arkitekturdokumentet och systemanatomin. I projektplanens ursprungliga tidplan skulle produkten vara klar och färdigtestad till vecka 18. I denna planering ingick också en tidsbuffert på en vecka. Avsikten var att om det bedömdes att mer tid krävdes åt implementation av de centrala funktioner av TIDIG, skulle krav med prioritet två i _kravspecifikationen_ uteslutas från implementeringen och på sådant sätt spara en vecka av arbete. Den ursprungliga planeringen utgick också från projektplanens milstolpar.

  //I slutet på vecka 11 behövdes en omplanering och detta berodde på förseningar från kunden gällande implementation av LiU-SSO och att designen för hemsidan drog ut på tiden. För att hantera detta gjordes en anpassning i planeringen som senarelade den interna deadlinen för design samt implementering av LiU-SSO.
  
  // Jakob 3/5: Planerade vi verkligen om pga designen? Har för mig att vi började programmera långt innan den var klar så kommer inte ihåg att det var ett hinder -Alice Vi skriver om det som en erfarenhet att vi behövde gå vidare i implementationen och att det var därför vi bestlutade om design, så jag tolkade det som det. 

  //Vecka 14 var projektet inne i realiseringsfasen men saknade fortfarande en färdig design för frontend att implementera samt möjligheten att ordna med LiU-SSO. Detta resulterade i att tidsbufferten för projektets tidplan var slut i slutet på veckan och alltså skulle krav med prioritet två inte längre implementeras.

  //I slutet på vecka 15 påbörjades en omorganisering av projektets planering eftersom tidplanen inte längre gick att applicera, saker tog längre tid än förväntat och sprintuppgifterna hade fram tills dess inte direkt en koppling till milstolparna. Ännu en sak som bidrog till omplaneringen av tidplanen var en situation då projektgruppen var nära att missa ett inlämningsdatum i början på vecka 16. Till en början skapades ett nytt GANTT-diagram med ny fasplanering. Den nya fasplaneringen handlade mer om vilket typ av fokus som skulle läggas utifrån deadlines för dokument och seminarier i kursen. Den behöll dock avslutningsfasen och överlämningsfasen som senarelades till vecka 21 och 22. Möjligheten att flytta fram datumen berodde på att gruppen tänkt lägga allt fokus i slutet av projektet på dokumentskrivning av kandidatrapport, erfarenhetssammanfattningar och seminarier. Men nu skulle detta alltså ske parallellt med utvecklingen av TIDIG. 
  
  //Den nya planeringen tog i åtanke både projektet, men även kursrelaterade åtaganden såsom dokument och seminarier. De nya sprintuppgifterna som skapades i samband med planeringen utgick från projektets milstolpar och krav från kravspecifikationen. Vidare bestämdes även ett datum för _feature freeze_ då sprintuppgifterna skulle vara klara, och då fokus skulle läggas på testning och korrigering av fel i koden. Den nya planeringen resulterade i nytt fokus och tydlighet gällande vad som skulle bli klart och när. //Vid samma tidpunkt som organiseringen gick gruppen också igenom hur medlemmarna låg till med antal timmar, och den nya planeringen med uppgifter.....

 
////  - Resultat: händelser, "erfarenheter", men inga slutsatser
 // - Diskussion: analysera händelserna, diskutera möjliga lärdomar(för framtiden)
 // - Slutsats: välj de viktigaste lärdomarna från diskussionen


  //=== Scrum Alice ---ALCIE jag tar bort detta atm. Tyckte scrum ovan tar upp det viktigaste, kör direkt diskusison. 
  //Vattenfall med sprintar, itterativa faser. 
  //Dokuemt gjorde att vi behövde göra design först. 
  //DOkuemntskrivande tog upp tid. 
  
  
  //ALICE tycker vi kan smöra på mycket här. Ex ta upp att vi delade upp produktbackloggen till flera ansvariga för tat det var svårt om bara en kom på allt. Vi kan prata om erfarenheter i faserna vi haft. Erfarenheter av att ha en plan som inte funkar, erfarenheter av hur DÅLIGT det var att försöka estimera tid. Erfarenhet av att komma tillbaka till milstolpe och krav fokus i slutet. MASSOOOOOOR
  
  //==== Beslutsfattande <resultat:beslutsfattande> // Isabel
  //Redan i början av projektet blev det tydligt hur viktigt det är att dela upp ansvarsområden och ha en beslutsfattare som kan driva arbetet framåt. I projektet hade varje medlem ett område som de var ansvariga över, se @roller_ansvar, men de huvudansvariga i projektet var teamledaren, frontendutveckling- och backendutvecklingsledaren.
  //En specifik händelse som visade vikten av beslutsfattande uppstod under designfasen av användargränssnittet. Projektgruppen hade många designidéer och förslag men när uppstarten av realiseringsfasen närmade sig var det fortfarande osäkert vilka versioner av sidorna som var den slutgiltiga designen och en del sidor saknade en färdig design. // Sidor eller vyer?
  //Frontendutvecklingsledaren tog ett slutgiltigt beslut på vilken design som skulle implementeras av hemsidan. Detta resulterade i att utvecklingsteamet kunde fokusera sina resurser på att skapa en sammanhängande design på hemsidan.
  
  ==== Delning av kompetens <resultat:kompetens>//Isabel
  I projektet genomfördes interna utbildningar i form av workshoppar inom konfiguration, backend- och frontendutveckling, enligt @metod:utbildning. 
  Utbildningarna inom konfiguration och backendutveckling kombinerades till ett längre tillfälle, där både teoretiska och praktiska moment ingick. Utbildningens omfattning var bred och krävde vissa förberedelser under själva workshoppen, vilket resulterade i att en betydande del av tiden ägnades åt installationer och felsökning snarare än praktiskt lärande. 
  En insikt från workshoppen var att tydliga instruktioner och en avgränsad uppgiftsomfattning underlättade inlärning. Dessa insikter tillämpades i den nästkommande workshoppen inom frontendutveckling, där deltagarna följde en handledning i ramverket Svelte och därefter övade självständigt. //Detta upplägg visade sig vara framgångsrikt och uppskattades av gruppen.

  //Alice.
  ==== Scrum: Formulering av uppgifter <resultat:scrum_uppgifter>
  I @resultat:scrum står det att under varje sprintplaneringsmöte presenterades förslag på sprintuppgifter i Kanban-brädet. Ett återkommande ämne under sprint retrospektiv var att uppgifterna ofta upplevdes som alltför generellt formulerade och behövde brytas ner i mindre specifika deluppgifter. Exempelvis var uppgifter i första sprinten formulerade: "Design tidsrapportering dator" eller "Skriv kravspecifikationen". Otydliga uppgifter orsakade förvirring över när dessa skulle definieras som klara i Kanban-brädet. 
  //Alice 22/5 feedback: Omformulera ex "Otydliga uppgifter orsakade förvirring när dessa skulle definieras som klar i Kanban-brädet." -ISABEL FIXAT
  Därmed diskuterade gruppen under flera sprint retrospektiv hur uppgifter kunde specificeras bättre till sprinten därpå. I början på den femte sprinten bestämdes att gruppen behövde göra en omplanering. Detta resulterade i ett nytt Kanban-bräde presenterades i mitten av sprinten där varje deluppgift kunde kopplas till milstolpar och krav från kravspecifikationen. Slutdatumet på sprinten fick också större betydelse då slutdatumet på sprinten skulle vara dagen efter projektets _feature freeze_. Denna gång gick inte frontend-gruppen och backend-gruppen separat igenom uppgifterna, utan hela gruppen satt tillsammans när uppgifterna presenterades och delegerades. Detta gjorde att projektmedlemmarna hade möjlighet att ställa frågor på uppgifter de upplevde som otydligt formulerade och därmed kunde formuleringarna korrigeras.
  //Alice 22/5 feedback: Kanske lägga till att det också gjorde så att teammedlemmar fick bra överisitk på projektet/hur vi låg till. -ISABEL FIXAT: detta tas upp i diskussionen istället. 
  // SamuelT 22/5: Feature freeze förklaras redan två stycken upp. -ISABEL FIXAT

  ==== Kommunikation <resultat:kommunikation> //Isabel 
  Under projektarbetet uppstod det kommunikationsbrister när utvecklingsarbetet skedde på distans och i separata arbetsgrupper. 
  Det ledde till missförstånd och dubbelarbete. Som åtgärd etablerades gemensamma rutiner vilket inkluderar Kanban-verktyg, dagliga Scrum-möten och en ny Discord-kanal för att informera gruppen med statusuppdateringar. //SamuelÅ 22/5: Man kan skriva specifikt att det skapades ny Discord-kanal -Alice 23/3 åtgärdat
  Ytterligare ett problem med bristande kommunikation handlar om kundkontakten. Under vissa perioder av projektarbetet har det varit svårt att få kontakt med kunden, vilket har resulterat i förseningar av funktionalitet. Den bristande kommunikationen med kunden påverkade tillgången till resurser gällande deras inloggningssystem som användes för att logga in i TIDIG. Detta löstes genom att kunden erbjöd oss kontaktuppgifter till en systemutvecklare hos dem, vilket gjorde att kommunikation om de tekniska detaljerna skedde direkt med en systemutvecklare och underlättade därmed utvecklingsprocessen.

  //==== Git <resultat:git> //Isabel
  //I projektet användes Git som versionshanteringssystem vilket var mer utmanande med tanke på att hålla grenar och olika produktversioner separata från varandra. Det uppstod ett flertal _merge_ konflikter när flera olika versioner skulle integreras med varandra. Konfigurationsansvarig etablerade en regel att man enbart kunde lägga in sin kod i _main-grenen_ genom en _pull request_ där minst en annan person behöver granska koden i förväg. Teamet lärde sig snabbt att använda nya grenar för att utveckla olika funktioner men det resulterade även i att grenarna blev kvar i filsystemet och gjorde det svårt att hitta till rätt gren.
  
  === Tekniska erfarenheter
  Inför projektet hade projektmedlemmarna varierande tekniska erfarenheter, men det fanns alltid någon med grundläggande kunskap om programmeringsspråket eller ramverket som skulle användas. En bra erfarenhet av detta var hur värdefullt det var när personer med erfarenhet tog initiativ och planerade gemensamma workshoppar, skickade ut studiematerial och svarade utförligt på frågor från gruppen. Detta bidrog till att hela projektgruppen fick en gemensam förståelse av projektets tekniska grund.

  Inför projektet hade ingen i projektgruppen erfarenhet av Azure DevOps. Genom projektet har gruppen fått praktiska erfarenheter att använda verktyget, både för att hantera processen via Kanban-bräden, men även för testning och arbetsflöden. Medlemmar i gruppen hade tidigare erfarenhet att implementera databas genom att skriva SQL-kod. Men under detta projekt användes ASP.NET med C\#. Detta ledde till att gruppen behövde lära sig ett nytt programmeringsspråk. De kunde dock använda tidigare teori inom objektorienterad programmering och databaser för att underlätta inlärning och implementation.

  ==== Databasdesign och modellering
  Utvecklingen av TIDIG har gett projektgruppen teknisk erfarenhet av databasdesign och modellering av data genom _Entity Framework_. Arbetet gick ut på att identifiera de datatyper som gruppen kallar för _hårda datatyper_. Dessa har direkta motsvarigheter som databastabeller.
  Ett exempel på detta i systemet är `Task` och `User`. Systemets _hårda datatyper_ och deras relation med varandra modellerades med hjälp av EER-diagram och relationsdiagram. En viktig sak som gruppen insåg under projektet var att denna modellering inte täckte allt och att data hanterades olika i frontend och backend. Detta resulterade i att _tunna datatyper_ utvecklades. Exempel på dessa är `TaskView` och `UserView`. _Tunna datatyper_ innehåller den data från databasen som är relevant för frontend. Dessa datatyper tillät alltså systemets backend att skicka mindre data till frontend-servern. Exempelvis var detta bra då användarvyn inte behövde visa all data som backend hade om `Task`-objekten och därför kunde `TaskView` användas istället. 
  
  På grund av bristande kommunikation mellan arbetsgrupperna utvecklades sedan vissa stora datatyper som skulle skickas till frontend-servern och detta bröt mot den ursprungliga designen och strukturen. En viktig sak att nämna är även att arbetsgrupperna för backend och frontend undvek att prata ihop sig om ändpunkter och data som frontend-servern förväntade sig från backend-servern. Det skedde ett möte då detta togs upp men bara vissa ändpunkter hann behandlas. 
] 
// Ev. ta upp datatyper i teorin -Målgrupp U:are och D:are?
// Hård datatyp blir en databastabell -DONE
// Tunna datatyper är en sammanställning av data från flera olika databastabeller (mindre information för att frontend ska kunna få bara den essentiella datan) -DONE?
// Vad innebär större datatyper, omorganiseringen. -DONE?

#frag3[
  // Axel 22/5: Kan man minska bilden eller strukturera om texten så en pagebreak inte behövs här? Ser konstigt ut // Anton korrigerade detta 23/5
  //Alice 22/5 feedback: Tycker inte om pagebreak. Det blir jääätte tomt på förra sidan. Tror hellre ni kan ha texten på sidan ovan och sen ha bild om bilden ej får plats // Anton korrigerade detta 23/5
  // Anton feedback 22/5: Håller med ovanför nämnda kommentarer.
== Systemanatomi <resultat:systemanatomi>
    @systemanatomi visar den systemanatomi som projektgruppen skapade.
    Den skiljer sig från planerna beskrivet i @metod:systemanatomi. Det var exempelvis inte relevant att skapa ett lager för hårdvara, eftersom systemet endast är en mjukvarutjänst. 
    
    Systemanatomin visade sig vara som mest hjälpsam under projektets planerings- och etableringsfas. ////Alice 22/5 feedback: Här funkar analys-planering ihop för att det är resultatet 
    //Alice 22/5 feedback: Visade sig vara som mest hjälpsamt... Hur? Varför? Alltså: Visade sig hur?
    Den var till hjälp både för att skapa övergripande blockdiagram över systemet, se @blockschema, och vid utformningen av webbsida, då det fastställdes vilka vyer som skulle implementeras. //Alice 22/5 feedback: Åter igen Hur? Dessutom kanske man ska specificera hur det hjälpte att komma fram till vyyerna, vad kan jag somn läsare i diagrammet läsa av för att fatta "AHA det är denna vy". ;)

    Systemanatomin hade även viss användbarhet vid planering av testning. Den har hjälpt till att identifiera vilka delar av systemet och vilka funktioner som ska testas, speciellt vilka integrationer som är viktiga. Under realiseringsfasen har systemanatomin inte aktivt använts då den varken granskats eller uppdaterats.
    #figure(
      caption: "Systemanatomi",
      image("pictures/Systemanatomi.png"),
    ) <systemanatomi>

== Utvärdering av systemanatomins betydelse <resultat:utvärdering_av_systemanatomin>
 @resultatsystemanatomi innehåller resultatet på enkäten med frågorna samt dess medelvärde och standardavvikelser. Värderingen gjordes på skalan 1-5, där 1 motsvarade att påståendet inte stämde så bra och 5 motsvarade att påståendet stämde bra. Medelvärdet låg mellan 1 och 2.7, vilket kan tolkas som ett lågt resultat. Standardavvikelsen ligger som högst på 1.4, vilket betyder att svaren har medel till låg variation.

#figure(
  caption: [Gruppens svar på frågor kring systemanatomins användning.],
  table(
    columns: 3,
    align: (_,y) => {
      if y==0 {horizon+center}
      else {horizon+left}
    },
    table.header[*Fråga*][*Medelvärde (1-5)*][*Standardavvikelse*],
      [Systemanatomin hjälpte mig att få en överblick över hela systemet],
      [2.7],
      [1.2],
      [Jag förstod bättre hur olika delar av systemet hängde ihop tack vare systemanatomin.],
      [2.3],
      [1.4],
      [Systemanatomin underlättade vårt arbete med att planera utvecklingen.],
      [1.9],
      [1.4],
      [Jag använde systemanatomin regelbundet under projektets gång.],
      [1],
      [0],
      [Jag tror att systemanatomin hade fungerat bättre om vi la mer tid på att uppdatera den.],
      [2.4],
      [1],
      [Jag skulle rekommendera att använda systemanatomi i liknande projekt.],
      [1.7],
      [0.7],
      [Jag upplevde att systemanatomin bidrog till ett bättre slutresultat.],
      [1.8],
      [1],
    ),
)<resultatsystemanatomi>

]


#frag4[
  // #box[
  //   === Blockschema

  //   @blockschema illustrerar hur systemet TIDIG är uppbyggt. Till vänster syns den externa webbläsaren och dess kontakt med frontend-servern och till höger syns backend-servern med dess interna moduler. De block som är i utkanten på moduler är sådana som agerar gränssnitt. Exempelvis är _API(ASP.NET)_ ett gränssnitt mellan frontend- och backend-server samt är _Entity Framework Core_ ett gränssnitt mellan backend-server och databas.
    
  //   Blockschemat var användbart i planeringsfasen då det hjälpte både frontend- och backend-gruppen att få förståelse på vad delarna i systemet hade för roll. 

  // ]

  == Systembeskrivning //Alice ändrade allt till nutid i denna del 5.8 14/6 förutom sista som är i dåtid.
  TIDIG består av en backend-server som hanterar logik och interaktion med databas, samt en frontend-server som hanterar användarinteraktioner. Detta avsnitt utforskar systemets struktur och funktioner.

  === Frontend <systembeskrivning:frontend> //Alice ändrar tempus till nutid
  Frontend utvecklades i Svelte med TypeScript och använde Tailwind CSS för att ge komponenter styling, samt externa bibliotek som tillhandahöll färdiga CSS komponenter. All data hämtas från backend-servern via API-anrop.
  
  När en användare öppnar webbapplikationen omdirigeras denne automatiskt till inloggning via LiU-SSO, där även användarens behörighet hämtas. Systemet TIDIG stödjer två roller: _administratörer_ och tidredovisare. Administratörer är tidredovisare med utökade behörigheter, vilket innebär att deras version av systemet inkluderar extra funktionalitet.
  
  // Måste ändras om profilvy läggs till
  Användare kan navigera mellan vyerna för tidsredovisning, uppgifter, rapporter, statistik och profiler. Vyerna finns tillgängliga via ett navigeringsfält på stora skärmar eller via en rullgardinsmeny på mindre skärmar. Vyerna har även ett anpassat utseende baserat på skärmstorlek och dessa behåller även samtliga funktionaliteter.
  
  ==== Tidredovisning 
  Tidredovisningsvyn är startsidan för TIDIG. Där kan användare redovisa sin arbetade tid på de uppgifter användaren har tillgång till. @TIDIG_tidredovisning visar tidredovisningsvyn för stora skärmar. 
  #figure(
    caption: "Tidredovisningsvyn i TIDIG",
    image("pictures/TIDIG_tidsredovisning.png"),
  ) <TIDIG_tidredovisning>
  
  ==== Uppgifter 
  Uppgiftsvyn, se @TIDIG_uppgifter, ger användare möjlighet att se, gå med i, samt lämna samtliga uppgifter. I denna vy kan administratörer även skapa, redigera och arkivera uppgifter. Filtreringsalternativen är till för att filtrera vilka uppgifter som syns i uppgiftslistan.
  #figure(
    caption: "Uppgiftsvyn i TIDIG",
    image("pictures/TIDIG_uppgifter.png"),
  ) <TIDIG_uppgifter>
  
  ==== Rapporter 
  I rapportvyn, se @TIDIG_rapporter, kan användare få en översikt av sin redovisade tid. Dessa rapporter ger en överblick på månadsbas med möjlighet att se över historik från tidigare år. Administratörer kan även ta fram rapporter för enskilda projekt där enskilda tidredovisares tider kan tas fram. Administratörer kan även exportera rapporter i .csv-format för att hanteras externt.
  #figure(
    caption: "Rapportvyn i TIDIG",
    image("pictures/TIDIG_rapporter.png"),
  ) <TIDIG_rapporter>
  
  ==== Statistik
  Statistikvyn, se @TIDIG_statistik, visualiserar användarnas arbetstid för samtliga och enskilda uppgifter i form av ett stapeldiagram. Vyn innehåller även information om förväntad arbetstid, arbetad tid och flextid.
  #figure(
    caption: "Statistikvyn i TIDIG",
    image("pictures/TIDIG_statistik.png"),
  ) <TIDIG_statistik>

 ==== Profil
 I profilvyn, se @TIDIG_profil, finns information om de olika användarna samt deras aktiva uppgifter och rapporter. Profilsidan agerar även som inställningsmeny där användare kan ändra sin sysselsättningsgrad och sitt startdatum. Startdatumet används för beräkning av statistiken i statistikvyn.

  #figure(
    caption: "Profilvyn i TIDIG",
    image("pictures/TIDIG_profil.png"),
  ) <TIDIG_profil>
  
  
  

  // Jakob 22/5. Har vi förklarat på något bra sätt vad frontend servern är/gör? E.g. att det är vad användaren "pratar" med. Nvm, såg att det finns nedanför, men kanske borde vara innan detta stycke.  (FIXAT?), //jakob ja!
  === Backend
  Backend-servern har som uppgift att utföra all logik och datainsamling. Den ansvarar för att verifiera användarnas åtkomst genom LiU-_SSO_, hålla reda på användares sessioner och hämta samt spara data genom databasen. Allt detta görs tillgängligt genom ett webb-API utvecklad i ASP.NET. Denna kan frontend-servern använda för att få tillgång till den data som backend-servern hanterar. Varje ändpunkt och dess förväntade in- och utdata kan hittas i backend-serverns API-dokumentation som automatiskt genereras med verktyget NSwag. För att hantera databasen används verktyget Entity Framework Core, som gör det möjligt att generera databastabeller utifrån C\#-klasser. Verktyget gör det möjligt att skapa kopior av databasen eftersom strukturen definieras på ett ställe i koden. Detta har varit användbart då varje projektmedlem kunde ha en lokal databas under utvecklingen av TIDIG.

  // Till databasen användes verktyget  som gjorde det möjligt att skapa klasser i C\# som genererade tabeller, relationer och egenskaper i den faktiska databasen, i detta fall SQLite under utveckling och Microsoft SQL i produktionsmiljön. Verktyget gjorde det trivialt för varje utvecklare att skapa lokala kopior under utveckling som kunde uppdateras vid varje ändring gjorts med ett kommando.

  // #box[
  //   === Databas
  //   Databasen bestod av 7 tabeller, som kan ses i @db-diagram, och sparade all information som servern behövde lagra under längre tid. Exempel på sådan information är användare, uppgifter, redovisad tid och information om vem som gör anropet genom kakor (_session_). Diagrammet visar dessutom relationen mellan databasens olika tabeller.

  //   Till databasen användes verktyget _Entity Framework Core_ som gjorde det möjligt att skapa klasser i C\# som genererade tabeller, relationer och egenskaper i den faktiska databasen, i detta fall SQLite under utveckling och Microsoft SQL i produktionsmiljön. Verktyget gjorde det trivialt för varje utvecklare att skapa lokala kopior under utveckling som kunde uppdateras vid varje ändring gjorts med ett kommando.

  //   _Entity Framework Core_ arbetade med databasen genom funktioner som byggde på existerande datatyper i C\# vilket gjorde det enkelt att skapa komplicerade SQL-anrop med C\#-naturlig kod.
    
  //   #figure(
  //     image(bytes(read("pictures/databasdiagram.svg")
  //       .replace("#6F6F6F", black.to-hex())
  //       .replace("rgb(153, 153, 153)", black.to-hex())
  //       .replace("rgb(111, 111, 111)", black.to-hex()))),
  //     caption: [Diagram över databasen],
  //   )<db-diagram>

  // ]


  === Uppdelningen av frontend- och backend-server  <resultat:uppdelning> // samuelT
  På det sättet som systemet byggdes är backend-serverns ändpunkter bara tillgängliga genom frontend-servern. Det går alltså inte att skicka förfrågningar direkt till backend över internet. Denna struktur visas i @blockschema. Fördelen med detta är att kontrollen för vilka förfrågningar som kan skickas stannar hos frontend. 
  En nackdel med uppdelningen är att vissa ändpunkter behöver skapas två gånger. En gång på frontend-servern och en gång på backend-servern. Anledningen till detta är att vissa ändpunkter behöver kunna användas även efter att sidan laddats. 

  Att systemet är uppdelat i frontend- och backend-server har resulterat i att produkten fullföljer kravet om att backend är i  ASP.NET med C\# samtidigt som frontend-utveckling är i Svelte. 

  #figure(
    caption: [Blockschema över systemet TIDIG],
    image("pictures/Blockschema.png"),
  ) <blockschema>
  
  === Uppdelning i separata arbetsgrupper för frontend och backend
  Att dela upp webbapplikationen i två distinkta servrar: frontend och backend, gjorde att två arbetsgrupper naturligt kunde jobba parallellt på funktionalitet. Den tydliga uppdelningen förde dock med sig en del problem.

  En svårighet med att ha distinkta arbetsgrupper var att arbetet som den ena gruppen utförde ofta berodde på att den andra gruppens arbete fungerade. Från frontends sida krävdes exempelvis backend-ändpunkter för att kunna testa att koden fungerade. Från backends sida var det samtidigt svårt att utveckla ändpunkter när frontend inte på förhand visste exakt vilka de skulle behöva och hur de skulle fungera. Att backend-gruppen inte kunde utveckla ändpunkterna i förväg gjorde vid många tillfällen att ny frontend-kod inte kunde testas förrän flera dagar eller ibland över en vecka senare. Även när en ny ändpunkt förfrågades hände det ofta att dess funktionalitet att den ändrades under projektets gång. Stora delar av koden som skrevs i backend behövde därför skrivas om flera gånger vilket resulterade i arbete som kunde ha undvikits.
  //Alice 22/5 feedback: Det känns som  att ni kan prata om konsekvenser för backend också lite mer. Ex att vi fick göra om flera gånger, att vi fick göra om i backend för att frontend ändrade vilken datatyp de ville ha osvosv. Lägga till att de resulterde i onödigt arbete/tidsförsening kanske? Lägga till att frontend skapade en egen databas? Ja ni fattar :3 // Fixat
]




= Diskussion

// Frågeställning 2: Värdera lärdomarna som tas upp i resultatet. Koppla de till varandra. Diskutera det som hände och varför

Detta kapitel problematiserar och analyserar resultat kring värdeskapande för kunden, erfarenhetshantering, systemanatomi och uppdelning i arbetsgrupper. Den belyser även källkritik och de samhälleliga och etiska aspekter med produkten som har skapats.
//Alice 22/5 feedback: Alla andra gånger hitlls refereras till frågeställningarna men här gjorde det inte det. Blir lite konstigt. Dessutom trooor jag att fråg4 saknas? -ISABEL FIXAT

== Resultat
  //Stina 22/: Borde vi kanske skriva nåt här? Introduktion till avsnittet
  //SamuelÅ 22/5: Förslag: "Gruppens erfarenheter av SCRUM som arbetsmetodik samt upplevda för- och nackdelar med olika tekniska beslut kan tolkas på flera sätt. Detta avsnitt utforskar olika anledningar till varför resultaten blev som de blev."
  Gruppens erfarenheter från projektet och Scrum kan tolkas ur flera perspektiv. De tekniska beslutens påverkan på projektet och alternativa implementationssätt diskuteras.
//Gruppens upplevelser av projektet och arbetet med Scrum kan tolkas ur flera perspektiv. De tekniska beslutens styrkor och svagheter belyses och diskuteras. I detta avsnitt analyseras olika faktorer som kan ha påverkat projektets utfall.


  #frag1[
=== Mätningar på process
Resultatet från projektgruppens utvärdering av sprintarnas genomförande presenterades tidigare i @formulär-veckoresultat. //Alice 22/5 feedback:"Presenterades tidigare i Tabell 4"... 
//Stina: fixat
Sammanställningen av svaren visar inga stora variationer mellan sprintarna, utan samtliga påståenden har generellt fått relativt höga medelvärden. Eftersom samtliga värden ligger över mittpunkten på skalan (2.5 av 5), kan resultatet tolkas som övervägande positivt. Formuläret har främst varit värdefullt som underlag inför sprint retrospektiv, då det hjälpt projektgruppen att identifiera förbättringsområden. Ett konkret exempel är under den fjärde sprinten, där ett lägre resultat på frågan om kommunikation uppmärksammades. Detta låg till grund för en diskussion inom gruppen, vilket i sin tur möjliggjorde att orsaker identifierades och åtgärder kunde vidtas inför kommande sprint. Formuläret har därmed bidragit till att utveckla en effektiv arbetsprocess, vilket i sin tur har möjliggjort för projektgruppen att leverera värde till kunden. //Alice 22/5 feedback: Hur relaterar detta till er frågeställning, ta gärna upp det. 
//Stina: fixat!

Uppgifters placering på Kanban-brädet visualiseras i @sprintresultat. Med tanke på att målet är att färdigställa samtliga uppgifter under en sprint har projektgruppen presterat relativt dåligt i den aspekten. Detta resultat stämmer överens med projektgruppens uppfattning att det är mycket svårt att skapa tydliga uppgifter inför sprinten som förblir relevanta och innebär en rimlig arbetsbelastning. Det bästa resultatet uppnåddes under sprint fem, då 86% av uppgifterna slutfördes. Denna förbättring kan sannolikt förklaras av att sprinten var längre, vilket gav mer tid för genomförande av uppgifter, samt att uppgifterna var tydligt definierade då de kopplades till specifika krav. Detta understryker vikten av att kontinuerligt anpassa arbetssättet, vilket ökar projektgruppens effektivitet och möjliggör leverans av en bättre produkt som skapar ett högre värde för kunden. //Alice 22/5 feedback: Åter igen OCH HUR relaterar detta till att skapa värde för kunden. Jo att eftersom vi i sprint 5 kopplade uppgifter till kraven--o kraven är viktiga för kundvärde. Ja något sånt. För annars passar resultaten mer in på erfarenhetsnacket där vi pratar om scrum. Jag tycker inte det är fel att detta kan relateras till fråg1 men ser gärna att det tas upp här. Man kan också tillägga att om vi arbetar bättre (genom att anpassa vårt arbetsätt kontnuerligt) så skapar vi en bättre produkt. Skapar vi en bättre produkt blir kunden mer nöjd :3
//Stina: fixat!

=== Kvalitetstester
Vid både de interna och de externa användbarhetstesterna fick produkten en SUS-poäng som tydligt överskred den gräns som angavs i produktens kvalitetskrav, vilket även speglades i återkopplingen från testpersonerna. Ett genomsnittligt SUS-resultat på 68 poäng indikerar att produkten är godkänd ur ett användbarhetsperspektiv @ref:sus. Det positiva resultatet på de interna testerna innebar att implementeringsfasen kunde påbörjas utan att några omfattande ändringar i designen krävdes. Eftersom den nästan färdigutvecklade versionen av produkten TIDIG uppnådde ett SUS-resultat på cirka 79 poäng och återkopplingen från testerna var lätta att åtgärda, kunde projektgruppen i slutfasen fokusera på andra aspekter än användbarheten. Användbarhetstesterna resulterade i att buggar upptäcktes och gränssnittet förbättrades för att öka användarvänligheten. Detta var särskilt värdefullt för kunden eftersom de betonat vikten av ett användarvänligt system. // Feedback från Anton 20/5: Behövs siste meningen? Känns som vi tar upp det redan i samma stycke.
// Isabel 22/5: Behöver inte inkludera att vi enligt *tolkningen av SUS* tror att användare skulle rekommendera det. Ni kan också ta bort "vi" från stycket
//Alice 22/5 feedback: Relatera till fråg1. Hur kan tidig implementeras så att man skapar värde för kunden. -Att vi gjorde SUS mätningarn som har denna nivå gjorde så att vi kunde fixa buggar och ta in feedback och på så sätt förbättra produkten och på så sätt skapa värde för kunden... osv 
//Stina: fixat alla kommentarer ovan

Även prestandamätningarna visade konsekvent goda resultat, där LCP-värdena låg under den tröskel som sattes i kvalitetskraven. Detta är sannolikt ett resultat av att projektgruppen tidigt tog hänsyn till prestanda såsom att exempelvis utföra tyngre beräkningar i systemets backend. Ett undantag var dock den senaste mätningen, där orsaken till avvikelsen inte har kunnat fastställas. Det kan vara relaterat till den stora skillnaden mellan testar utförda automatiskt eller manuellt i webbläsare. Ingen orsak till skillnaden har identifierats.
// Isabel 22/5: Det hade varit intressant att ta upp varför de automatiska LCP mätningarna skiljer sig så mycket med en manuell mätning i webbläsaren (5.8 Kvalitetsmätningar)
//Stina: håller med men vet inte varför...


=== Programmeringsspråk och ramverk <progspråk-och-ramverk>
Ramverket Svelte användes för frontendutvecklingen. En avgörande faktor för valet var att kunden kommer att ta över systemet efter projektets avslut, vilket ställde krav på att kodbasen ska var lättförståelig och underhållbar. //Alice 22/5 feedback: Och det skapar värde för kunden eftersom...blabla
//Stina: fixat
Svelte bygger på webbtekniker som HTML, CSS och JavaScript, vilket minskar inlärningströskeln och gör det enklare för framtida utvecklare att sätta sig in i projektet, även utan tidigare erfarenhet av ramverket. Dessutom kräver Svelte minimalt med mallkod, vilket gjorde det möjligt för projektgruppen att snabbt komma igång med utvecklingen. En ytterligare fördel var att det är enkelt att integrera Svelte med externa JavaScript-bibliotek, vilket möjliggjorde användningen av tredjepartslösningar. 
Det öppnade upp för utnyttjandet av beprövade verktyg med långsiktigt underhåll och bred användning, vilket accelererade utvecklingen. Ramverket Svelte bidrog därmed till ett ökat kundvärde, då den lättförståeliga kodbasen gav projektgruppen mer tid att fokusera på produktutvecklingen. 



//=== Arbetsmetodik
//För att skapa värde för kunden utvecklades en effektiv arbetsmetodik. Under projektets gång justerades sprintens längd med målet att hitta den optimala längden. När sprintarna endast var en vecka långa upplevdes det som svårt att hinna med alla uppgifter, samtidigt som de processrelaterade aktiviteterna upptog mycket tid som istället hade kunnat spenderas på produktutveckling. Vid sprintar på två veckor eller mer blev det istället utmanande att formulera tydliga, relevanta uppgifter för hela sprinten och samtidigt hålla en rimlig arbetsbelastning.

//Detta resulterade i att nya uppgifter lades till under sprintens gång eller att projektmedlemmarna inte arbetade lika nära Kanban-brädet. Att lägga till nya uppgifter under sprinten var generellt sett inte optimalt, då det ledde till att alla projektmedlemmar inte var lika insatta i sprintuppgifterna. Däremot ansågs det bättre att lägga till uppgifter än att arbeta med något som inte fanns på Kanban-brädet eller vänta med att utföra uppgiften till nästa sprint. 

//En nackdel med Azure DevOps som upptäcktes under projektets gång var att det inte gick att tilldela flera personer samma uppgift. Detta ledde till att projektmedlemmarna fick en sämre överblick av vilka uppgifter de hade ansvar att utföra. Att vissa uppgifter dessutom lämnades utan en ansvarig person visade sig negativt med anledning av att dessa oftast inte genomfördes. Anledningen var att projektgruppens kommunikation ibland var bristfällig vilket ledde till oklarheter kring vilka uppgifter som var påbörjade. Ytterligare en anledning var att projektmedlemmarna ibland glömde att uppdatera Kanban-brädet, vilket gjorde det svårt att följa uppgifternas status under sprinten. För att lösa detta etablerades ytterligare rutiner om att påminna gruppmedlemmar om att uppdatera statusen på sina uppgifter.  


]

  
#frag2[
  === Processrelaterade erfarenheter // Här diskuterar vi Resultatet
  Erfarenheterna som beskrivs i @resultat:gemensamma_erfarenheter tar upp flera aspekter från projektarbetet. De processrelaterade erfarenheterna behandlar följande områden: Planering, kommunikation, Scrum och delning av kompetens. I detta avsnitt kommer lärdomarna från erfarenheterna jämföras med varandra. 
  

  ==== Planering 
  Det finns flera lärdomar om planering att nyttja från de erfarenheter som togs upp i @resultat:planering. En generell lärdom är att det är svårt att planera relativt långt i förväg. Därför ska man vara förberedd på att planen kan och troligtvis kommer att ändras. Vidare blir frågan hur man som grupp bör hantera när planeringen fallerar. Detta hanterades genom att planera om tidplanen och prioritera det viktigaste som skulle göras. Därefter hölls//Alice 22/5 feedback: Därefter höll några från gruppen möten för att...-För att få bort "för" -ISABEL FIXAT
  flera möten för att gå igenom milstolparnas och kravens status och informera om återstående uppgifter och deras slutdatum. 
  //SamuelT 22/5: "översikt till" låter konstigt. -ISABEL FIXAT
  
  Den andra gången fungerade den nya planen bättre än den tidigare. Detta kan delvis berott på att man inte längre behövde planera så långt fram i framtiden, men det kan även bero på en ny insikt gällande att omplanera: Det räcker inte bara med att uppdatera interna deadlines, utan man ska också se över vad som är kvar att göra i projektet, relaterat till projektets krav och milstolpar. 
  
  En annan lärdom som man kan tänka på i framtiden är vikten av en tidsbuffert, speciellt att ha en större tidsbuffert när man saknar erfarenhet av att planera större projekt. Denna lärdom kommer från erfarenheten då gruppen hade en vecka i tidsbuffert som visade sig inte vara tillräckligt. Konsekvensen var att slutdatumet för att färdigställa TIDIG flyttades fram från att ha legat i början på maj, till slutet av maj. Från detta kan ännu en lärdom dras gällande beroende av tredje part: Om framsteg i ett projekt baseras på en tredje part behöver gruppen vara förberedd på förseningar hos denne och därmed behöver tidplanen innehålla en tidsbuffert som kompenserar detta. 
  // Samuel T: Deadline kanske kan bytas ut mot slutdatum eller nåt. -ISABEL FIXAT

  
  ==== Delning av kompetens
  De workshoppar som genomfördes i syfte av kompetensdelning var lyckade i vissa aspekter, och misslyckades i andra. Dels gjorde de att projektmedlemmar snabbt kom igång med verktygen och kunde få ställa frågor till de som var mer kunniga, men i andra aspekter var det kunskap om irrelevanta verktyg som lärdes ut. Den kunskap som lärdes ut under backend-workshopen visade sig vara irrelevant för de flesta i utvecklingsteamet. 
  
  En möjlig anledning till varför, var att workshoppen hölls tidigt i arbetet då de tekniska verktygen ännu inte hade bestämts. Vidare var en central lärdom från denna workshop vikten av tydliga instruktioner och en avgränsad uppgiftsomfattning för att underlätta inlärning. Som tidigare nämnts i @resultat:kompetens tillämpades dessa insikter i workshoppen inom frontendutveckling och resulterade i en ökad kompetens som sedan underlättade implementationsarbetet av TIDIG. 
  Det kan även nämnas att den andra workshoppen i Svelte hade fördelen av att redan vara ett bestämt verktyg. En lärdom är alltså att det är fördelaktigt att avvakta med utbildning innan tekniska verktyg är etablerade för att på så sätt minska risken för tidsåtgång åt irrelevanta saker.

  // Axel 22/5: Kanske skriva typ "vilket vi upplevde under utvecklingen av projektet" efter källan för att koppla den till våra erfarenheter -Alice 23/3 åtgärdat
  Ytterligare ett sätt att dela kompetens inom projektgruppen var genom kodgranskning via pull requests i Azure DevOps. Enligt Bacchelli @ref:bacchelli2013code har kodgranskning visat sig vara ett bra verktyg för att öka kunskapsdelning inom ett mjukvaruprojekt. Detta stämmer överens med vad projektgruppen upplevt under utvecklingen av TIDIG. 

  ==== Kommunikation
  Under projektarbetet har det framkommit att god kommunikation i teamet har varit viktigt för att lyckas med projektarbetet och leverera en bra produkt. Missförstånd och dubbelarbete uppkom som ett resultat av bristande rutiner när det gällde att informera om vad man jobbar på. Så som redan tagits upp i @resultat:kommunikation resulterade distansarbetet och separata arbetsgrupper till minskad kontakt mellan projektmedlemmarna vilket kan ha bidragit till problemet. //Alice flyttar här ifrån **
  
  Resultatet på fråga 2 i @formulär-veckoresultat visar hur gruppen har upplevt kommunikationen under varje sprint. Kommunikationen har uppfattats som bristfällig, och trots att flera åtgärder har vidtagits för att stärka kommunikationen mellan medlemmarna, visar resultatet att dessa insatser endast haft begränsad effekt.
  De vidtagna åtgärderna har syftat till att etablera nya kommunikationskanaler och att prioritera möten mellan de separata arbetsgrupperna, i syfte att främja en gemensam förståelse för den pågående produktutvecklingen. Dessa åtgärder har konkretiserats i form av rutiner såsom att informera projektmedlemmar vid påbörjandet av ny funktionalitet samt att konsekvent använda Kanban-brädet för ökad transparens och samordning.
  //Alice flyttar hit*
  
  Enligt Ken Schwaber @ref:agile-microsoft, medskaparen av Scrum, är det vanligt att missförstånd och dubbelarbete uppstår i stora team som arbetar med Scrum. Enligt Schwaber innebär stora team 7 personer eller fler. Det innebär att det som teamet har upplevt som ett problem är vanligt och kan vara förväntat i stora projekt, och det finns åtgärder att tillämpa för att förhindra att det sker igen. I de fall som dubbelarbete uppstod kommunicerades problemet mellan medlemmarna och rutiner infördes för att minska risken att det sker igen. En lärdom som följer är alltså att rutiner gällande kommunikation bidrar till projektframgång. 

  // Axel 22/5: Kanske skriva "Att vi dessutom hade bristande kommunikation med kunden ..." eftersom vi inte skriver om kommunikation med kund tidigare i detta avsnitt -Alice 23/3 åtgärdat
  
  Gällande den bristande kommunikationen med kunden är en orsak till detta teamets ringa erfarenhet av att utveckla en produkt åt extern beställare. Detta projektarbete har givit lärdom angående hur man hanterar en extern kund. Lärdomar från detta har varit att försöka arbeta sig runt problemet med kundfrånvaro genom att fortsätta utveckling på de delar av systemet som inte kräver kundens svar och att söka alternativa sätt att kommunicera, vilket beskrivs i @resultat:kommunikation. Ytterligare en lärdom har varit att ta initiativ till uppföljande mejl om kunden inte återkopplar inom rimlig tid.

  
  //Alice flyttade detta till scrum delen
  //Gruppens erfarenhet av att tydliga, konkreta och mätbara uppgifter hade större sannolikhet att bli färdiga under sprinten stämmer väl överens med konceptet av SMART:a mål @ref:smart-goals. Uppgifter som inte har tydliga slut blir svåra att resonera kring. De riskerar också att, om än omedvetet, bli bortprioriterade till mer konkreta uppgifter. 

  //==== Beslutsfattande
  //Att genomföra ett mjukvarutekniskt projekt med nio projektmedlemmar var från början en utmaning eftersom majoriteten av gruppmedlemmarna saknade praktiska erfarenheter av att arbeta i stora team. Det är lätt att föreställa sig att arbetet går nio gånger snabbare om nio personer arbetar på det, men i verkligheten beror det väldigt mycket på hur arbetet organiseras. 
  
  //Orsaken till situationen i @resultat:beslutsfattande är att gruppen hade olika designförslag och inte kunde komma överens om vilken som var bäst. När ledaren tog beslutet om en specifik design resulterade det i att utvecklingsteamet kunde fokusera sina resurser på utveckling istället för diskussioner.
  //Denna erfarenhet understryker vikten av att ha någon som har huvudansvaret och därmed kan ta avgörande beslut för att driva arbetet framåt och förhindra onödiga förseningar. Det finns ett värde av att en ledare lyssnar på sina medarbetare. 

  

  //==== Git
  //Kommunikationen i gruppen var essentiell för att projektarbetet skulle fungera, och detta gällde även för Git. Det stora antalet grenar och många samtidiga _pull requests_, se @resultat:git, gjorde att gruppmedlemmarna behövde kommunicera och diskutera med varandra. _Pull requests_ var även ett sätt att informera granskare om hur funktionalitet har implementerats. Ytterligare en teknisk lärdom från Git och Azure DevOps var att det var smidigt med kodgranskning och automatisk kodtestning. 

  ==== Scrum: Kombination av andra arbetsmetoder
  // Kombinera Scrum-metod med vattenfallsmodellplanering
  Att ha en process som arbetsfokus och sedan kontinuerligt anpassa den till gruppen har varit en lärorik erfarenhet. Scrum är den arbetsprocess som låg i huvudfokus för gruppen och Kanban fanns till som ett extra tillägg, se @resultat:scrum. Trots detta följde gruppen inte en klassisk agil Scrum-metod med flera iterativa moment. Istället använde gruppen sig av sprintar som pågick under faser och hade en specialanpassad produktbacklogg som bestod av milstolparna. Orsaken till att fasplaneringen integrerades med Scrum var att flera dokument, däribland designdokumentet, skulle lämnas in tidigt i projektprocessen. 
  Därav hade gruppen svårt att till en början etablera ett iterativt arbetssätt då kursen krävde en design- och planeringsfas av studenterna redan i början på kursen. I det fortsatta arbetet hanterades detta genom att faserna innehöll sprintar, där arbetet bedrev iterativt inom respektive fasområde. Exempelvis reviderades och omarbetades koden successivt under implementationsfasen.
  En intressant lärdom kan därför vara att det är möjligt att kombinera den agila arbetsmetoden Scrum med linjär fasplanering i ett grupprojekt. 

  // Använda Kanban med Scrum
  Erfarenheten av att integrera Kanban i Scrum har varit en intressant erfarenhet för gruppen. Det finns många fördelar när Kanban används på rätt sätt, medan den för med sig nackdelar när det används på fel sätt. Exempelvis ger Kanban en god översikt över sprintuppgifterna och deras status. Detta gör det enkelt att se vem man ska höra av sig till vid frågor och funderingar. De negativa aspekterna som projektgruppen har upplevt med Kanban är osäkerhet, ofärdiga uppgifter och dubbelarbete. De gånger som projektmedlemmar inte hade tilldelats ansvar för uppgifter under en sprint, hade dessa uppgifter dessutom en lägre chans att bli avklarade under sprinten. Å andra sidan förekom det situationer där medlemmar åtagit sig uppgifter utan att uppdatera Kanban-brädets status utefter uppgifternas status. Detta kunde resultera i dubbelarbete och missförstånd kring huruvida uppgifter var slutförda eller inte, samt andra liknande problem. Lärdomen som följer är att ett Kanban-bräde endast fungerar effektivt om det underhålls kontinuerligt, vilket förutsätter ett aktivt deltagande från teamet och att varje uppgift tilldelas en ansvarig person. 

  // Formulera Sprintuppgifter SMART
  ==== Scrum: Formulering av uppgifter
  Sprintuppgifter var något som uppkom varje sprint retrospektiv och utvecklades för varje sprint.  //Stina 21:5: Flyttade detta från arbetsmetodik:
  Under sprintar som varade under två veckor eller mer upplevdes det som extra utmanande att formulera tydliga, relevanta uppgifter för hela sprinten och samtidigt hålla en rimlig arbetsbelastning. Gruppen fick erfarenhet av att tydliga, realistiska och mätbara uppgifter hade större sannolikhet att bli färdiga under sprinten. Denna lärdom stämmer väl överens med konceptet SMART:a mål @ref:SMART-goals, vilket handlar om att skapa mål som är specifika (S), mätbara (M), accepterade (A), realistiska (R) och tidssatta (T). Enligt Bahrami _et al_ @ref:SMART-goals har dessa typer av mål större chans att avklaras än andra. En intressant aspekt är att projektmedlemmarna i början av varje sprint uppfattade uppgifterna som tydliga i den mån att de kunde uppfattas som SMART:a. Men under sprintens genomförande framkom att flera uppgifter i praktiken saknade tillräcklig konkretisering och vissa var för tidskonsumerande i relation till sprintens längd. Denna erfarenhet tydliggör vikten av att gå igenom uppgifter och kritiskt granska och bedöma deras tydlighet, omfattning och genomförbarhet i relation till gruppens resurser och sprintens varaktighet. En annan sak som möjligtvis bidrog till att vissa sprintuppgifter inte blev avklarade var att de under fyra sprintar saknade tydlig koppling till milstolparna och kraven. 

  //Lärdom är allmänt erfarenhet att jobba med sprintar och att komma på relevanta sprintuppgifter. uppgiftersnack
  // kvaliteten på sprintplaneringen förbättras när teamet har rutiner för hur planeringen sker, Sprintplanering kräver kontinuitet och förberedelse. Vi kom med förberedda uppgifter innan möte och det är en lärdom att det är viktgit att det görs innan mötet för att effetktivisera teamets tid (så ine alla sitter där)
  //Uppgifter:
   //Diskussion: Detta kan berott på att uppgifterna inte hade starka band till krav eller milstolpar till en början. I början med design äre också "när är en design klar?"
  //Om uppgifterna är för diffusa blir det svårt att flytta runt dem mellan olika faser på Kanban-brädet och avgöra när de är slutförda. Även om det kräver mer tid att specificera uppgifter noggrant, lönar det sig i längden eftersom det bidrar till ett mer effektivt arbete när det väl påbörjas. 

  // Fler produktägare formulerar uppgifter bättre än en
  Under projektets gång ökade antalet sprintuppgifter markant, se @sprintresultat, vilket ledde till ett omfattande arbete för produktägaren. 
  //GAMMAL: Det stora antalet sprintuppgifter som skulle formuleras varje sprint, beskrivet i @sprintresultat,
  Detta kan ha bidragit till att uppgifterna uppfattades som stora och generella av projektgruppen. Detta resulterade i att projektgruppen hade svårt att slutföra uppgifterna och även att fördela dem till specifika personer. Därmed beslutades det att dela på produktägaransvaret mellan frontendutvecklingsledare, backendutvecklingsledare och dokumentansvarig. Detta resulterade i att uppgifterna som presenterades vid sprintplaneringsmötet blev mer specifika och hanterbara. Lärdomen från detta var att uppdelning av produktägare resulterade i detaljerade uppgifter som var fokuserade på respektive utvecklingsområde. Det innebar också att mindre arbetsbelastning per produktägare. 
  //Stina 21:5: Flyttade detta från arbetsmetodik
  En möjlig nackdel med fördelningen var att detta resulterade i att ingen enskild person i projektgruppen hade fullständig insikt i alla detaljer kring sprintens uppgifter. Detta ställde höga krav på projektgruppens kommunikation för att säkerställa ett samordnat arbete. 
  // Isabel 22/5: Går att lägga till denna mening från resultatdelen::
  //Detta [att man delade upp sig i frontend/backend vid sprintplaneringen] upplevde gruppmedlemmarna som något positivt eftersom uppgifterna blev tydligt formulerade, deadlinen för när uppgifterna skulle vara klara hade ett syfte och varje uppgift gick att koppla till minst ett krav. 

//Alice 22/5 feedback: Asså jag saknar i allmänhet tydliga utskrivna kopplingar till resultatet för SCRUM delarna
// Isabel TODO: hänvisa till Resultat-Erfarenheter-Scrum och Resultat-Scrum så det blir enklare för läsaren att hitta exakt varifrån infon finns
  
  ==== Scrum: Utveckling av en process
  // Iterativt förbättra Scrum
  Slutligen är det viktigt att lyfta den iterativa och processförbättrande delen av Scrum och projektgruppens arbetsprocess. Sprint retrospektiv-möten har varit fundamentalt för processförbättringar under projektets gång. De har hjälpt gruppen att inse vad som fungerat bra och vad som fungerat mindre bra under sprintarna. Detta har sedan lett till att gruppen kommit på förbättringsförslag som sedan applicerats på nästkommande sprint. Följaktligen är anpassning av Scrum-arbetsprocessen efter gruppens behov och önskningar viktigt för att stärka
  gruppens produktivitet och möjliggöra projektframgång.  //Vid boksnack: Agil projektledning Tomas Gustavsson, sid 156/157 
  
  Vidare kan liknande lärdomar dras gällande det generella arbetssättet som kandidatgruppen använde. Gruppen använde en modifierad stil av Scrum som involverade både Kanban-bräde och fasplanering och alla dessa modifierades under projektets gång. Detta ger då en viktig insikt vilket är att arbetsprocesser behöver anpassas till gruppen och de förutsättningar projektet har.  

  //"Anpassning av Scrum till gruppens behov är avgörande:  Projektgruppen använde en modifierad Scrum-process, vilket visar på en viktig insikt: ramverk behöver anpassas till teamets struktur och projektets förutsättningar. Exempelvis delades produktägaransvaret mellan flera personer, vilket tyder på ett praktiskt angreppssätt snarare än strikt rollfördelning."
  //Alice 22/5 feedback:
  

  === Tekniska erfarenheter
  Genom kunskapsdelningen av de mer erfarna fick resten av gruppen en större förståelse för de tekniska detaljerna.
  // SamuelT  22/5: Säkerställa två gånger i samma mening. -Alice 23/3 åtgärdat
  Gällande databasdesign och modellering finns några aspekter att ta upp. En lärdom som gruppen har fått är att en databasdesign och modellering av datatyper underlättar implementationsarbetet. Det underlättar planering och ger projektmedlemmarna en förståelse för vad de ska implementera. Det ska även tilläggas att design och modeller kontinuerligt bör följas upp och revideras under projektets gång. Detta möjliggör anpassning till förändrade behov under utvecklingen och bidrar till att de förblir ändamålsenliga verktyg i arbetet. Ytterligare en lärdom är att ändringar av datastrukturen under implementeringen av ett system bör kommuniceras. Syftet är att uppnå samförstånd mellan projektmedlemmarna samt att säkerställa att de nya ändringarna inte bryter mot designen.  //Alice 22/5 feedback:Lägga till att man behöver också FÖLJA upp designen för att den ska vara användbar -Alice 23/3 åtgärdat
  
  Det har också visat sig vara viktigt att arbetsgrupperna som arbetar med frontend och backend tidigt samordnar kring vilken data som förväntas överföras mellan servrarna. Syftet med detta är att skapa en modellstruktur för backend som sedan kan efterföljas under implementeringen utan att större ändringar behöver göras i ett senare skede. 
  // Lägg till diskussion om databasdesign här. T ex kring vilka val som gjordes, varför den behövdes göras om flera ggr (ifall det nämns i resultatet), var ni någon gång begränsade av att använda C#/ASPNET och tvingades arbeta kring det istället för ren SQL?

  //Stina skrivit 11/6
  Om projektet skulle genomföras igen skulle ett närmare samarbete mellan frontend- och backendgruppen, exempelvis genom parprogrammering, kunnat minska antal missförstånd och behovet av omarbetningar i backend-koden. Trots att detta skulle innebära en högre inlärningströskel för att sätta sig in i både backend och frontend, skulle det sannolikt leda till en effektivare utvecklingsprocess och färre tekniska hinder.
  
  // SamuelÅ skrivit 11/6, Alice ändrade om formulering 14/6
 Det finns många fördelar fördelar kring frontendramverket Svelte som tas upp under @progspråk-och-ramverk, men branchstandard är React. Av denna anledning är det möjligt att frontend hade varit skriven i React om projektet gjordes på nytt.
]

#frag3[
=== Systemanatomins upplevda värde <systemanatomi:värde>
// Anton korrigering 23/5: Den del som handlar om alternativa arbetssätt är flyttad till 6.2.7. I denna del diskuteras enbart resultatet på enkäten. 
Enkäten om systemanatomins värde, vars resultat redovisas i //Alice 22/5 feedback:redovisades? 
// Anton kommentar 23/5: Det ska stå redovisas då det presenteras i den här rapporten. Dåtid tyder på att det var något som utfördes under projektet men nutid antyder att det är något som presenterats tidigare i samma rapport. 
@resultatsystemanatomi, visade att frågorna hade medelvärden mellan 1 och 2.7 med måttlig till låg //Alice 22/5 feedback: tror ni sa bara låg i resultatet?
// Anton kommentar 23/5: Resultatet var lågt men i detta fall handlar det om standardavvikelsen och där har vi skrivit "medel till låg" i resultatet.
standardavvikelse. Det indikerar att majoriteten av projektmedlemmarna ansåg att systemanatomin inte var ett stöd under projektets genomförande. //Alice 22/5 feedback: "Detta berodde troligtvis på..."

Svaren om faktisk användning särskiljer sig då samtliga medlemmar svarade att de inte använde systemanatomin regelbundet. //, med ett medelvärde på 1 och standardavvikelse 0.//Isabel 23/5: tog bort slutet då vi förklarar resultatet
//Alice 22/5 feedback: Ni sa 1 förut, kolla texten o se så att ni ine blandar mellan 1 och ett osv.
Samtidigt indikerade svaren på fråga 1, som hade ett medelvärde på 2.7, att systemanatomin underlättade den övergripande förståelse av systemet. Den höga standardavvikelsen, som låg på 1.2, är en indikation på att det fanns delade åsikter om det stöd systemanatomin var för gruppen men utesluter inte möjligheten att den hade potential att vara tillämpbar vilket kan tyda på att den inte nyttjades korrekt. 

// Isabel 23/5: Vad innebär "detta"? upplevda värdet av systemanatomin? de dåliga resultaten i tabell 3? eller bara att det fanns delade åsikter om systemanatomin var ett stöd (dvs hänvisar till meningen före denna)? // Anton korrigerade detta 23/5
Den dåliga uppföljningen av systemanatomin kan ha berott på att det initialt inte fanns alternativ till att använda en systemanatomi, då det var ett obligatoriskt moment under ett tidigt skede i kursen. Det kan ha medfört att arbetet med systemanatomin inte vidareutvecklades efter inlämning då det inte fanns krav på fortsatt uppföljning av den. Taxén och Olow menade att systemanatomin fungerar som en lämplig modell främst i början av projektet, vilket överensstämde med resultaten från enkäten @ref:systemanatomy_liu.
//Alice 22/5 feedback:"I stället" låter lite konstigt här... // Anton korrigerade detta 23/5

Systemanatomin låg till grund för flera designbeslut i slutet på planeringsfasen. Figma användes för att planera och illustrera användarflödet för klienten, vars design togs fram med hjälp av systemanatomin som definierat webbapplikationens vyer. EER-diagram och API-ändpunktsdiagram användes för att strukturera databasens entiteter, relationer, attribut och hierarkier samt för att specificera vilka typer av indata som resulterade i en viss utdata från API:n. Även dessa verktyg utgick ifrån systemanatomin när den ursprungliga designen skapades. // Isabel 23/5: Detta stycke tycker jag passar bra i 6.1.7 då det är kopplat till hur vi faktiskt använt den (alltså resultatet). Annars grundar sig 6.1.7 enbart på enkäten och går inte djupare in på vad som faktiskt har funkat bra med den i planeringsfasen. // Anton korrigerade detta 23/5
]

#frag4[
  === Uppdelningen frontend-backend

  Som nämndes i @resultat:uppdelning gjorde uppdelningen i två arbetsgrupper det möjligt att jobba parallellt och fokuserat på sitt område. Här diskuteras några upplevda för- och nackdelar med uppdelningen, samt möjliga orsaker till dessa.

  Inledningsvis var den inlärning av programmeringsspråk och verktyg som krävdes för en enskild gruppmedlem lägre, vilket bidrog till att skynda på implementeringsfasens uppstart.
  Men även under arbetets gång fanns det fördelar med att ha gjort en tydlig gruppuppdelning.
  Eftersom inte alla nio medlemmar arbetade med både frontend och backend, var det färre personer som arbetade i samma kodbas, vilket troligen minskade risken för Git-konflikter vid sammanslagning av olika versioner av samma fil.
 
  En nackdel med uppdelningen var dock den låga förståelsen för funktionaliteten och de implementationer som andra utvecklingsgruppen hade skapat. De som inte arbetade med frontend-koden hade svårare att förstå och hantera felmeddelanden vid testning av fullstack-implementeringar. Samtidigt upplevde de som enbart arbetade med frontend ofta problem med att få backend att fungera, särskilt när databasfilen inte var uppdaterad eller när gamla eller felaktiga migrationsfiler användes. Ett sätt att minska problematiken med att inte förstå varandras kod hade varit att säkerställa nära och kontinuerlig kommunikation mellan frontend- och backend-grupperna.
  
  Långsiktigt innebar den tydliga uppdelningen att vissa projektmedlemmar bara fick erfarenhet inom ena sidan av projektet. Beroende på framtida karriär och intressen kan detta ha påverkat projektmedlemmarna negativt. Exempelvis genom att man inte fick någon erfarenhet av frontendutveckling under sin studietid men hade behövt det senare i karriären.
  
  Ett alternativt arbetssätt hade kunnat vara att till en början dela upp gruppen i frontend och backend men senare dela in på olika funktioner i systemet istället. Det hade gjort att kunskapsdelningen hade kunnat öka och att alla hade fått en bättre förståelse för hela systemet.

 Tidredovisningssystemet TIDIG var en relativt liten och okomplicerad webbapplikation. Att dela arkitekturen i en frontend- respektive backend-server kan därför ha fört med sig mer krångel än nytta. Arkitekturens kvalitet påverkas av dess modifierbarhet, alltså hur komplicerat det är att förändra systemet, och dess pålitlighet, som mäts genom hur många procent av en viss tidsperiod som systemet är i drift @ref:software-architecture. 

 En uppdelad arkitektur kan göra det svårare för underhållaren av systemet att utföra en ändring eftersom det kan vara oklart var i systemet ändringen ska ske. Samma princip gäller när ett problem uppstår. Att systemet är uppdelat i frontend- och backend-servrar kan därför öka tidskostnaden för ändringar och förlänga tiden servern ligger nere vid problem. Fördelen med att ha systemet uppdelat är framförallt att det blir mer skalbart. Exempelvis hade en extra frontend-server kunnat sättas i drift och ta emot anrop utan att en extra backend-server nödvändigtvis behövts, men med tanke på systemets förväntade mängd användare kommer ingen skalning förmodligen behöva ske.  
 Därför skulle en enda server kunna vara ett bättre alternativ för ett liknande projekt.

  Ett exempel på problematik som hade kunnat uppstå i ett alternativt implementationssätt,
  med en öppen backend-server är att en illvillig användare skulle kunna komma åt data som det inte är tänkt att de ska ha tillgång till. Detta hade användaren förhållandevis enkelt kunnat göra med _endpoint discovery_. Endpoint discovery är att kartlägga ändpunkterna på ett API genom att exempelvis skicka ett stort antal förfrågningar med gissningar på ändpunkter @ref:web-application-security.


Vidare bidrog uppdelningen mellan frontend och backend till en tydligare struktur i projektet, särskilt vad gäller ansvarsfördelning och var i systemet olika delar av logiken skulle implementeras. //Alice 22/5 feedback: ..."Och att ha tydlig arbetsfördelning var troligtvis viktigt i vårt projekt eftersom vi hade en stor grupp på 9 pers" -Lägga till nåt sådant i texten kan vara nice ;)
Om all utveckling hade skett inom Svelte hade det varit svårare att särskilja vad som exempelvis hörde till databasen. Den tydliga avgränsningen mellan gränssnitt och serverlogik gjorde det enklare att samarbeta över gruppgränser och minskade risken för otydlig kod. Detta stöds av slutsatserna i en studie som utvärderade samspelet mellan en uppdelad frontend och backend, där Drupal
 användes för backend och ReactJS för frontend @ref:lundqvist2023drupal. Studien visar att dessa tekniker kompletterade varandra väl, där Drupal stod för datalagring och auktorisering medan ReactJS erbjöd ett användargränssnitt. Även om slutsatserna inte generaliseras till alla projekt, visar studien att en tydlig separation mellan frontend och backend kan vara fördelaktig för både utvecklingsflöde när kommunikationen mellan dem  fungerar väl.
 
]




  
== Metod
I avsnittet diskuteras de metoder som definierades i @metod.
Fokus ligger på att granska metodernas styrkor och svagheter samt vilka risker som kan ha påverkat resultatet.
Vid skrivandet av rapporten har källor valts ut noggrant, vilket beskrivs även beskrivs i detta avsnitt.

#frag1[
  === Kundkontakt
  Kontinuerlig kontakt med kunden samt användning av en kravspecifikation har varit viktigt för att säkerställa att produkten skapar värde för kunden. Genom regelbundna möten och avstämningar kunde fel och missförstånd upptäckas tidigt och åtgärdas. En risk med denna metod är att kravspecifikationen främst speglar kundens uttryckta behov och inte nödvändigtvis de faktiska behoven som finns hos slutanvändarna. Eftersom kunden önskade ett system med samma funktionalitet som det befintliga, men med förbättrad användarvänlighet, hade det varit värdefullt att få tillgång till det nuvarande systemet för att skapa en tydlig förståelse för dess funktion. Då detta inte var möjligt har det stundtals varit en utmaning för projektgruppen att få en klar bild av hur det nuvarande systemet faktiskt fungerar. Ytterligare en utmaning har varit att kunden har varit mycket upptagen och svår att nå vilket resulterat i att projektgruppen behövt anpassa implementationen av produkten utefter detta.//Alice 22/5 feedback: Hade gärna sett att det nämns nånting om att vi faktiskt ibland inte fick kontakt med dem (vi tar upp det i erfarenhets deln att vi behövde jobba oss runt förseningar frånd eras håll.)
  //Stina: fixat

  === Användarundersökningar
  Användarundersökningar och SUS-mätningar har använts för att mäta användarvänlighet och säkerställa att TIDIG är lätt att använda. Metoderna bidrar till att skapa värde genom att fånga upp användarnas faktiska upplevelser. En utmaning är dock att svar från användare kan vara subjektiva och är inte alltid representativa för alla användare. En begränsning i projektet är att användarundersökningarna inte genomfördes av produktens slutanvändare. //Alice 22/5 feedback: Här kanske man kan nämna att vi hade interna testare första gången som kan ha orsakat ett högre betyg för vi vet ju redan lite hur systemet används. Samma med att ha externa användare, de kanske tyckte systemet var sämre för att de inte förstod vad det innebar att vara admin. (Ni tar upp detta lite nedan, men kanske lägga till det här eller lägga till det jag sa där nere)
  //Stina:fixat
  Utvecklingen av produkten skedde i stort sett utan kontinuerlig återkoppling från slutanvändarna. Detta var ett medvetet val med tanke på att det är tidskrävande att kontinuerligt demonstrera produkten för kunden och anpassa den baserat på feedback. Samtidigt hade ett närmare arbete med slutanvändarna kunnat ge djupare insikter i deras behov och därmed skapa större värde för kunden.//Alice 22/5 feedback: Bra!

  Ett högre SUS-poäng på användartesterna under den andra sprinten kan sannolikt förklaras av att projektgruppen redan visste hur produkten fungerade. Det lägre resultatet under den femte sprinten kan förklaras av att testpersonerna inte var insatta i projektspecifika termer och förstod exempelvis inte vad det innebar att vara en administratör. De interna användarundersökningar som genomfördes före utvecklingsfasen fyllde syftet att tidigt identifiera problem och oklarheter i designen. Valet att utföra testerna internt i projektgruppen effektiviserade processen.//Alice 22/5 feedback: "endast" stämmer väll inte?
  //Stina:fixat!
  Å andra sidan hade ett bredare perspektiv kunnat uppnås genom att inkludera externa testpersoner med exempelvis större åldersvariation. Samtidigt innebar de interna testerna fördelar såsom att samtliga projektmedlemmar, både från frontend- och backendteamet, blev delaktiga i applikationens utformning och design. 

  === Design av applikationen
  Kunden uttryckte ingen önskan om produkten skulle vara mobilanpassad. Samtidigt omfattar tillgänglighetskrav anpassning för olika skärmstorlekar, och kunden önskade att produkten skulle vara enkel att använda. Det är fortfarande oklart hur mycket värde mobilvyn skapar för kunden eftersom det först kan utvärderas efter en tids användning av produkten. Däremot är det klart att mobilanpassningen inte har någon negativ påverkan på produktens värde och användarvänlighet.

=== Scrum och samarbete med kunden
//Alice 22/5 feedback: Detta verkar mer handla om kundkontakt. Kanske byta rubrik till; Scrum och sammarbete med kunden. Idk det är nice att prata om scrum. Men "scrum som process" kanske annars är mer erfarenhets-relaterat?
// Stina: fixat!
//Stina: Detta relaterar även till alternativa implementationssätt
 I en klassisk version av Scrum fokuserar man generellt på att leverera en fungerande produkt i slutet av varje sprint, och det är vanligt att hålla regelbundna demonstrationer för kunden @ref:essentials_of_software_engineering. Projektgruppen har inte helt utgått från detta i sin arbetsprocess. Projektgruppen har däremot arbetat för att alltid ha fungerande kod på main-branchen, men det har inte alltid genomförts tester för att säkerställa dess funktionalitet. Fördelen med att leverera en fungerande produkt i slutet av varje sprint hade varit möjligheten att genomföra fler användbarhetstester på produkten och ge kunden möjlighet att delta i en demonstration. Att involvera kunden mer i form av regelbundna demonstrationer hade varit värdefullt med tanke på att produktens största fokus låg i dess användbarhet. Dessutom hade kontinuerlig feedback från kunden kunnat ge ökat värde, då de hade blivit mer involverade i riktningen av produkten. Samtidigt innebär detta en risk för förseningar, med tanke på att kunden periodvis har varit svår att få kontakt med. Sådana förseningar skulle i sin tur kunna påverka produktens kvalitet, med tanke på den begränsade tidsbudgeten. //SamuelT 5/5: Lite samma problem men den här meningen som jag skrev ovan. Tycker dessutom att vi ska vara försiktigare med att kritisera kunden i den här publicerade rapporten.
 // Stina 6/5: Har formulerat om meningen och försökt uttrycka mig snällare :)

I en studie som genomfördes i syfte att undersöka kundens påverkan på mjukvaruutvecklingsprocessen observerades flera verkliga mjukvaruprojekt @customer_relation. Resultaten visade att ett aktivt kunddeltagande har en positiv inverkan på projektets kvalitet. Samtidigt överskred samtliga observerade projekt sin budget eller tidplan, delvis på grund av att kunden vid flera tillfällen hade otillräckliga resurser, vilket skapade flaskhalsar och ledde till att viktig kommunikation uteblev. Baserat på denna studie är det oklart om den alternativa metoden skulle ha skapat ett ökat kundvärde, eftersom detta förutsätter att kunden har tillräckliga resurser för att delta aktivt. Utan sådana resurser finns en risk att utvecklingsarbetet försenas.
  
]
#frag2[
  === Erfarenhetsinsamling // Isabel, hette tidigare: "Metod för att fånga erfarenheter"
  // "Vilka konsekvenser fick de valda metoderna för resultatet"

  Användningen av Scrum har upplevts som ett effektivt sätt att ständigt förbättra arbetsprocesser. Efter retrospektiven har projektgruppen kunnat identifiera vad som fungerade bra och vad som behövde förbättras, genom den processdokumentation som utförts. 

  Utvärderingar i slutet av sprints har använts för att samla erfarenheter av Scrum. Detta har gett en överblick över projektgruppens upplevelser och identifierat förbättringsområden. Dock finns risken att en utvärdering kan bli för ytlig och inte ge tillräckligt med insikter för att göra meningsfulla förändringar. 

  Att använda en erfarenhetsrapport i slutet av projektet har varit en bra metod för att sammanfatta och dokumentera lärdomar. Detta har bidragit till att skapa en gemensam kunskapsbas för framtida projekt. En risk med att skriva rapporten i slutet av projektet var att kunskap kunde förloras om den inte dokumenteras kontinuerligt under projektets gång. En potentiell idé för att motverka detta är att varje gruppmedlem medvetet dokumenterar sina erfarenheter under projektets gång. 
]

#frag3[
  === Skapande av systemanatomi

  //Alice feedback 3/5: 6.2 ska prata om vilka konsekvenser våra metoder fick för resultatet. Ska också ta upp alternativ... Fattar att 6.1 och 6.2 kan bli svårt att skilja på. Men tror ni kan utveckla diskutionen till vad vi gjorde istället. Alternativ metod vi använt är väll blockdiagram, andra design saker (databasdesign har realtionsdiagram). 
  
  Processen för att utveckla systemanatomin, där flera versioner togs fram av olika arbetsgrupper, bidrog till att fånga upp olika perspektiv och förbättra kvaliteten. En risk med denna metod kan dock ha varit att designbeslut som hela gruppen kunde ha diskuterat missades, vilket kan ha lett till att vissa delar av designen blev mindre optimal.
  Möjligen skulle designen blivit mer komplett om varje gruppmedlem var tvungen att uppvisa en förståelse för alla designbeslut, hur små de än kan ha varit.

  Feedback från handledare och examinator har spelat en stor roll för att säkerställa att systemanatomins struktur och innehåll var tydliga och relevanta. Det har gjort det enklare att upptäcka problem tidigt i processen och åtgärda dem.
  //Alice 22/5 feedback: Här kan man ta upp alternativa metoder (typ figma etc. Se pp "Kandidatarbete2025" man ska prata om alternativa metoder, känns perfekt här!)
  // Anton kommentar 23/5: Detta nämns i 6.1.7 och jag tror nog att det blir lite för repitativt om vi ska ta upp det igen, eller har jag fel?

  === Uppföljning av systemanatomi <disk:systemanatomi>
  // Anton korrigering 23/5: Jag flyttade hit alternativa arbetssätt från 6.1.7 och formulerade om det helt. Första och tredje stycket  är helt nytt med inspiration från det som stod under den andra rubriken tidigare. Den feedback som var lämnad tidigare finns kvar under den andra rubriken men det fanns inte så mycket som gällde just den del som flyttades hit. 
  
  
  // Isabel 23/5: Om du flyttar den kan du ändå lägga till någon mening här som tar upp att "Systemanatomin låg till grund för flera designbeslut i slutet på planeringsfasen", och sen gå in direkt på att den inte byggdes vidare på.. // Anton korrigerade detta 23/5
  
  Systemanatomin låg till grund för flera designbeslut i slutet på planeringsfasen. Dessa beslut introducerade andra designverktyg, som diskuteras i @systemanatomi:värde. Vidare byggdes det varken vidare på systemanatomin samt att den inte användes som referens under implementationsfasen. Detta kan ha lett till att arbetet blev mer oorganiserat och sämre kommunikation mellan medlemmar. Erik Schumann @ref:the-system-anatomy[s. 107-114] menar att medlemmar i team som använder systemanatomi har större möjlighet att jobba självständigt eftersom varje medlem har en tydligare bild av vad som behövs göras. Projektmedlemmarna kunde jobba mycket självständig men eftersom systemanatomin inte följdes upp, eller var i fokus i arbetsprocessen, är det svårt att påvisa att systemanatomin bidrog till det.
  //Alice 22/5 feedback:"Peka på" känns lite informellt. 
  // Anton korrigerade detta 23/5

  En anledning till att projektmedlemmarna kunde jobba självständigt kan ha varit att de nya designverktygen valdes som ett alternativt arbetssätt, då de fortsatt följdes upp och uppdaterades vid ändringar i planeringen. // Isabel 23/5: Vad betyder "fortsatt blev uppdaterade"? Är det att de uppföljdes eller var smidigare att använda? // Anton korrigerade detta 23/5
  De upplevdes mer djupgående och gav ett bättre stöd för projektgruppen under utvecklingen. Projektmedlemmarna kunde få en bättre uppfattning av hur projektet var strukturerat och även få en övergripande uppfattning över hur kommunikationen mellan de olika anatomerna skulle ske, inte bara om vilka anatomerna som skulle kommunicera med varandra.
  
]

=== Källkritik 
Källorna i rapporten har noggrant valts ut för att säkerställa en hög kvalitet och relevans. Vetenskapliga artiklar har använts i stor utsträckning för att stödja påståenden och argument, men eftersom projektet använder en stor mängd olika verktyg och teknologier som inte alltid har vetenskapliga artiklar kopplade till sig, har även icke-vetenskapliga källor använts. I sådana fall har källor närmast verktyget eller teknologin valts, som referensdokumentationer eller manualer skrivna av projektmedlemmarna själva. Dessa källor har granskats kritiskt för att säkerställa att de är pålitliga och relevanta för projektet.


== Arbetet i vidare sammanhang

Projektet har flera viktiga samhälleliga och etiska aspekter. Under @resultat:susaf presenterades gruppens bedömning över systemets hållbarhet. I detta avsnitt utreds mer noggrant vad TIDIG har för påverkan på världen i flera aspekter.


=== Etiska aspekter 

Fysiska sätt att mäta arbetstimmar, exempelvis med stämpelklockor, säkerställer att anställda faktiskt är på arbetsplatsen när de uppger ha varit det. Eftersom TIDIG är en webbapplikation, kan tid redovisas varifrån som helst. På detta vis är en potentiell negativ etisk aspekt med systemet att det möjliggör för oärliga anställda att redovisa mer tid än de faktiskt har arbetat. Å andra sidan kan anställda känna att företaget inte litar på dem om ett mer övervakande system används. I denna mening är det en positiv etisk aspekt att TIDIG ger mycket frihet åt tidredovisare.

En annan viktig samhällelig aspekt är tillgänglighetskraven EN 301 549 @ref:EN301549 och WCAG 2.1 @ref:W3C2024. Genom att säkerställa att TIDIG uppfyller dessa krav bidrar projektet till ökad digital inkludering och jämlikhet på arbetsplatsen. Som en del av LiU:s digitala infrastruktur är det viktigt att TIDIG är tillgängligt för alla användare, oavsett deras tekniska kunskaper eller funktionsvariationer.

=== Strukturella aspekter 
I och med att TIDIG driftsätts på en server på Linköpings universitet behålls kontrollen av den lagrade datan. Det kan i allmänhet vara fördelaktigt att göra sig så oberoende av externa faktorer som möjligt. Molnplattformer bygger ofta på virtualisering av flera servrar på samma fysiska maskin, vilket öppnar för dataläckor mellan olika tjänster @ref:cloud-security. Av den anledningen är en lokal driftsättning av systemet troligtvis det säkraste alternativet ur DIGIT:s perspektiv.
// Isabel 22/5: Eric skrev att vi måste ha någon källa som styrker det vi säger. -FIXAT

=== Individuella aspekter
Systemet TIDIG har aspekter som skapar möjligheter för individen som rapporterar sin arbetstid. En sådan kan exempelvis vara att arbetsbelastningen minskar med ett enklare rapporteringssystem. Den snabba inloggningen och att det är få knapptryck som krävs för att rapportera tid, gör att redovisning av tid kräver mindre tid. En annan aspekt som framför allt påverkar nya användare är att med det här nya systemet är inlärningskurvan som krävs för att förstå TIDIG och använda det, förhållandevis låg jämfört med föregångaren. Arbetsbelastningen för administratören har potential att bli mycket mindre med det här systemet. Att få alla tidsrapporter i ett modernt system som sammanställer informationen automatiskt, kan göra att administratören slipper göra en stor mängd onödigt arbete. 

=== Sociala aspekter

Ett bra system för tidredovisning kan ge effekten att tilliten mellan både tidredovisare och administratörer ökar. Ett system som är tillräckligt användarvänligt för att man ska vilja använda det kan föra med sig effekten att man som användare blir noggrannare med rapporteringen. Att användare är noggrannare kan förbättra Digitaliseringsavdelningens anseende på lång sikt. 


=== Tekniska aspekter

TIDIG autentiserar användare genom LiU:s Microsoft SSO. Detta är positivt dels för att användare slipper skapa fler konton, och dels för att Microsoft SSO är ett beprövat och säkert system. TIDIG är inte byggt med oändlig skalning i åtanke, och har inte heller testats i större storleksordningar än 100 samtidigt aktiva användare. I denna aspekt är TIDIG dåligt förberedd på plötslig uppskalning.

=== Ekonomiska aspekter 

I och med att TIDIG har hög användarvänlighet, möjliggör det för kunden att spara arbetstimmar för att det krävs mindre administration med ett smidigt och intuitivt system. Ytterligare en positiv ekonomisk effekt som TIDIG användbarhet möjliggör är att det är svårt att råka rapportera fel. Den sista positiva ekonomiska effekt som TIDIG kan ha för kunden är att det möjliggör bättre översikt över fördelning av arbetad tid, vilket möjliggör utvärdering och effektivisering.

=== Miljömässiga aspekter  
TIDIG har konstruerats för att vara plattformsoberoende och kan därmed driftsättas både på lokala och externa servrar. 
Eftersom kunden väljer att driftsätta TIDIG lokalt undviks användningen av stora utländska datorhallar, som annars kan ha negativa konsekvenser för miljön. Stora datacenter drar mycket elektricitet och kräver stor volym vatten @ref:Siddik_2021. Om TIDIG driftsätts lokalt, undviks dessa negativa konsekvenser för miljön, och blir därmed ett miljömedvetet alternativ.

= Slutsatser

#frag1[
  == Hur kan tidredovisningssystemet TIDIG implementeras så att man skapar värde för kunden? // SamuelT 5/5: Tycker det finns några meningar som inte tillför så mycket som vi kan ta bort. Exempelvis i stycket 3: "Det innebar bland annat att användare....."
  // Stina 6/5: har förkortat ned slutsatsen, ursprungliga versionen finns längre ned

  
  För att skapa värde för kunden analyserades behoven genom kravframkallande möten, användarformulär och en kravspecifikation. För att möta kundens behov utvecklades produkten med fokus på användbarhet, anpassades för olika skärmstorlekar och användbarhetstestades. Ramverket Svelte användes för att effektivisera utvecklingen och frigöra tid till att fokusera på användarupplevelsen.

  Ett strukturerat arbetssätt med välskriven dokumentation  och visualisering av arbetsflödet med Kanban möjliggjorde ett effektivt arbete inom projektgruppen. I kombination med en kontinuerlig anpassning av arbetsmetoden Scrum frigjordes mer tid för produktutveckling och ökade därmed värdet för kunden. Mätningar av LCP, kodtäckning och användbarhet har skapat kundvärde genom att säkerställa att produkten håller hög kvalitet. //Alice 22/5 feedback: Nämna Scrum? SUS-tester? Kvalitetsmätningar LCP? Spec Scrum iaf. 
  //Stina: fixat

  Slutligen, genom effektiva arbetsprocesser, bra samarbete, god uppfattning av kundens behov och bra val av ramverk kan TIDIG implementeras i enlighet med kundens vision och därmed skapa en värdefull produkt.
  //Alice 22/5 feedback: "God kommunikation" har redan nämnts precis ovan. Annan formulering?
  //Stina: fixat
  // Stina 6/5: Kortade ner slutsatsen, detta stod här tidigare: 
  //För att skapa värde för kunden, analyserades kundens behov tillsammans med kunden i kravframkallande möten, utskick av formulär till slutanvändaren och till sist framställning och godkännande från kund av en kravspecifikation.
  //Eftersom kunden önskade en produkt som är enkel att använda och utan onödiga begränsningar anpassade projektgruppen produkten med fokus på användbarheten för att skapa värde för kunden.  För att göra produkten ännu mer tillgänglig anpassades den också till olika skärmstorlekar. Dessutom utfördes användbarhetstester för att upptäcka eventuella oklarheter med designen av produkten.
  
  //Valet av ramverket Svelte för frontendutvecklingen var en viktig faktor för att skapa värde för kunden. Svelte gjorde det enklare // Samuel T 5/5: enklare än vad?
  //för gruppen att utveckla en effektiv och underhållbar lösning genom att bygga på vanliga webbtekniker som HTML, CSS och JavaScript. Det frigjorde tid för att fokusera på användarupplevelsen och funktionaliteten, vilket resulterade i ett mer användarvänligt system som bättre mötte kundens behov.

  // Axel 5/5: Finns en del nutid som "Resultatet blir"
  //Genom att arbeta strukturerat och utgå från dokumentation såsom projektplan och kravspecifikation kunde värde skapas för kunden då det möjliggjorde ett effektivt arbete. God kommunikation, i form av dagliga möten, regelbundna utvärderingar och planeringsmöten, samt visualisering av arbetsflödet på Kanban-brädet minskade risken för missförstånd och förhindrade projektmedlemmar från att fastna utan att komma vidare. Resultatet blir att mer tid kan läggas på produktutveckling istället för onödigt arbete, vilket i sin tur ledde till att mer värde kunde skapas för kunden. 

  //Slutligen, genom att arbeta strukturerat, ha god kommunikation, bra uppfattning av kundens behov och en utförlig planering kan tidsredovisningssystemet implementeras i enlighet med kundens vision och därmed skapa en värdefull produkt. Detta säkerställer att // Axel 5/5: Säkerställer att?
]

#frag2[
  == Vilka erfarenheter kan dokumenteras från TIDIG som kan vara intressanta för framtida projekt?
  // OBS: HA KVAR KOMMENTARERNA UNDER /Isabel
  // Ta upp de absolut viktigaste för framtida projekt
  //Stina 3/5: Bör kanske skriva ut den exakta lärdomen här: "Lärdomar om att etablera rutiner ...". Förstår inte riktigt vilken lärdom ni syftar på? Eller om ni menar att det är viktigt att etablera rutiner bör det kanske formuleras om till nåt i stil med: "vikten av att etablera rutiner ...".
  //De viktigaste lärdomarna och erfarenheterna som är intressanta för framtida projekt är följande:
  //- Lärdomarna om att etablera rutiner och möjligheter att förbättra kommunikationen i gruppen är en överförbar erfarenhet som andra i framtiden kan lära sig från. (Kommunikation)
  //- Inom utbildning underlättar tydliga instruktioner och en avgränsad uppgiftsomfattning inlärningen. 
  // Delning av kompetens inom gruppen är värdefullt för gruppens utveckling och sammanhållning. 
  //- Det finns många lärdomar att hämta från erfarenheten av att *planera ett projekt*. Den viktigaste är att planera för att saker kommer gå fel. Man ska alltså planera in rikligt med buffertid, speciellt vid långtidplanering, när planeringserfarenhet är bristande, och när projektet är beroende av en tredje part. Det är också viktigt att ta initiativ när omplanering krävs och att då planera utefter vad som är kvar från projektets milstolpar. //Lärdom: Planering blir aldrig som man tänkt sig, oförutsebara händelser (försening från kund) gör att man måste kunna anpassa arbete och process och planering. --Man måste planera för att saker ska gå fel, man måste planera för förseningar. COh man måste planera med vetskap om att allt planeringsarbete kan behöva göras om och att det i så fall är en bra sak att man tar atg i det. 
  //- De viktigaste lärdomarna att ta med sig till framtida projekt gällande* arbetsprocesser och Scrum* är bland annat vikten att skapa tydliga sprintuppgifter som helst bör baseras på hur man skriver SMART:a mål, samt att dessa uppgifter bör ha koppling till milstolpar och krav. Vidare ska man också ta med sig att en standardiserad arbetsprocess applicerad på en projektgrupp, sällan fungerar optimalt. Men, genom att kontinuerligt försöka anpassa processen för gruppens uppnås ett förbättrat samarbete, stärkt gruppdynamik och ett bättre projektresultat. 
  //- En viktig teknisk lärdom är att modellering av datatyper och databasdesign underlättar implementationen, men att det också är viktigt att dessa har frontend-implementationen i åtanke vid deras framtagande.  

  Erfarenheterna under projektet har resulterat i flera lärdomar som kan vara intressanta för framtida projekt. 
  Att etablera rutiner som främjar kommunikationen under ett projekt är viktigt för att stödja gruppens samarbete. Det är också viktigt att arbeta runt problem och hitta alternativa kommunikationsvägar vid kundfrånvaro. Vidare underlättar tydliga instruktioner inlärning. Projektplaneringen visade behovet av en tidsbuffert och flexibilitet för att hantera oförutsägbara situationer. Inom Scrum var det värdefullt att utforma sprintuppgifter efter SMART:a mål och att kontinuerligt anpassa Scrum efter gruppens behov. Avslutningsvis kan det konstateras att datamodellering bör utformas i samverkan mellan backend- och frontend-arbetsgrupperna för att främja en effektiv och sammanhängande implementation. 
]



#frag3[
  == Vilket stöd kan man få genom att skapa och följa upp en systemanatomi?

  Att inleda ett projekt med att skapa en systemanatomi gav värdefulla insikter och låg till grund för arbetet att designa TIDIG. Systemanatomin visade sig även vara till hjälp när ett översiktligt blockschema och arkitekturen för TIDIG skulle tas fram. 
  
  Gruppens upplevelse av systemanatomin som verktyg är att det inte var ett stöd för utvecklingen, men att det kan bero på att systemanatomin som skapades inte följdes upp. Det kan även bero på att andra designverktyg användes som upplevdes ge mer stöd för utvecklingen.
 
]

#frag4[
  == Vilka för- och nackdelar finns med att dela upp en webbapplikation som TIDIG i en frontend- respektive backend-server med separata arbetsgrupper?
  
  Uppdelningen i två arbetsgrupper hade både för- och nackdelar. De främsta fördelarna
  var att det möjliggjorde ökat parallellt arbete och minskade kodkonflikter samt att utbildningstiden minskade eftersom alla inte behövde lära sig samtliga teknologier. 

  De främsta nackdelarna var att viss funktionalitet tog onödigt lång tid att implementera, framförallt eftersom det ofta uppstod problem där frontend-gruppen behövde en ändpunkt från backend-gruppen för att testa funktionalitet. Samtidigt var det svårt för backend-gruppen att skapa ändpunkterna i förväg eftersom frontend-gruppen inte visste exakt vilka de skulle behöva och hur de skulle fungera. 
]

#set par(justify: false)
#show bibliography: set heading(numbering: "1")
#show bibliography: set par(spacing: 1.3em)
#bibliography("references.bib", title: "Referenser", style: "ieee.csl")

//- _Minst 9 publicerade pålitliga vetenskapliga källor._
//- _Referenser delas upp i #underline[vetenskapliga] och #underline[icke-vetenskapliga källor]_.
//_
//- Vetenskapliga referenser:
//- Publikationer i en vetenskaplig tidskrift (kallas journal på engelska).
//  - Publikationer från en vetenskaplig konferens (publiceras i en så kallad peer-reviewed conference proceedings).
//  - Doktorsavhandlingar.
//- Icke vetenskapliga referenser:
//  - Böcker.
//  - Tekniska rapporter.
//  - Exjobbsuppsatser (både kandidat och master).
//  - Manualer.
//  - Relevanta webblänkar.
//Använd INTE bloggar (inte Jakob Nielsen heller), företagssidor, Wikipedia, föreläsnings-bilder som
// referenser._