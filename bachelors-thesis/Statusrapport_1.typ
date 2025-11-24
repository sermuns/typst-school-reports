#let details = (
  title: "Statusrapport 1",
  date: "2025-02-21",
  group: "PUM02",
  version: "0.1",
       history: (
    "1.0",
    "2025-02-21",
    "Färdigställt",
    "Placeholder",
    "Isabel",     
    "0.1",
    "2025-02-09",
    "Skapats",
    "Placeholder",
    "Isabel",
  ),
)
#import "style.typ": *
#show: style.with(details)

// Fråga Samuel om det går att (enbart i detta dok) göra så rubrikerna hamnar på samma sida efter varandra. T ex är inledningen bara ett stycke, så nästa rubrik kan börja direkt efter
#show heading: it => it.body // <-- deetta :)  /taaaack :D

//- Utgå från veckorapporter
//- Inspiration från statusrapporten som presenterades på Pitch-seminariet
//- *Inlämning 1 specificerar:* _Statusrapport: Har ni nått era mål så långt? Vad fattas? Ge en kort motivering._


= Projektöversikt
// Alice skrev detta avsnitt.

Kandidatgruppen PUM2 2025 har fått i uppgift att skapa ett tidsredovisningssystem för Digitaliseringsavdelningen (DIGIT) på Linköpings universitet. Gruppen skriver ett kandidatarbete tillsammans och ska vardera lägga ner 400 timmar på kursen. För mer information om kriterier för kandidatarbetet hänvisas läsaren till kursrummet på Lisam.

= Målsättningar och utfört arbete

Arbetet som har genomförts under de första veckorna utgör planeringsfasen i projektet. Krav har samlats in, interna processer har bestämts och projektets genomförande har planerats. Detta har sammanställts i ett flertal dokument. Under uppstartsveckan skapades mål för varje vecka, se @tab:tidsplan. Målen baserades på de dokument som skulle lämnas in eller vara påbörjade till Dokumentinlämning 1. 

#figure(
  caption: "Mål för varje vecka. Dokument som påbörjats med veckonummer. Projektet påbörjades vecka 4.",
  
  table(
    columns: 4,
    [*Vecka 5*], [*Vecka 6*], [*Vecka 7*], [*Vecka 8*],
    [Gruppkontrakt], [Projektplan], [Kvalitetsplan], [Påbörjad testplan],  
    [], [Kravspecifikation], [Systemanatomi], 
    [Påbörjad arkitekturdokument],
    [],[],[],[Påbörjad design av systemet]
  )
)<tab:tidsplan>

//Alice skrev till det som står ovan; start

För måluppfyllelse har arbetet delats upp mellan gruppens medlemmar. Gruppen prioriterade vilka dokument som skulle bearbetas varje vecka utifrån vår målgrund. Det ska dock nämnas att dokumenten fortsatte att korrigeras till och med vecka 8 då kandidatgruppen utförde korrekturläsning av varandras skrivna delar.
//Alice skrev till det som står ovan; slut


Vecka 4 påbörjades projektet och under vecka 5 skrevs gruppkontraktet. Det huvudsakliga fokuset under vecka 6 var projektplanen och kravspecifikationen. Veckan efter ändrades fokus till att gruppens medlemmar som inte arbetade på de tidigare nämnda dokumenten, skulle läsa igenom dessa dokument och ge feedback på strukturen och innehållet. Denna vecka påbörjades även kvalitetsplanen och systemanatomin. Vecka 8 korrekturlästes alla dokument som skulle lämnas in till Dokumentinlämning 1. Därefter  korrigerades dokumenten utifrån gruppmedlemmars feedback. Vidare lades också fokus på testplanen, design och arkitekturdokumentet.

Projektarbetet har främst bestått av dokumentskrivande, där varje roll har fokuserat på de dokument som hen är ansvarig för. Exempelvis påbörjade testledaren testplanen redan andra veckan för att få en bra uppfattning av testningens omfattning. Detsamma gällde arkitekten som undersökte möjliga arkitekturval efter det första interna utkastet av kravspecifikationen. Efter kravspecifikationen var fastställd, påbörjade flera medlemmar självstudier inom bland annat programmeringsspråk, ramverk och design som kommer användas i projektet. 

Utifrån det som gruppen har uppnått under dessa veckor, anses gruppen ha nått sina mål så här långt. Alla uppsatta mål är uppfyllda, och därmed fattas inga handlingar för att uppnå målen.

= Problem, utmaningar och risker

Under dessa 4 veckor har veckorapporter skickats in som innehåller potentiella risker som kan påverka projektarbetet. De två största problemen som har uppstått beskrivs nedan. De ses även som risker i vårt fortsatta arbete.

Det var ett särskilt stort problem första veckan att hitta gemensamma mötestider i projektgruppen, men har därefter minimerats genom en lösning som implementerades andra veckan. Problemet löstes genom att i slutet av varje vecka skicka ut en omröstning där varje medlem fyller i sin tillgänglighet för möte den kommande veckan.

Ett annat problem som uppstod var att hitta tider för kundmöten. På grund av våra kunders fullspäckade scheman har det varit svårt att bestämma möten med dem, då det kräver god framförhållning. Det har delvis varit bristande kommunikation med en av kunderna vilket har lett till några svårigheter att få klarhet kring kravspecifikationen som vi skapade. I framtida arbete kan denna risk medföra försenade kundmöten och fördröjda interna processer.

= Nästa steg
//Alice Skrev denna del

Kommande vecka lägger projektgruppen sitt fokus på design av frontend och backend, samt fokus på utbildning. Denna utbildning ska täcka både tekniska och processpecifika delar i projektet.
Utbildningen består av självständigt lärande och interna workshops där de kunniga i ämnet föreläser för de okunniga i gruppen. 
Gällande utbildning inom process är tanken att gruppen ska utbilda sig i Scrum samt hur konfigurationsrutinerna (beskrivna i kravspecifikationen) ska följas. Vidare kommer också arkitekturdokumentet och testplanen att fortsätta utvecklas. 
I allmänhet är planen sedan att projektet går in i implementationsfasen där designen som har framställts implementeras. Detta kommer också att kompletteras med dokumentskrivning av de dokument som fått feedback efter Dokumentinlämning 1.