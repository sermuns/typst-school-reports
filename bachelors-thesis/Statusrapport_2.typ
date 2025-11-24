#let details = (
  title: "Statusrapport 2",
  date: "2025-03-12",
  group: "PUM02",
  version: "0.1",
       history: (
    "0.1",
    "2025-03-12",
    "Färdigställt",
    " A.A ",
    "I.N, A.T",
  ),
)
#import "style.typ": *
#show: style.with(details)

#show heading: it => it.body // Rubriker hamnar på samma sida


//Alice 12/3 feedback: Bra jobbat! Jag tycker ni har gjort ett bra jobb med texten och ny tar upp "summan av kardemumman" av de vi gjort! Jag har en del kommentarer här och där (som vanligt haha) och fixat nåt litet stavfel. 


//Alice 12/3 feedback: "Utfärdat av" Ska väll vara båda två (Isabel och Anton) samt era initialer istället för namn? (FIXAT)
// Har också ändrat presens (olika mellan är och var på vissa ställen)
//Alice 12/3 feedback: Iom att vi använder definitioner från defdokumentet kanske det ska refereras?

= Projektöversikt 

// Copy paste från statusrapport 1
Kandidatgruppen PUM2 har fått i uppgift att skapa ett tidsredovisningssystem för Digitaliseringsavdelningen (DIGIT) på Linköpings universitet. Gruppen skriver ett kandidatarbete tillsammans och ska vardera lägga ner 400 timmar på kursen. Statusrapport 1 handlade främst om planeringsfasen i projektet, och nu har vi gått över till etableringsfasen. Projektgruppen delade upp sig i två grupper med olika inriktningar; frontend och backend. Denna statusrapport handlar om arbetet som har genomförts under vecka 9-11. 


= Målsättningar

Syftet med projektets etableringsfas var att förbereda för realiseringen av produkten. Etableringsfasen hade flera mål: dokumentskrivande, produktdesign och interna utbildningar.
Dessutom konfigurerades en utvecklingsmiljö för att gruppmedlemmar i realiseringsfasen direkt skulle kunna sätta igång med utvecklingsarbetet. Feedback från dokumentinlämning 1 åtgärdades, och arkitekturdokumentet och testplanen färdigställdes under denna period. En första halva av kandidatrapporten skapades inför dokumentinlämning 2. 

//Alice 12/3 feedback: Ena gången nämns målet och nu nämns flera mål. Är det att målet brytes ner till flera delmål? Förtydliga gärna:) (FIXAT)

////Alice 12/3 feedback: Arkitekturdok och testplan näms som dokument uppe, men inte kandidaten. Varför är kandidaten här men inte i texten och vise versa för akr/testplan...?
//Alice 12/3 feedback: Dokument för dokumentinlämning 2 känner sig exluderade från tabellen Speciellt då denna vecka (11)har så stort dokumentfokus.
// FIXAT: tog bort tabellen helt, flyttat in information som enbart fanns med i tabellen till första stycket i Målsättningar

// Beskriv först målen
I målet för produktdesign ingår mindre delmål i form av design av generell arkitektur, hemsida och databas. //Alice 12/3 feedback:Ok... men dessa mål finns inte i tabellen som visar vilka mål vi hade per vecka? Om det är generella mål kanske man bara kan nämna att det är generella och att man sedan bröt ner mål till delmål som finns i tabellen? (FIXAT)
I arkitekturen ingår även kommunikationen mellan frontend och backend. Hemsidans design har skapats för mobilvy och datorvy i ett designverktyg. Vissa vyer har även börjat implementeras i kod. I slutet av perioden har användarflödestester genomförts där resten av kandidatgruppen har testat mobilvy-designen och gett feedback. Målet var att implementera hela frontend-designen under vecka 11, men vi märkte att det uppstod tidsbrist mot slutet av perioden och flyttade därmed fram deadlinen till några veckor senare.

//Alice 12/3 feedback: Detta har vi ju iof inte gjort än. Har vi spec ceadline? Kanske ska nämna den så vi visar att vi har koll på läget. Ist för difust?
// ^ VÄNTAR PÅ SVAR ^
 
Under denna period har 3 formella interna utbildningar genomförts: frontend, backend och konfiguration. Workshoppen genomfördes av flera gruppmeldemmar med goda kunskaper i respektive område. Utbildning i form av workshop hade fördelen att medlemmarna lärde sig genom att applicera sina kunskaper. På frontend-workshoppen fick medlemmarna bekanta sig med ramverket Svelte. Konfiguration och backend kombinerades till en workshop, som inkluderade konfiguration och installation av språk och ramverk som krävdes för att arbeta i backend. Dessa språk inkluderade språket C\# och ramverket .NET. Därefter skulle medlemmarna individuellt skapa en koppling mellan backendservern och frontendservern genom att skriva kod som skickar en GET- och POST-request. Vi har även lärt oss om vår huvudsakliga process, Scrum, och gjort det till en del av vårt dagliga arbete. 

//Alice 12/3 feedback: Lite otydligt om en medlem höll alla workshops. (FIXAT)

// Beskriv sedan hur väl vi har uppnått målen 
Till stor del har målen uppfyllts, men på vissa håll har vi stött på en del utmaningar.
Utbildningar har fungerat bra då man delar med sig av sina kunskaper till andra i gruppen.
Under den kombinerade konfiguration- och backendworkshoppen fick gruppmedlemmarna god kunskap i vilken typ av miljö som skulle användas för att lättare arbeta med projektet.
Frontendworkshopen gav en bra grund till när frontendgruppen senare satt och mobbprogrammerade under initieringen av frontendmiljön.

= Risker och åtgärder

Vi har stött på en del utmaningar under etableringsfasen. De flesta är kopplade till vår planering och våra workshops. Dessa utmaningar har hanterats genom att hitta alternativa lösningar för att i framtiden undvika att hamna i samma situation.

Ett exempel på en sådan lösning är hur vi hanterade konfiguration- och backendworkshoppen. Den var, i jämförelse med frontendworkshoppen, väldigt teoritung och krävde en del förberedelser vilket bidrog till att tiden flög iväg och att det inte fanns något tydligt resultat av vad som gjorts under passet. Då alla instruktioner och material fanns tillgängligt online kunde man fortsätta hemma på distans för att slutföra workshoppen. 

Vi kunde även se att variationen bland operativsystem hos gruppmedlemmarna ledde till att konfigurationen av Docker blev onödigt komplicerat.
Konfigurationsansvarig beslutade att inte använda Docker och istället låta varje gruppmedlem installera verktygen lokalt, vilket förenklade konfigurationen.

En utmaning med vår planering uppstod när vi började använda oss av Scrum. Under denna period har vi genomfört två iterationer (sprintar) på en vecka vardera. Vi var väldigt ambitiösa med vår planering och vi satte upp stora mål som inte var speciellt konkreta. Det ledde till att det var svårt att jobba med Kanbanbrädet som användes under sprinten. Resultatet av reflektionsformuläret visade att gruppen hade olika uppfattning av sprinten men vi nådde konsensus över att måluppfyllnad och kommunikation var bristfällig.

Ett av de största problemen som uppstod resulterade i att det tog längre tid att börja implementera. Vi hade inte rätt behörighet att komma igång med ett gemensamt repo i DevOps, på grund av bristande kommunikation med kunden. Detta ledde till att gruppen arbetade runt detta genom att skapa två temporära repon för frontend och backend för att ändå ha tillgång till den värdefulla versionshanteringen och samarbetet.


Vi accepterade att sprintens utfall för iteration 1 inte motsvarade förväntningarna och på iteration 2 delades därför alla större uppgifter till små specifika deluppgifter. Varje deluppgift tilldelades en ansvarig gruppmedlem som skulle se till att den utfördes under sprinten. En del uppgifter med låg prioritet som inte genomfördes under iteration 1 flyttades till iteration 2. // FIXAT: jag har i princip omformulerat hela stycket
//Alice 12/3 feedback: Uppskjutna, menar ni denna sprint eller den förra sprinten?

Den bristande kommunikationen kan ses som ett resultat av att projektgruppen delade upp sig. Detta ledde till att kunskapen om den andra gruppens utveckling blev lidande. Problemet uppmärksammades på sprintmötet och ledde till att ett möte mellan representanter från båda grupper bokades för att förtydliga vilken data som ska skickas mellan frontend och backend.


//Alice 12/3 feedback: Kanske nämna att bland den största problemet vi hade var att vi inte fick behörighet att komma igång på devops pga bristande kommunikation och att vi behövde jobba oss runt det.- För att kunna komma igång med implementering.  // FIXAT

= Nästa steg

Som tidigare nämnt är nästa steg att inleda projektets realiseringsfas. Under realiseringsfasen tas projektets slutresultat fram genom att tidsredovisningssystemet utvecklas till en färdig produkt. Funktioner som kommer implementeras under perioden är interaktion med hemsidan, funktioner kopplat till användare och tid, autentisering och filhantering. 

Parallellt med utvecklingsprocessen dokumenteras lärdomar och resultat i kandidatrapporten. Kandidatrapporten har även ett stort fokus på processer i projektet som har analyserats, förändrats och förbättrats. Ett agilt arbetssätt genom Scrum kommer fortsätta användas genom resten av projektet. När produkten utvecklas kommer även testning genomföras parallellt för att säkerställa korrekthet och bidra till högre kvalitet på produkten. 