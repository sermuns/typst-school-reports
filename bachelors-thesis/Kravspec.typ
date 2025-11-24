#let details = (
  title: "Kravspecifikation",
  history: (
    "1.1",
    "2025-03-05",
    "Justerat enligt feedback från handledare",
    "S.T, I.N, A.B",
    "J.T, S.T, S.Ås",
    "0.2",
    "2025-02-21",
    "Justerat enligt kundfeedback",
    "",
    "J.T",
    "0.1",
    "2025-02-09",
    "Skapats",
    "",
    "J.T",
  ),
)

#import "style.typ": *
#show: style.with(details)

// Axel 11 mars:
// Byt ut säkerhetsgrupp mot grupp i på flera ställen i dokumentet

= Inledning
Det här är kravspecifikationen för det tidsrapporteringssystem som Digitaliseringsavdelningen på Linköpings universitet har beställt. Dokumentet är skrivet i enlighet med IEEE:s standard för kravspecifikationer @ref:ieee_srs.
// Kravspecifikation kallas SRS på engelska. 
// - Hjälp med att skriva: 
// https://www.perforce.com/blog/alm/how-write-software-requirements-specification-srs-document 
// - Mall:
// https://www.cse.chalmers.se/~feldt/courses/reqeng/examples/srs_example_2010_group2.pdf
// - Mall 2:
// https://www.cse.msu.edu/~cse435/Handouts/SRSExample-webapp.doc
// - Hur man formulerar ett krav: https://www.ida.liu.se/~TDDC88/theory/03requirements.pdf 
// - Utseende: https://github.com/jam01/SRS-Template 
// - Innehåll i SRS på svenska: https://www.studentlitteratur.se/globalassets/inriver/resources/checklista--mall--kravspecifikation.pdf?srsltid=AfmBOoqO4ouvaHievOZkThcMV9SgE9DETSwGz8Mppg3Do8OpWd133O4C 


== Syfte
Syftet med dokumentet är att ge en detaljerad beskrivning av kraven för ett nytt tidsredovisningssystem som utvecklas på beställning av Digitaliseringsavdelningen (DIGIT) på Linköpings universitet (LiU). Dokumentet innehåller en beskrivning av systemets funktionalitet, användaregenskaper, begränsningar, antaganden och beroenden samt specifika krav.

== Omfattning
Tidsredovisningssystemet är en webbaserad applikation som utvecklas för att ersätta det befintliga tidsredovisningssystemet som används av DIGIT. 
Systemet ger medarbetare möjligheten att rapportera sin arbetade tid på olika uppgifter och låter administratörer ta fram underlag för den tid som ska faktureras.

Administratörer kan skapa uppgifter och lägga till tidsredovisare till dem. Tidsredovisare kan rapportera tid genom att ange antal timmar och minuter. Administratörer kan se en sammanfattning av rapporterad tid för varje uppgift och tidsredovisare. 

LiU:s befintliga system ska användas för att autentisera användare.
LiU:s befintliga system för grupper ska bestämma användarnas roll och tillgång till uppgifter att rapportera tid till.

== Definitioner, akronymer och förkortningar
Förklaringar till de förkortningar, definitioner och akronymer som används i det här dokumentet finns i projektets _begreppslista_ @ref:begreppslista.

// Specialfall i kravspec att referenslistan ska vara en level 2-rubrik.
#show bibliography: set heading(level: 2)
#bibliography(
  "references.bib",
  title: "Referenser",
)

== Översikt
Resten av dokumentet är uppdelat i två kapitel och ett appendix. 

@generell_beskrivning (Generell beskrivning) ger en översikt av systemet och dess avsedda användare. Det är en beskrivning av systemet i flytande text som syftar till att ge den förståelse av systemet som krävs för att tolka kraven i @specifika_krav.

@specifika_krav (Specifika krav) innehåller en detaljerad beskrivning av kraven för systemet. Kraven är uppdelade i funktionella och icke-funktionella krav. Funktionella krav beskriver funktioner som systemet ska bestå av, medan icke-funktionella krav beskriver egenskaper hos systemet. Kraven är prioriterade och numrerade för att underlätta referens och spårbarhet. Vid eventuell borttagning av ett krav kommer dess ID att förbli oförändrat för att underlätta spårbarhet och historikhantering.

= Generell beskrivning <generell_beskrivning>
 
Det här avsnittet ger en översikt över systemet och dess funktionalitet. Här beskrivs även de olika användartyperna och hur systemets funktionalitet varierar beroende på användare. 

== Användningsfall
//Användningsfall är en modell för hur användare (både administratörer och tidsredovisare i det här fallet) kan använda systemet. Alltså vilka funktioner de kan utnyttja.

//isabel ändrade till:
Användningsfall är en modell som beskriver hur användare kan använda systemet. I det här fallet innebär det vilka funktioner som tidsredovisare och administratörer kan använda.
I @användningsfall syns en visualisering av de sammanställda användningsfallen i ett användningsfallsdiagram. Diagrammet visualiserar hur tidsredovisare och administratörer kan interagera med varandra genom systemet. En administratör är en utökning av en tidsredovisare och kan därför utföra både tidsredovisares och administratörers användningsfall.
#figure(
  image("pictures/användningsfallsdiagram.png", width: 80%),
  caption: [
    Användningsfallsdiagram
  ],
)<användningsfall>

=== Logga in //Ändrad av Simon
När användaren öppnar systemet kan denne logga in med sitt LiU-ID. Baserat på vilka grupper användaren tillhör loggas den in som antingen tidsredovisare eller administratör.

=== Se uppgifter baserat på grupp //Ändrad av Simon
Tidsredovisaren får en lista med uppgifter som den är involverad i och kan välja att tidsrapportera till dessa.

=== Tidsrapportera
Tidsredovisare kan tidsrapportera för uppgifter genom att antingen ange arbetad tid per dag eller den totala tiden för hela månaden.

=== Redigera tidsrapportering
En tidsredovisare kan redigera sin inrapporterade tid för den innevarande månaden.

// Axel 11 mars: Borde möjligtvis ta bort "och manuellt importera data" eftersom det tas upp i rubriken efter
// Jakob - kommer ej fixa
=== Ladda ner tom mall och manuellt importera data
Tidsredovisare kan ladda ned en tom tidsrapporteringsmall från systemet. Mallen används för att manuellt fylla i arbetad tid utanför systemet. Mallen är en fil av typen `.csv` och beskrivs i _arkitekturdokumentet_ @ref:arkitekturdokument.

=== Importera ifylld mall
Tidsredovisare kan fylla i data i en `.csv` med format som definieras i _arkitekturdokumentet_ @ref:arkitekturdokument och sedan importera den till systemet.

=== Skapa uppgifter
Uppgifter kan skapas av administratörer genom att ange metadata i form av aktivitet, uppgiftsnamn och eventuellt ett startdatum. Tidsredovisare och grupper kan läggas till i en uppgift, vilket gör att specifika tidsredovisare eller medlemmar i en tillagd grupp kan rapportera tid för uppgiften.


=== Arkivera och avarkivera uppgifter
En uppgift kan arkiveras av en administratör, vilket gör det inaktivt, och avarkiveras, vilket gör att det är aktivt.

=== Se tidsrapportering månadsvis
Administratörer har tillgång till en översikt där de kan se de anställdas tidsrapportering månadsvis samt en sammanställning av den totala tiden som spenderats på samtliga uppgifter. 

=== Söka på uppgifter och personer
Administratörer kan söka på specifika uppgifter och personer för att se deras tidsrapportering månadsvis.

=== Filtrera på aktiva/inaktiva uppgifter
Administratörer kan välja om de vill se tidsrapporteringen för aktiva eller inaktiva uppgifter. 

=== Exportera tidsredovisning
Administratörer kan exportera en sammanfattning över en viss uppgift, en viss tidsredovisare eller en viss månad.

== Produktperspektiv <produktperspektiv> //Skrivet av Stina
// Axel 11 mars: Står säkerhetsgrupp i bilden
// Jakob - Skriv in i begreppslistan att det också kallas säkerhetsgrupp, så det kan vara kvar så här
#figure(
  image("pictures/TDDD96-Block_diagram_Kravspec.png", width: 80%),
  caption: [
    Blockdiagram - Arkitektur
  ],
) <arch_block>

// Samuel T 2/3 ändrade
Systemet har ett webbaserat användargränssnitt som ger användarna en enkel miljö att interagera med. Anställda kan i webbportalen rapportera sina arbetade timmar och administratörer kan hantera uppgifter och granska tidsredovisningar. @arch_block illustrerar detta.


// Samuel T ändrade 2/3 från backend-applikation till backend-API. Tyckte det beskriver bättre. 
Webbportalen kommunicerar med ett backend-API som hanterar all data och systemets centrala funktionalitet. Backend-API:et integreras med LiU:s system för att verifiera användarnas identitet och hantera behörigheter. Den ansvarar för användarinloggning, systemloggning, registrering av arbetstid, hantering av uppgifter, samt import och export av data. Backend-API:et kommer även att interagera med en Microsoft SQL databas som lagrar information om användare och uppgifter.

== Produktfunktioner
Systemet ska använda LiU:s inloggningssystem för att autentisera användare. Om en användare inte är inloggad när den försöker nå systemet, kommer den att skickas till LiU:s inloggningssida först.


Systemet kommer att verifiera användarens identitet och hämta dess grupper. Om användaren tillhör den grupp som klassificeras som tidsredovisare visas en lista med uppgifter som personen är delaktig i, baserat på grupper. När en uppgift är vald kan tidsredovisaren fylla i antalet arbetade timmar. Om användaren är en administratör visas dels de anställdas rapporterade timmar och dels en summering över antalet arbetade timmar för respektive uppgift. 

Systemet har ytterligare gränssnitt för användare med administratörsrättigheter. Dessa gränssnitt hanterar funktionaliteten för att skapa uppgifter, samt tilldelning och borttagning av tidsredovisare från uppgiften. Vid skapandet av en uppgift anges ett namn och aktivitet. Flera uppgifter kan ha samma aktivitet. Ett startdatum kan också anges men det är valfritt, om inget anges sätts det automatiskt till dagens datum. 

Varje tidsredovisare kommer att kunna se sina individuellt inrapporterade timmar till respektive uppgift.

Varje tidsredovisare kommer att kunna sortera de uppgifter de är tidsredovisare i genom sök- och sorteringsfunktioner. Denna funktionalitet kommer att använda uppgiftsegenskaper för att hitta relevanta uppgifter.

== Användaregenskaper
Det finns två olika typer av användare som kommer att interagera med systemet: *administratörer* och *tidsredovisare*. Eftersom deras behov skiljer sig åt, har systemet olika funktioner och specifika krav beroende på användartyp. 

*Administratörer* kan få översikt över fakturerbara timmar som spenderats på olika uppgifter. Yrkesroller som kommer vara administratörer i systemet kan exempelvis vara chefer, ledare, uppgiftsansvariga eller ekonomer.

*Tidsredovisare* kan kategorisera sina arbetstimmar till korrekt uppgift. Yrkesroller som kommer vara tidsredovisare i systemet kan exempelvis vara medarbetare eller konsulter.

Alla administratörer har även rollen som tidsredovisare, men alla tidsredovisare har inte administratörsbehörighet.


// Skrivet av Stina
// Axel 11 mars: "eller registrerar direkt som en totalsumma för månaden." gäller inte längre eller hur?
// Jakob - Fixat
Tidsredovisare ska endast använda systemet för att månadsvis rapportera hur mycket tid de har spenderat på uppgifter de arbetar med. Det innebär att tidsredovisaren ska kunna se en lista med uppgifter som den är involverad i, välja en uppgift och registrera den tid som har lagts ned. Tiden kan antingen anges dag för dag, varav systemet automatiskt summerar månadens totala timmar.

Tidsrapporteringen skickas till administratörer, som ska kunna se både hur mycket tid varje anställd har spenderat på olika uppgifter varje månad och den totala tiden som registrerats för uppgifter. Administratörer ska även ha möjligheten att skapa nya uppgifter i systemet som tidsredovisare kan tidsrapportera till. De kan ange vilka tidsredovisare och grupper som kan tidsredovisa till en specifikt uppgift. 

== Begränsningar // Skrivet av Stina
- En begränsning är att systemet måste integreras med LiU:s autentiserings- och behörighetsstyrningssystem, vilket begränsar valet av inloggnings- och autentiseringslösningar. Detta kan försvåra framtida förändringar eller utökningar av autentiseringsmetoder. 

// Axel 11 mars: Internet behövs väl för att använda applikationen inte bara logga in?
// Jakob - fixat
- Ytterligare en begränsning är att systemet kräver internetuppkoppling, vilket begränsar tillgängligheten i miljöer med instabil eller obefintlig nätverksuppkoppling.

- Systemet ska utformas för att hantera cirka 150 anställda på DIGIT. En begränsning är dock att det kan vara utmanande att skala upp systemet om antalet användare ökar avsevärt, samtidigt som existerande uppgifter och tidigare anställda ska bevaras i databasen. 

- Systemet måste uppfylla tillgänglighetskrav EN 301 549 / WCAG 2.1, vilket kan begränsa flexibiliteten i designval. 


== Antaganden och beroenden //Skrivet av Stina
- Systemet förutsätter att LiU:s SSO-lösning förblir oförändrad och fungerande. Om LiU ändrar sitt autentiseringssystem kan systemets inloggningsfunktion behöva anpassas. 

- Systemet antar även att LiU:s grupper förblir konsekventa. Om dessa skulle ändras kan det påverka systemets funktionalitet och skulle kräva uppdateringar.

- Systemet förväntas kunna driftsättas inom LiU:s IT-miljö. Om det skulle förändras skulle utvecklingen och implementationen försvåras. 

- Systemet förutsätter att riktlinjerna för tillgänglighet förblir oförändrade. Om dessa uppdateras kan systemets gränssnitt behöva justeras.

= Specifika krav <specifika_krav>
I det här avsnittet listas alla specifika krav som ställs på systemet upp, med tillhörande beskrivning och prioritet.

== Utformning
Specifika krav presenteras som en tabell. Varje rad symboliserar ett krav.

Varje rad innehåller kolumner för:

- *ID:* Kravets unika förkortning. Samma krav kommer att behålla sitt ID även om kringliggande krav justeras eller tas bort.

- *Beskrivning:* Tydlig förklaring över vad kravet innebär.

- *Prioritet:*
  - Prio 1 symboliserar ett _skall-krav_. Dessa krav måste vara uppfyllda vid leverans.
  - Prio 2 symboliserar ett _bör-krav_. Dessa krav hanteras i mån av tid.

== Funktionella krav

I det här avsnittet beskrivs de funktionella kraven på systemet. Dessa beskriver vad systemet ska göra.  @funktionella_krav_tabell visar en lista på de funktionella kraven tillsammans med en prioritering samt datum som de skapades.

// Axel 11 mars: Ska kraven vara ordnade efter prioritet?
// Jakob - fixat
#figure( 
  caption: "Lista över funktionella krav",
  
  table(// Ändrad av Stina, Simon, Jakob
  columns: (auto, 1fr, auto, auto),
    [*ID*], [*Beskrivning*], [*Prio*], [*Skapad*],
    [FR1], [Användare ska kunna logga in på systemet med sitt LiU-ID.], [1], [2025-02-09],
    [FR2], [Systemet ska bestämma en användares roll baserat på LiU:s grupper], [1], [2025-02-09], 
    [FR3], [Systemet ska inte spara mer personuppgifter än LiU-ID.], [1], [2025-02-09],
    [FR4], [Systemet ska ge tidsredovisare tillgång till uppgifter att rapportera till utifrån LiU:s grupper.], [1], [2025-02-09],
    [FR5], [Tidsredovisare ska kunna rapportera tid genom att ange antal arbetade timmar.], [1], [2025-02-09],
    [FR6], [Tidsredovisare ska kunna rapportera tid i flera uppgifter.], [1], [2025-02-09],
    [FR26], [Tidsredovisare ska kunna redigera sin rapporterade tid för alla uppgifter de medverkar i.], [1], [2025-02-17],
    [FR7], [Administratörer ska kunna skapa uppgifter genom att ange uppgiftsnamn och aktivitet. Ett startdatum kan anges men är inte obligatoriskt.], [1], [2025-02-09],
    [FR9], [Systemet ska skapa en grupp i samband med att uppgifter skapas.], [1], [2025-02-09],
    [FR10], [Systemet ska endast presentera de uppgifter som tidsredovisaren är tilldelade till.], [1], [2025-02-09],
    [FR11], [Administratörer ska kunna modifiera uppgifter.], [1], [2025-02-09],
    [FR12], [Administratörer ska kunna bestämma vilka grupper och tidsredovisare som kan tidsrapportera till en viss uppgift.], [1], [2025-02-09],
    [FR13], [Administratörer ska kunna arkivera och avarkivera uppgifter.], [1], [2025-02-17],
    [FR14], [Uppgifter ska kunna vara aktiva eller arkiverade, där arkiverade uppgifter döljs i listan för alla användare.], [1], [2025-02-09],
    [FR15], [Systemet ska kunna summera tider från tabeller.], [1], [2025-02-09],
    [FR16], [Administratörer ska kunna filtrera mellan aktiva och inaktiva uppgifter.], [1], [2025-02-09],
    [FR17], [Användare ska kunna importera och exportera rapporterad tid till och från en CSV-fil.], [1], [2025-02-09],
    [FR18], [Systemet ska kunna exportera en tom CSV-mall med samma format som systemet kan ta som indata. Formatet definieras i _arkitekturdokumentet_ @ref:arkitekturdokument.], [1], [2025-02-09],
    [FR19], [Administratörer ska kunna se en sammanfattning av månaden, sorterad efter uppgifter och personer.], [1], [2025-02-09],
    [FR20], [Systemet ska behålla samtlig rapporterad tid för en tidsredovisare även om denne blir borttagen från en viss uppgift.], [1], [2025-02-09],
    [FR22], [Administratörer ska kunna söka på personer och uppgifter.], [1], [2025-02-09],
    [FR23], [Tidsrapportörer ska kunna söka på uppgifter.], [1], [2025-02-09],
    [FR24], [Systemet ska tillåta tidsredovisare att redigera sin inrapporterade tid för innevarande månad.], [1], [2025-02-09],
    [FR21], [Systemet ska vid beräkning av flextid och differens från arbetad tid ta hänsyn till röda dagar, klämdagar samt den anställningsgrad som tidsredovisaren har angett (t.ex. 100%, 90%).], [2], [2025-02-09],
  )
)<funktionella_krav_tabell>

== Icke-funktionella krav

I det här avsnittet beskrivs de icke-funktionella kraven på systemet, de beskriver specifika egenskaper på systemet i sin helhet. I @ickefunktionella_krav_tabell finns de listade tillsammans med prioritering samt datum de bestämdes. 
#figure(
  caption: "Lista över icke-funktionella krav",
  table( // Ändrad av SamuelT, Simon, Jakob
    columns: (auto, 1fr, auto, auto),
      [*ID*],  [*Beskrivning*], [*Prio*], [*Skapad*],
      [NFR1], [Systemets backend ska vara implementerad med ramverket `ASP.NET` och programmeringsspråket `C#`.], [1], [2025-02-09],
      [NFR2], [Systemets frontend ska vara implementerad med ramverket `Svelte` och programmeringsspråket `Typescript`.], [1], [2025-02-25],
      [NFR3], [Systemet ska driftsättas på Linux.], [1], [2025-02-09],
      [NFR4], [Systemet ska uppfylla tillgänglighetskraven enligt EN 301 549 och WCAG 2.1 @ref:EN301549.], [1], [2025-02-09],
      [NFR7], [Systemet ska fungera på webbläsare baserade på Chrome, Safari och Firefox som har släppts efter 2020.], [1], [2025-02-09], // fixat
      [NFR10], [I månadsvyn för administratörer ska rubrikraden vara fixerad i fönstrets överkant när fönstret skrollas.], [1], [2025-02-09],
      [NFR11], [C\#-kod ska följa Microsofts kodkonventioner @ref:csharp_conventions], [1], [2025-03-04],
      [NFR12], [Typescript-kod ska följa Googles kodkonventioner @ref:ts_conventions], [1], [2025-03-04],
      [NFR8], [Systemet ska följa LiU:s grafiska profil, inklusive färger @ref:LiU_grafisk_profil.], [2], [2025-02-09], 
      [NFR9], [Systemet ska ha så få obligatoriska fält som möjligt vid tidredovisning. Om ett startdatum ej anges sätts dagens datum som startdatum], [2], [2025-02-09],

  )
) <ickefunktionella_krav_tabell>

// Isabel 5 mars: jag märkte att NFR5 och NFR6 försvann. Det är bra att NFR5 ersätts av NFR14. Däremot har vi inget sätt att mäta eller se om systemet är "lätt att underhålla", trots att det tekniskt sett är ett krav som kunden vill att vi ska tänka på. Finns det sätt att mäta? Modularitet? Alla funktioner ska ha docstrings som beskriver funktionen? Kommentarer? OBS: NFR6 är med i Arkitekturdokument.
// NFR5 och NFR6 är utbytta mot NFR11 och NFR12

== Kvalitetskrav
För att säkerställa att produkten uppfyller användarnas behov och förväntningar har kvalitetskraven i @ickefunktionella_kval_krav_tabell fastställts.
// Isabel: NFR15 beskrivs inte i fritext. Nämna i texten till rubriken 3.4 att kvalitetskraven mäter prestanda, användbarhet och kvalitet/korrekthet (testningen) och hänvisa till respektive ID. Mitt förslag: 
// Jakob - Ok vi kör på det
Kvalitetskraven mäter prestanda (NFR13), användbarhet (NFR14) och kvalitet (NFR15). //IN 5 mars
#figure(
  caption: "Lista över icke-funktionella krav",
  table( // Ändrad av SamuelT, Simon, Jakob
    columns: (auto,auto, auto, auto),
      [*ID*],  [*Beskrivning*], [*Prio*], [*Skapad*],
      [NFR13], [LCP @ref:LCP ska maximalt vara 2,5 sekund i minst 95 % av fallen.], [1], [2025-02-09],
      [NFR14], [I en SUS-mätning @ref:sus ska systemet ha ett snitt på minst 68 poäng.], [1], [2025-02-09],
      [NFR15], [Minst 95 % av backend-koden ska täckas av automatiserade tester.], [1], [2025-02-09]
    )
  )<ickefunktionella_kval_krav_tabell>



=== Inladdningstid //IN
En indikation på att upplevelsen kommer vara snabb och smidig för användaren, är att mäta prestandan av frontend-koden. Ett sätt att mäta prestandan är genom Largest Contentful Paint (LCP). LCP är en vedertagen mätmetod skapad av Google @ref:LCP som används för att undersöka inladdningstider på webbsidor. LCP mäts i sekunder där högre LCP innebär att det tar längre tid att ladda hemsidan. Målet är att sträva efter LCP på 2,5 sekunder eller lägre i enlighet med standarden @ref:LCP. En tid mellan 2,5 och 4 sekunder innebär att laddningstiderna behöver förbättras och över 4 sekunder räknas som dålig prestanda. 

#pagebreak() 

=== Användbarhet
SUS (_System Usability Scale_) är en skala som mäter användbarhet på system. Den baseras på tio påståenden som användare ska ranka från ett till fem efter de använt en webbsida. En femma innebär att de håller med helt och hållet, medan en etta innebär att de verkligen inte håller med @ref:sus.

Baserat på användarnas svar beräknas en slutpoäng. För udda numrerade frågor subtraheras ett från poängen, medan jämnt numrerade frågor beräknas genom att ta fem minus poängen. Detta beror på att udda frågor är positiva påståenden till skillnad på jämna som är negativa påståenden. Justeringen resulterar i att alla frågor får en poäng mellan noll och fyra. Slutligen summeras de justerade värden och summan multipliceras med 2,5 @ref:sus. 

Resultatet ger en bra indikation på systemets användbarhet, där ett högre poäng indikerar bättre användbarhet. En poäng på 51 eller lägre tyder på dålig användbarhet och bör åtgärdas omedelbart. En poäng runt 68 anses vara acceptabel, men det finns utrymme för förbättring. En poäng på 80,3 eller högre indikerar en mycket bra användbarhet @ref:sus.

=== Kvalitet
Automatiserade tester innebär att systemet kontinuerligt testas med hjälp av fördefinierade testfall som körs automatiskt utan manuell inblandning. Dessa tester säkerställer att backend-koden fungerar enligt specifikation och underlättar identifiering av fel tidigt i utvecklingsprocessen. Testtäckning är ett mått som anger hur stor andel av koden som kontrolleras av dessa tester. En hög täckningsgrad minskar risken för buggar och felaktigheter vid framtida kodändringar. Målet är att ha minst 95 % av backend-koden täckt av automatiserade tester, vilket säkerställer hög kodkvalitet och pålitlighet. Lägre testtäckning än så ökar risken för oupptäckta problem och kan leda till försämrad användarupplevelse.
