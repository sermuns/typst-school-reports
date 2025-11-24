  #let details = (
  title: "Testrapport",
  group: "PUM02",
  date: "2025-01-28",
  version: "0.1",
      history: (
    "0.1",
    "2025-02-09",
    "Skapats",
    "Placeholder",
    "Hela gruppen",
  ),
)
#import "style.typ": style
#show: style.with(details)

// Anton, 2025-02-21: Följande är en mall för testrapporten. Ta inte bort kommentarer. 

= Introduktion
Den här testrapporten beskriver de olika tester som gjorts under sprinten @ref:begreppslista uppdelat i de testnivåer som testerna fokuserat på. I varje rubrik beskrivs testaktiviteterna, testresultaten, avvikelserna och en utvärdering av testerna. Testerna är numrerade och varje testnummer kommer innehålla en aktivitet, ett resultat, avvikelser och resultat. 

= Acceptanstest
Nedan beskrivs de acceptanstester som gjorts under testperioden.
== Testaktivitet
// Beskriv hur testet gick till
- Prototyptestning
  - Intern prototyptestning
  - Extern prototyptestning

== Testresultat
// Summera testresultat
- SUS-test
- Feedback

== Avvikelser
// Lista avvikelser och deras status (Lösta/uppskjutna/olösta)
- Negativ feedback

== Utvärdering
// Blev testet godkänt?
- Reflektion
  - Överlag högt betyg på SUS-skalan. Kan bero på antalet testpersoner. // för få testpersoner? /IN
  - Det var huvudsakligen interna testpersoner vilket ger en viss bakomliggande förkunskap om prototypen.
  - Bra feedback på designen som till stor del redan är åtgärdat efter prototypen togs fram.

- Åtgärder
  - Utföra fler tester direkt i användargränssnittet. 
  - Göra återkommande tester för de som tidigare testat prototypen.
  - Göra fler externa tester.
  
  - Lägg till tillbakaknappar i vyer som inte är med i navbaren eller hamburgarmenyn.
  - Profilvy (genom att klicka på medlemmar i uppgiftsvyn), ska också gå att klicka på uppgifterna i profilvyn för att komma till uppgiftsvyn.
  - Tidsredovisningsvy: om ingen tid finns inrapporterad ska det visas upp ett meddelande istället för en tom tabell.
  - Tidsredovisningsvy: Visa inte framtida dagar samt begränsa även att välja år/månad i framtiden.
  - statistikvyn: visa inte förväntad arbetstid när man valt en uppgift. I stora vyn ändra så stapeln delas upp i flera färger utefter uppgifterna (hover över en färg för att visa individuella tider)
  
  - skapa en flagga för admin/redovisare och visa olika vyer beroende på det
  - Uppgiftsvy: redovisare ska inte se “skapa ny”, eller kunna redigera uppgift. En redovisare ska kunna klicka på en uppgift och se information om den.


#bibliography("references.bib")