#let details = (
  title: "Arkitekturdokument",
  history: (
    "0.3",
    "2025-04-23",
    [
      Lägg till `EmploymentRate` till `User`
    ],
    "",
    "S.Åk",
    
    "0.2",
    "2025-04-10",
    [
      'Entra-ID' i @blockschema.

      Öka kontrast i @db-diagram.

      PascalCase för datatyper i @datatyper.

      Byt från 'Assignment' till 'Task'.
    ],
    "A.B",
    "S.Åk, A.B",
    
    "0.1",
    "2025-03-11",
    "Skapad.",
    "S.G",
    "A.B, S.Åk, S.Ås",
  ),
)
#import "style.typ": *
#show: style.with(details)

#bibliography("references.bib")

#set table(align: left)

//Mall https://liuonline.sharepoint.com/:w:/r/sites/Lisam_TDDD96_2025VT_Y8/_layouts/15/doc2.aspx?sourcedoc=%7B40cb5228-600a-4681-a9a8-0d18ea154813%7D&action=view&wdAccPdf=0&wdparaid=694062B6

// Architectural Mechanism https://www.ida.liu.se/~TDDC88/openup/core.tech.common.extend_supp/guidances/concepts/arch_mechanism_2932DFB6.html

= Inledning
== Syfte // Påbörjat av Stina
// This document describes the philosophy, decisions, constraints, justifications, significant elements, and any other overarching aspects of the system that shape the design and implementation.

// Simon 03-11 : Möjligvis förtydliga vad systemets integritet innebär i detta sammanhang. (Axel - Fixat)
I detta dokument beskrivs och motiveras tidsredovisningssystemets design- och arkitekturval för att hjälpa nuvarande och framtida utvecklare att förstå systemet. Arkitekturen grundas i stor utsträckning på de krav som specificerats av kunden, de resulterande begränsningarna och den förväntade kvalitetsnivån för produkten.

Dokumentet fungerar som stöd och vägledning för utvecklarna av produkten genom att ge en övergripande beskrivning och motivering av systemets arkitektur på en hög nivå. Dokumentet förväntas även vara hjälpsamt till dem som ska underhålla systemet genom att ge en tydlig översikt och förklaring av de bakomliggande besluten gällande arkitekturen.

== Arkitekturella mål och filosofi //Påbörjat av Stina
// [Describe the philosophy of the architecture. Identify issues that will drive the philosophy, such as: Will the system be driven by complex deployment concerns, adapting to legacy systems, or performance issues? Does it need to be robust for long-term maintenance?

//Formulate a set of goals that the architecture needs to meet in its structure and behavior. Identify critical issues that must be addressed by the architecture, such as: Are there hardware dependencies that should be isolated from the rest of the system? Does the system need to function efficiently under unusual conditions?]

De arkitektuella målen baseras på att systemet ska vara enkelt att underhålla och robust för långsiktig användning. Systemet förväntas vara i drift under en längre tid vilket är viktigt att ha i åtanke vid designen av arkitekturen.

Baserat på detta har nedanstående designmål definierats:
- *Underhållsvänligt:* Systemet ska vara enkelt att underhålla, vilket innebär välstrukturerad kommenterad kod, bra dokumentation och en arkitektur som underlättar vidareutveckling.
- *Robust och långsiktigt hållbart:* Eftersom systemet förväntas vara i drift under en längre tid, ska arkitekturen vara stabil och pålitlig.
- *Integration med LiU:s SSO:* Systemet ska stödja integration med LiU:s SSO.
- *Skalbarhet och prestanda:* Arkitekturen ska möjliggöra hantering av stora mängder data över tid utan att försämra systemets prestanda.
- *Modularitet och vidareutveckling:* Arkitekturen ska vara modulär så att kunden enkelt ska kunna vidareutveckla och anpassa det efter framtida behov.

== Antaganden och beroenden // Påbörjat av Stina
//[List the assumptions and dependencies that drive architectural decisions. This could include sensitive or critical areas, dependencies on legacy interfaces, the skill and experience of the team, the availability of important resources, and so forth]

Systemets arkitekturella val begränsas av de krav av programmeringsspråk och ramverk som har bestämts i _kravspecifikationen_ @ref:kravspecifikation. Användargränssnittet begränsas även av de tillgänglighetskrav som efterfrågats av kunden.

Systemet ska även integreras med LiU:s SSO vilket utgör ytterligare ett beroende eftersom det kräver att tjänsten är tillgänglig och fungerar som förväntat.

Dessutom påverkas implementationen och tidsåtgången av projektgruppens kompetens och förmåga att lära sig de programmeringsspråk och ramverk som ska användas.


= Systemet

Detta kapitel beskriver övergripande implementationsdetaljer kring produkten.

== Översikt på systemet

@blockschema illustrerar hur systemet är uppbyggd. Till vänster syns den externa webbläsaren och dess kontakt med frontend-servern. Till höger syns backend-servern och dess kontakt med frontend, databas och extern Entra-ID applikation för autentisering.

#figure(
  caption: [Blockschema över systemet],
  image("pictures/Blockschema.png", width: 100%),
) <blockschema>

// Axel 6/3
Frontend-serverns uppgift är att generera och skicka webbsidor till webbläsaren samt hantera all kommunikation mellan webbläsaren och systemet. Den data som används för att generera webbsidorna hämtas från backend-serverns API, se @rubrik:API.

Backend-serverns uppgift är att ta emot förfrågningar från frontend-servern, generera lämpliga objekt från databas-data och utföra all logik. Ibland kommer frontend göra förfrågningar efter objekt som perfekt överensstämmer med tabeller i databasen, men ibland kommer mer tunna objekt (se @tunna_datatyper) genereras från de typerna.

== Datatyper <datatyper> // SamuelÅ 6 mars
En del data återkommer ofta tillsammans och grupperas och namnges och defineras därför som systemets _datatyper_.

Dessa datatyper återkommer som objekt i frontend, backend och data.

En uppdelning mellan två kategorier av datatyper har identifierats: _tunna_ datatyper och _hårda datatyper_.

=== Hårda datatyper <hårda-datatyper>
Hårda datatyper kännetecknas av att de har en direkt motsvarig tabell i databasen, som en konsekvens av _Entity Framework_. För det mesta kommer frontenden inte vara medveten om dess existens, utan får arbeta med _tunna datatyper_.

En lista över alla hårda datatyper:

- `User` : Information om en viss användare.

- `Favorites` : Vilka `Tasks` som en viss användare vill ska synas högst upp i listorna.

- `TimeReport` : En tidsredovisning. Är kopplad till både en `Task` och en `User`.

- `Task` : En uppgift. Är kopplad till grupp och aktivitet. Har namn, start- och slutdatum.

=== Tunna datatyper <tunna_datatyper>
Tunna datatyper kännetecknas av att frontend ofta använder dem för att bygga upp dokumentet. De är ofta väldigt specifika och sammanhangsberoende.

Exempel på tunna datatyper:

- `TaskWithoutUser` : En `Task` som inte har information om medlemmar, eftersom användare redan är inloggad och vet att den är medlem.

- `TimeReportView` : En lista av `TimeReport` för en viss tidsperiod. Behövs till exempel för att rita upp en månadsvy i frontend utan onödig data.


== Dataserialisering // SamuelÅ 10 mars

Alla datatyper måste kunna konverteras till strängformat för att kunna skickas genom nätverksförfrågningar. I både backend- och frontendkoden finns stöd för automatisk serialisering, i form av JSON. Enligt Google JSON Style Guide @ref:google-json ska properties vara i `camelCase`, och det är även så C\# automatiskt JSON-serialiserar objekt.

Ett speciallfall för en del tunna datatyper som härstammar från `time_report` är att de måste kunna konverteras till `.csv`-format. @csv visar formatet systemet förväntar sig under import/export av `.csv` filer.

#figure(
  caption: [`.csv`-representation av en del tunna datatyper som beror på `TimeReport`],
  table(
    columns: (auto,) + (1fr,) * 4,
    fill: none,
    [], [Jan 1], [Jan 2], [...], [Jan 31],
    [`Lisam-DevGroup-TimeTracker`], [0], [0], [0], [0],
    [`LiuApp-DevGroup-TimeTracker`], [0], [0], [0], [0],
  ),
) <csv>

#pagebreak()
== Systemanatomi

Baserat på användningsfallen som definierats i _kravspecifikationen_ @ref:kravspecifikation har en systemanatomi skapats. Den syns i @systemanatomi.

#figure(
  image("pictures/Systemanatomi.png", width: 90%),
  caption: [Systemanatomin],
)<systemanatomi>

Systemanatomin visar vilka funktionaliteter som är beroende av andra funktionaliteter.

Högst upp syns funktionalitet som slutanvändaren är intresserad av. Varje lager nedanför är funktionalitet som krävs för att uppnå allt ovanför. Man kan läsa det som att varje funktionalitets höjd överensstämmer med dess abstraktionsnivå.

#pagebreak()
== Struktur på databas

Alla hårda datatyper som definieras i @hårda-datatyper har, som tidigare nämnt, en motsvarande tabell i databasen. Många av tabellerna har relationer till varandra, vilket illustreras genom pilar mellan kolumner.

En översikt över databasen kan ses i @db-diagram.
 
#figure(
  image(bytes(read("pictures/databasdiagram.svg")
    .replace("#6F6F6F", black.to-hex())
    .replace("rgb(153, 153, 153)", black.to-hex())
    .replace("rgb(111, 111, 111)", black.to-hex()))),
  caption: [Diagram över databasen],
)<db-diagram>


= Arkitekturpåverkande krav //Påbörjat av Stina
//[Insert a reference or link to the requirements that must be implemented to realize the architecture.]
// Simon 03-11 : Hänvisa till andra dokument i kursivt. (Axel - Fixat)
I @arkitektur_krav_tabell listas de krav som påverkar arkitekturen på något sätt och bör därmed has i åtanke vid designbeslut. Samtliga är hämtade från _kravspecifikationen_ @ref:kravspecifikation. Kraven är listade tillsammans med en kort beskrivning samt en motivering till varför det är relevant för arkitekturen.

#figure(
  caption: "Lista över arkitekturpåverkande krav",

  table(
    align: left,
    columns: (auto, auto, auto),
    [*Krav-ID*], [*Beskrivning*], [*Motivering*],
    [FR1, FR2, FR4, FR9, FR10, FR12],
    [Beskriver inloggningsprocessen samt hur systemet ska anpassas baserat på användarens grupp.],
    [Kräver integration med LiU:s SSO och hantering av grupper.],

    [FR3, FR20],
    [Anger att endast LiU-ID ska lagras som personuppgift, och ingen data får raderas från databasen, även om en användare tas bort från en uppgift.],
    [Begränsar databasdesignen i vilken data som ska sparas och kräver att systemet säkerställer att tidsredovisningsdata bevaras.],

    [FR17, FR18],
    [Systemet ska kunna exportera och importera data i .CSV-format.],
    [Kräver stöd för att skriva och läsa .CSV-filer.],

    [FR16, FR22, FR23],
    [Systemet ska ha stöd för filtrering och sökning på uppdrag och personer.],
    [Kräver att databasen har stöd för sökningar och filtreringar.],

    [NFR1, NFR2],
    [Systemet ska implementeras med `C#`, `ASP.NET`, `Svelte` och `Typescript`.],
    [Begränsar valen för implementeringen av frontend och backend.],

    [NFR4, NFR8],
    [Systemet ska följa LiU:s grafiska profil och specifika tillgänglighetskrav],
    [Påverkar designen av front-end.],
  ),
)<arkitektur_krav_tabell>
// Isabel 7 mars: observera att NFR6 är borttaget från kravspecen. Jag tror att kravet antingen ska tas bort eller omformuleras på ett mätbart sätt. (Axel - Fixat)

= Val och begränsningar
I detta avsnitt beskrivs några designbeslut, begränsningar och motiveringen till dessa.
//[List the decisions that have been made regarding architectural approaches and the constraints being placed on the way that the developers build the system. These will serve as guidelines for defining architecturally significant parts of the system. Justify each decision or constraint so that developers understand the importance of building the system according to the context created by those decisions and constraints. This may include a list of DOs and DON’Ts to guide the developers in building the system.]


== Systemövergripande
// SamuelT 26/2
// Axel 11/4: Tog bort att LiU:s SSO används hanterar behörighet till uppgifter
- Användare av tidsredovisningssystemet autentiseras genom LiU:s SSO. Det har valts eftersom kunden använder det systemet för att hantera tillgång till systemet. 

- Systemet har delats upp i två servrar: en för frontend och en för backend. Det har gjorts för att uppnå modularitet, vilket var ett mål enligt _kvalitetsplan_ @ref:kvalitetsplan. Om servern hade implementerats i en enda kodbas är det större risk att det blir otydligt vilken det av systemet som gör vad, var man ska leta för att hitta ett beskrivningen för ett visst beteende och att ett komplicerat nät av beroenden skapas. Uppdelningen gör så att varje server kan jobba isolerat och har en tydlig uppgift.


// Axel 20 feb, idéer:
// - Endast autentiserade användare ska få tillgång till webbapplikationen
// - Klar :   Användare ska autentiseras genom LiU:s SSO

== Frontend
//SamuelÅ 5/3
- Användargränssnittet ska vara byggd i ett frontend-ramverk. Detta för att ett gränssnitt med ren HTML+CSS+JS kräver för mycket repetition av kod (boilerplate).

//SamuelT 26/2
- Frontend ska vara baserat på och utvecklat med Svelte @ref:svelte.


== Backend
- I enlighet med kundens vilja ska backend-servern köras i ASP.NET och driftsättas på Azure.

// Axel 11/4: Tog bort att driftsättningen kommer ske på Azure  
//Alice 13/4 det står kvar ovan???
- Databasen driftsätts med Microsoft SQL i enlighet med kundens vilja.

// Axel 11/4: Tog bort referens till azure sql
- Uppkopplingen till databasen kommer ske genom Entity Framework Core @ref:efcore som gör att databasens tabeller och anrop kan definieras i C\#-kod direkt i backend. Mer om Entity Framework Core står i @rubrik:EFCore.

- För sessioner har vi valt att använda vår egna lösning som sparar sessioner genererar ett GUID som id och sparar den i databasen. Anledningen är att den förbyggda lösningen, `Microsoft.AspNetCore.Session`, gör antagandet att backend-servern får förfrågningar direkt från klienten och skickar därför en `Set-Cookie`-header. Eftersom all trafik skickas genom frontend-servern med vår arkitektur innebar det att vi behövde skapa en ful lösningen för att få den förbyggda att fungera. Dessutom sparar den förbyggda lösningen alla sessioner i minnet och vi ville spara dem i databasen. Vi gjorde det valet innan vi hade fått tillgång till LiU-SSO och inte visste hur länge en LiU-SSO-session är giltig. Med tanke på att de bara är giltiga i en och en halv timme spelar det ingen större roll om man skulle förlora alla sessioner vid server omstart och att spara dem i minnet skulle vara ok, om inte bättre.

== Utvecklingsmiljö
// Axel 11/4: Bytt ut Doxygen mot openapi/redoc
- Vid utveckling av C\#-kod kommer vi använda oss utav OpenAPI @ref:open_api och Redoc @ref:redoc för att generera dokumentation till API. Den kan då användas som referens av både frontend och backend för vilka ändpunkter som finns, vilken data den förväntar sig och vilken data den skickar.

// Axel 11/4: Lade till csharpier, borde kanske vara egen punkt?
- Vid utveckling i Svelte ska formatteringsverktyget _Prettier_ @ref:prettier_docs användas för att få ett snyggt och unisont utseende på koden. På samma vis kommer CSharpier @ref:csharpier användas för att formatera C\#-koden. 

- Vid utveckling i Svelte ska _ESLint_ @ref:eslint användas för att hitta potentiella problem i koden.


= Designmönster

== _Two-tier, Thin-client_
Systemet följer en klient-server modell som delar upp systemet i två nivåer där den största belastningen ligger på servern:
- *Klient:* Detta representerar användargränssnittet och hanterar all interaktion med användaren såsom inmatning och presentation av data.
- *Server:* Ansvarar både för affärslogiken och datahantering. Detta inkluderar lagring, databasoperationer och hämtning av data men även att förmedla data mellan klient och servern. Här behandlas också användarförfrågningar och beräkningar utförs @ref:software_architecture.



== Fasad <rubrik:fasad> //Skrivet av Stina
#figure(
  caption: [Illustration av designmönstret fasad @ref:design_patterns],
  image(
    "pictures/facade.png",
    height: 20em,
  ), // SamuelT 27/2 gjorde bilden mindre.
) <fascadebild>

Fasad är ett designmönster som tillhandahåller ett enhetligt gränssnitt till en uppsättning gränssnitt i ett delsystem.
Mönstret illustreras i @fascadebild, där _Facade_ är den engelska benämningen på fasad. Det fungerar som ett högre-nivå gränssnitt med syftet att förenkla användandet av delsystemet. Fördelarna med fasad är att det minskar systemets komplexitet, gör systemet mer återanvändbart och enklare att anpassa. Dessutom främjar det svag koppling, vilket är önskvärt eftersom det möjliggör förändringar, gör koden blir mer lättförståelig och testbar genom att isolera fel @ref:design_patterns.

Detta förenklar kommunikationen mellan systemet frontend och backend, eftersom frontend kan göra anrop till fasaden utan att behöva känna till den underliggande strukturen.

Genom att använda designmönstret fasad uppfylls kundens krav på ett system som är lätt att underhålla.

= Abstraktioner // Skrivet av Axel
De två huvudsakliga abstraktionerna som systemet kommer implementera ligger mellan backend-servern och databasen samt mellan backend-server och frontend-servern.

== Entity Framework Core <rubrik:EFCore>
Mellan backend-servern och databasen används verktyget _Entity Framework Core_ @ref:efcore. Det förenklar och abstraherar kommunikation mellan backend-servern och databasen.

Verktyget kopplar en klass i C\#-koden på backend-servern till en tabell i databasen och innehåller även funktionaliteten att uppdatera databasens tabeller efter en ändring har gjorts i koden.

Fördelen med att använda ett sådant verktyg är att all data som hämtas från databasen garanterat har rätt typ. Det förenklar för utvecklarna att skriva mer koncis och säker kod. Eftersom databasens struktur definieras i koden kan den användas som referens av utvecklarna utan att behöva öppna ett annat program, den kan även av samma anledning enkelt återskapas för en ny miljö, exempelvis en testningsmiljö.

== API <rubrik:API>
Mellan backend-servern och frontend-servern kommer en API finnas som gränssnitt. Målet med API:n är att abstrahera bort så mycket som möjligt från frontend-servern så att den enkelt kan hämta alla data den behöver för att generera en webbsida med ideellt ett anrop. Alternativet är att istället behöva göra ett stort antal anrop till API:n för att sedan filtrera alla data som hämtats. Det separerar även ansvaret mellan backend-servern och frontend-servern där backend-serverns jobb är att hantera data och frontend-serverns jobb att generera webbsidor. API:n kommer använda sig utav designmöstret fasad (@rubrik:fasad) genom att ge frontend-servern ett simpelt gränssnitt för att hämta data som gömmer komplexiteten av att samla ihop den data.
