#let details = (
  title: "Projektplan",
  history: (
    "2.1",
    "2025-04-23",
    [
     Omformulera @roller, bryt ut "att".
    ],
    "I.N",
    "A.T",
    "2.0",
    "2025-03-14",
    "Åtgärdat intern feedback",
    "I.N",
    "A.T",
    "1.1",
    "2025-03-11",
    "Åtgärdat handledarens feedback",
    "I.N",
    "A.A, A.T, A.B",
    "1.0",
    "2025-02-21",
    "Skapats",
    "I.N, J.T, S.T, S.Åk, S.G, S.Ås",
    "A.A, A.T, A.B, S.Ås",
  ),
)
#import "style.typ": *
#show: style.with(details)

//--------------------------------INFO------------------------------------
// Exempel på projektplaner:
// - https://www.lysator.liu.se/~kjell-e/kursdokument/pum1/projektplan_v2.2.pdf
// - https://www.ida.liu.se/~TDP003/current/dokument/examples/projektplan_a.pdf
// Rubriker och innehåll från TDDC88
// Fr.o.m idag den 18/2-2025 så heter det UPPGIFT och AKTIVITET




= Projektbeskrivning
// Anton korrigerade 2025-03-03
Det här kapitlet specificerar projektet för att ge en förståelse av vad som skall göras och redogöra varför projektet utförs. 

== Bakgrund
// Skrivet av Stina
Projektet baseras på ett uppdrag från Digitaliseringsavdelningen (DIGIT) på Linköpings universitet. DIGIT består av ungefär 150 medarbetare som ansvarar för nästan all IT vid Linköpings universitet (LiU). I dagsläget används ett egenutvecklat tidsredovisningssystem som är i behov av ny och förbättrad funktionalitet. Systemet används av DIGIT:s medarbetare för att rapportera arbetade timmar på projekt och av administratörer för att ta ut tidsrapporter. 

== Syfte
// Anton korrigerade 2025-03-03
Syftet med projektplanen är att strukturera utförandet av projektet. Projektplanen fokuserar på de resurser, tidsmål och delmål som finns och analyserar riskerna som kan förekomma under projektet. // 

== Mål
// Skrivet av Stina 
Uppgiften är att utveckla ett nytt tidsredovisningssystem som är enkel att driftsätta och underhålla. Systemet ska använda LiU:s inloggningstjänster samt grupper. Beroende på en användares behörighet loggas den in som administratör eller tidsredovisare och får tillgång till relevanta uppgifter. Det ska även finnas möjlighet till övervakning av systemet samt import och export av data. Systemet ska innehålla all funktionalitet som användarna behöver relaterat till tidsredovisning för projekt. Det ska vara användarvänligt och bidra till att förenkla arbetet för LiU:s personal. 
Målet är att planera, designa och verkställa ett projekt mot extern kund. I målet ingår också att praktiskt använda tidigare kunskaper, lära sig nya teknologier och öva på att jobba i ett team. Det ingår även att teamet följer en tidsbudget.

== Definitioner, akronymer och förkortningar
Förklaringar till de förkortningar, definitioner och akronymer som används i det här dokumentet finns i projektets _begreppslista_ @ref:begreppslista.

== Relevanta begränsningar <avsnitt:begränsningar>
Projektet har en tidsbudget på 400 timmar per person. 
Beställaren har inte satt upp en ekonomisk budget för projektgruppen, till följd av detta så kommer projektmedlemmarnas testrelaterade funktioner i Azure DevOps vara begränsade då en uppgraderad licens medför fler utgifter för beställaren.

== Start och slutdatum
Startdatumet för projektet är 20 januari 2025 och slutdatumet är 21 maj 2025 då projektet avslutas med en konferens.




= Organisationsplan
Det här kapitlet beskriver organisationsroller och kompetenser i projektgruppen. 


== Roller och ansvar <roller>
//Alice står för denna del.
Projektgruppen består av nio tredjeårsstudenter vid Linköpings universitet varav fyra medlemmar studerar civilingenjörsutbildningen i Datateknik och fem medlemmar studerar civilingenjörsutbildningen i Mjukvaruteknik. Varje enskild projektmedlem har en specifik roll med tillhörande ansvar. 

=== Teamledare
Ansvarar för att:
- leda och fördela arbetet inom gruppen. 
- målen uppfylls.
- se till så att processer följs.
- det råder god arbetsmiljö.
- agera coach.
- ta det slutgiltiga beslutet om det behövs.
- representera gruppen utåt.
- projektplan skrivs.

=== Analysansvarig
Ansvarar för att:
- hålla kontakten med kunden.
- ta reda på kundens verkliga behov.
- agera förhandlingspart och ger insyn in mot övriga gruppen.
- kraven dokumenteras.
- kraven uppfylls.

=== Arkitekt
Ansvarar för att:
- en stabil arkitektur tas fram.
- identifiera komponenter och gränssnitt.
- ta övergripande teknikval.
- ta det (näst) sista ordet i tekniska frågor om det behövs.
- kunna kommunicera bärande idéer.
- arkitekturen dokumenteras.

=== Dokumentansvarig
Ansvarar för att:
- ta fram dokumentmallar och underhållning av dessa.
- det tas fram en logotyp.
- skapa ändringsrutiner.
- leveranser sker till deadlines.

=== Kvalitetssamordnare 
Ansvarar för att:
- kvalitetsarbete utförs av alla roller.
- ta initiativ- och uppföljningsansvar.
- det sker erfarenhetsfångst.
- utbildning genomförs
- planera och budgetera ihop med övriga gruppen.
- se över hur mycket kvalitet får kosta.
- det skrivs en kvalitetsplan och att denna följs.

=== Konfigurationsansvarig
Ansvarar för att:
- bestämma vad som skall versionshanteras.
- bestämma vilka ändringar som ingår i en utgåva (eng. "release").
- välja och underhålla verktyg för versions- och konfigurationshantering.
- verktygen används på rätt sätt.

=== Testledare
Ansvarar för att:
- besluta om systemets status.
- sköta den dynamiska verifieringen och valideringen av systemet genom exekvering.
- tillsammans med kvalitetssamordnare testa kvalitetskrav.
- hålla viss distans till det man testar.
- en testplan skrivs och att tester rapporteras.

=== Backendutvecklingsledare
Ansvarar för att:
- skapa en detaljerad design.
- leda och fördela utvecklingsarbetet för backend.
- fatta beslut om utvecklingsmiljö.
- organisera utvecklarens tester.

=== Frontendutvecklingsledare
Ansvarar för att:
- skapa en detaljerad design.
- leda och fördela utvecklingsarbetet för frontend.
- fatta beslut om utvecklingsmiljö.
- organisera utvecklarens tester.

== Kunskap och kompetenser
Avsnittet beskriver den kunskap och kompetenser som är nödvändig för ett framgångsrikt projekt, samt den individuella kompetensen som finns inom projektgruppen inför projektet.

=== Dokumentation
Det valda dokumentationsprogrammet Typst är en dokumenthanterare som ger användarna ett synkroniserat arbetsflöde med en textredigeringsinmatning och en visuell representation. Då programmet är nytt för flertalet gruppmedlemmar så krävs en del kunskap om hur samarbete, hantering av dokument, källhänvisning och andra funktioner används. 

=== Frontend
Det finns en bred kunskapsresurs i projektgruppen inom webbprogrammering. Vissa i projektgruppen har även erfarenheter av frontend-utveckling från personliga projekt i samma skala som kandidatprojektet. Det finns potential för utveckling inom det programmeringsspråk som ska användas för frontend, TypeScript, och hur Svelte-ramverket används.

=== Backend
En del av gruppen har erfarenhet av databaser, molnplattformen Azure och Structured Query Language (SQL) från tidigare kurser. Programmeringsspråket C\# används i utvecklingen av produkten, vilket är ett språk som få har erfarenhet av. Det finns däremot erfarenhet av objektorienterad programmering med liknande syntax så att lära sig C\# bör inte vara svårt. Det finns bristande kunskap om hur ramverket ASP.NET fungerar. 

=== Utbildningsplan
- *Typst:* Under projektets gång kommer mer tid att läggas på att skriva dokument. De medlemmar som är kunniga i programmet har gjort en guide för hur Typst ska användas. De har även förberett all formatering för att underlätta processen. 
- *TypeScript och Svelte:* Det finns god erfarenhet inom projektgruppen som resurs för de som inte är fullt lika informerade inom området. Dessa medlemmar kan erbjuda sig att vara ledande vid mobbprogrammering där de som behöver vägledning kan lära sig språket och ramverket. Det har även skapats ett öppet forum för projektmedlemmar att ställa frågor vid problem. Egna studier är förväntade för de medlemmar som känner att de ligger för mycket efter. 
- *C\# och ASP.NET:* Vid etableringsfasen utbildar sig projektmedlemmarna inom dessa genom egenstudier och workshops som har fokus på initiering av system och labbuppgifter framtagna av gruppen. // Anton korrigerade 2025-03-04
- *SQL:* Vid etableringsfasen utbildar sig projektmedlemmarna i SQL genom egenstudier. 
- *Azure och DevOps:* Erfarenheten kring molnplattformar som Azure samt automatisk testning och driftsättningsplattformar som DevOps är inte särskilt djup inom gruppen. För grundläggande utbildning, framförallt inom DevOps, finns medlemmar på DIGIT som resurs. Vidare behöver inte alla i gruppen ha en djup förståelse, därför kan relevanta personer fördjupa sig vidare på egen hand. 
// Anton skrev (slut)


// Anton skrev (start)
= Kommunikation och rapporter
Det här kapitlet beskriver projektgruppens interna och externa kommunikationskanaler samt rutiner för hur frånvarorapportering och mötesändringar utförs.

== Intern kommunikation
Avsnittet beskriver hur projektgruppen kommunicerar med varandra internt.

// Anton skrev (slut)

=== Kommunikation i projektorganisationen 
Interna möten hålls regelbundet minst en gång i veckan och sker främst på plats med möjlighet till online-möten vid behov. Datum och tid för nästa möte bestäms i slutet av varje möte för att säkerställa att så många som möjligt i projektgruppen kan delta.

Tidsrapportering sker individuellt av varje projektmedlem i ett gemensamt kalkylark där tider anges med en noggrannhet på 30 minuter.

// Anton skrev (start)
=== Interna kommunikationskanaler
- *Discord:* Intern kommunikation inom projektgruppen sker i en Discord-server som är uppdelad i olika kanaler baserat på samtalsämne.
- *Telefon:* Vid tillfällen då det är viktigt att få ett svar snabbt kan man kontakta gruppmedlemmar via telefon. 

=== Sjukdoms- och frånvarorapportering 
Medlemmar i projektgruppen ska rapportera vid den tidigaste tidpunkten som de vet att de kommer vara frånvarande, oavsett anledning. Det här görs i den bestämda kommunikationskanalen för gruppmedlemmar. 

=== Ombokning av möten
Om projektgruppen avbokar ett möte så skall det göras via gruppens teamledare eller den som valt att boka mötet.

== Extern kommunikation
Avsnittet beskriver hur projektgruppen kommunicerar med externa parter.
// Anton skrev (slut)

=== Kommunikation mellan projektgruppen och handledare
Endast teamledaren har direktkontakt och rapporterar till handledaren. Kommunikationen vidarebefordras till resterande gruppmedlemmar. Handledarmöten sker på plats veckovis med ett krav på att varje projektmedlem ska delta på minst 75% av dessa möten.

=== Kommunikation mellan projektgruppen och kund/beställare
// Samuel T gjorde miniändringar 11/2
Teamledaren och analysansvarig sköter kontakten med beställaren för att all information ska komma från en enda källa, som sedan lägger fram en plan för projektgruppen. Möten med kund sker då båda parterna anser att det finns ett behov, dessa kan ske online eller på plats. Vid brådskande eller enklare frågor samt för att bestämma mötestider sker kommunikation via mejl.

// Anton skrev (start)

=== Externa kommunikationskanaler
- *E-post:* Generell kommunikation med beställare, handledare, examinator och andra kursrelevanta personer sker via e-post som ska vidarebefordras till hela projektgruppen. 
- *Microsoft Teams:* Dokument och andra filer kommuniceras till handledare, examinator och andra kursrelevanta personer via output-mappen i den gemensamma teamsgruppen.
- *Kundmöte:* För större frågor och förändringar i _kravspecifikationen_ planeras ett kundmöte in. Där deltar teamledaren och analysansvarig. 
- *Handledarmöte:* Ett handledarmöte är schemalagt varje vecka för att få feedback på projektet. Gruppmedlemmar får även möjligheten att ställa frågor och diskutera projektet med handledaren. 
- *Seminarium:* Kommunikation med andra grupper vid presentationer och opponeringar görs på seminarium som är inplanerade i kursen.
// Anton skrev (slut)


// Anton skrev (start)
= Fasplan
Detta kapitel beskriver de faser som projektet går igenom. 

//BP0
== Analys
Under analysfasen ska projektgruppen förbereda sig genom att analysera hur projektet ska se ut, bilda sig en uppfattning om hur slutprodukten ska bli och säkerställa att det går att genomföra projektet så att kundens krav och behov blir uppfyllda. Detta kommer göras genom att ha möten och mejlkonversationer med kunden och genom att skicka ut enkäter till användarna för att få fram en bild av vad som är bristfälligt i det nuvarande systemet. Projektgruppen skriver här även sitt gruppkontrakt.

//BP1

== Planering
Planeringsfasen är till för att realisera projektbilden och upprätta projektplaner. De planeringsdokument som ska skrivas är _projektplanen_ och _kvalitetsplan_. Dessa ska beskriva hela projektets genomförande. En _testplan_ och designdokumenten _systemanatomin_ och _arkitekturdokumentet_ påbörjas för att strukturera upp hur projektet ska utvecklas. 

//BP2

== Genomförandefas
Genomförandefasen går ut på att realisera planer och design som tidigare skapats. Den består i sin tur av en etablering-, realisering- och överlämningsfas.

=== Etablering 
Under etableringsfasen påbörjas genomförandet av projektet och verifiering av att planeringen följs. Medlemmar utbildas i de olika områden som de är osäkra på samt testplan och designdokumenten färdigställs. 

//BP3

=== Realisering
Realiseringsfasen är den fas där projektets slutresultat tas fram. I den här fasen genomförs det som beskrivits i planeringen och implementering av den design som tagits fram i etableringsfasen. 

//BP4

=== Överlämning
Vid start av överlämningsfasen är produkten färdigtestad och all dokumentation är upprättad. Vidare blir kund informerad om hur de använder och underhåller produkten. Projektets slutresultat överlämnas och det säkerställs att allt blir formellt accepterat av kunden. 

//BP5

== Avslutning
// Samuel T förtydligade slutet av andra menignen. 
I avslutningsfasen dokumenteras de olika erfarenheter från projektets gång. Varje medlem ska skriva en individuell erfarenhetssammanfattning och tillsammans skriver gruppen ett gemensamt kandidatarbete.

// Anton skrev (slut)



// Anton skrev (start)

= Tidsplan
Det här kapitlet innehåller en djupgående planering för vad som ska utföras under projektet och hur tiden ska fördelas.

== Milstolpar
@milstolpar innehåller de milstolpar som ska uppnås i projektet. Milstolparna är olika måttstockar som används för att se till att projektet gör framgång. De består av mål som är specifika, mätbara, accepterat, realistiskt och tidsbestämda: så kallade SMART-mål @ref:TDDC88.

#figure(
  caption: "Milstolpar",
  
  table(
    columns: (1fr, 3fr, 2fr, 1fr),
    table.header[*Nummer*][*Milstolpe*][*Beroende*][*Datum*], 
    [M1],[Klar med projektplanering.],[-],[2025-02-21],
    [M2],[Klar med struktur av arkitektur och design.],[M1],[2025-03-14], 
    [M3],[En design för hemsidan är implementerad.],[M2],[2025-03-31], //Ej beroende av M4
    [M4],[Tidsredovisare kan logga in genom LiU-SSO och får behörigheter baserat på sin grupp.],[M2],[2025-03-31],
    [M5],[Administratörer kan skapa en uppgift med namn, aktivitet och starttid samt tilldela grupprättigheter.],[M4],[2025-04-06],//Beroende av M4 att bli men kan påpbörjas innan. 
    [M6],[Tidsredovisare kan söka efter uppgifter.],[M5],[2025-04-11], //Beroende av M5 att skapas.
    [M7],[Tidsredovisare kan rapportera och retroaktivt redigera utfört arbete.],[M6],[2025-04-13],//Beroende av M6 att bli.
    [M8],[Administratörer kan hantera uppgifter och tidsredovisare genom redigering, arkivering och filtrering.],[M5],[2025-04-16], //Beroende av M7 att bli men kan påpbörjas efter M5. 
    [M9],[Tidsredovisare kan exportera en .csv-mall och importera en ifylld .csv-fil.],[M7],[2025-04-18], //Beroende av M7 att bli.
    [M10],[Administratörer kan exportera rapporter i form av en .csv-fil.],[M8],[2025-04-18], //Beroende av M8 att bli. 
    [M11],[Tidsredovisare kan se sin flextid.],[M7],[2025-04-21], // Beroende av M10, -alltså påbörja inte förens M10 och ovan säkerställts
    [M12],[Tidsredovisare kan se en burndown chart.],[M7],[2025-04-23],  // Beroende av M10, -alltså påbörja inte förens M10 och ovan säkerställts
    [M13],[Sluttestning är utförd.],[M10, M12],[2025-04-28], // Beroende av allt
    [M14],[Överlämning av system till kund avklarad],[M13],[2025-05-07], // SKA VARA SIST!! Beroende av allt
  )
) <milstolpar>
// Anton skrev (slut)

// Anton skrev (start)
== Tollgates
@tollgates innehåller projektets tollgates. Tollgates är fördefinierade beslutspunkter vid början eller mellan projektets faser. Vid varje beslutspunkt ska en utvärdering göras för att ta beslut om projektet ska gå vidare till nästa fas eller ändra projektets förutsättningar @ref:TDDC88. 

// Anton korrigerade 2025-03-03
#figure(
  caption: "Beslutspunkter", 
  table(
    columns: (1fr, 4fr, 1fr),
    [*Beslutspunkt*], [*Beskrivning*], [*Datum*], 
    [BP0],[Projektgruppen ska vara formad och projektuppgift är vald. Sker inför analysfasen.],[2025-01-20],
    [BP1],[Version (v. 1.0) av _kravspecifikationen_ är inlämnad. Sker inför planeringsfasen.],[2025-02-21],
    [BP2],[Version (v. 1.0) av _kvalitetsplanen_, _projektplanen_ och _systemanatomin_ är inlämnade. Sker inför etableringsfasen.],[2025-02-21],
    [BP3],[Version (v. 1.0) av _arkitekturdokumentet_ är inlämnat, samt designen för databasen och första utkastet av designen för UI är klar. Sker inför realiseringsfasen.],[2025-03-14],
    [BP4],[Kvaliteten på produkten stämmer enligt kvalitetskraven i _kravspecifikationen_ @ref:kravspecifikation. Sker inför överlämningsfasen.],[2025-04-27],
    [BP5],[Produktens funktioner är accepterade enligt överenskomna krav. Sker inför avslutningsfasen.],[2025-05-04],
  )
) <tollgates>
// Anton skrev (slut)


// Anton skrev (start)
== Leveranser
Avsnittet innehåller projektets olika dokument och deras leveransdeadlines. Inlämning till handledare och examinator sker via output-mappen i Teams-kanalen.

=== Löpande rapportering
- En *veckorapport* ska levereras varje måndag till handledare, examinator och till alla gruppmedlemmar. Den ska innehålla information om föregående vecka, planeringen för nuvarande veckan, resultatet av veckans testning och experiment samt risker som kan förekomma under veckan. Rapporten ska även innehålla en tidrapport som innehåller information projektmedlemmars arbetstider och information om vad som utförts under den tid. 

- En *statusrapport* ska levereras vid varje dokumentinlämning till handledare och examinator. Den ska innehålla en summering av hur projektet ligger till emot målen som är satta samt ge information om vad som saknas och vad som behövs för att nå målen.

=== Dokumentsinlämning 1 (2025-02-21)
- Första versionen av _kravspecifikationen_ (v. 0.1) ska skickas till beställare, handledare och examinator.
- Första versionen av _projektplanen_ (v. 0.1) ska skickas till handledare och examinator.
- Första versionen av _kvalitetsplanen_ (v. 0.1) ska skickas till handledare och examinator.
- *Systemanatomin* ska skickas till handledare och examinator.

=== Dokumentsinlämning 2 (2025-03-14)
- Slutgiltiga versionen av _kravspecifikationen_ (v. 1.0) ska skickas till beställare, handledare och examinator.
- Slutgiltiga versionen av _projektplanen_ (v. 1.0) ska skickas till handledare och examinator.
- Slutgiltiga versionen av _kvalitetsplanen_ (v. 1.0) ska skickas till handledare och examinator.
- Första versionen av _testplanen_ (v. 0.1) ska skickas till handledare och examinator.
- _Arkitekturdokumentet_ ska skickas till handledare och examinator.
- En preliminär rapporthalva av _kandidatarbetet_ ska skickas in till handledare och examinator.

=== Dokumentsinlämning 3 (2025-04-14)
- Slutgiltiga versionen av _testplanen_ (v. 1.0) ska skickas till handledare och examinator.

=== Dokumentsinlämning 4 (2025-05-07)
- Ett fullt _kandidatarbete_ ska skickas till handledare och examinator.
- En _erfarenhetssammanfattning_ ska skickas in till handledare och examinator.


== Aktiviteter
Som tidigare nämnt i @avsnitt:begränsningar har varje person en tidsbudget på 400 timmar, vilket resulterar i att projektet har 3600 timmar att spendera på aktiviteter. @aktiviteter visar aktiviteterna som är planerade under projektet samt deras uppskattade tid.  // Isabel granskning 11 mars: Lade till 400h/person och totalt 3600h 
// Anton skrev (slut)
// Anton ändrade efter feedback från handledare 2025-03-06
#figure(
  caption: "Aktiviteter",
  
  table(
    columns: (1fr, 5fr, 1fr),
    [*ID*], [*Aktivitet*], [*Tid [h]*],
    
    ..darken([*1*],[*Kursrelaterade aktiviteter*],[*1050*]),
    [1.2],[Föreläsningar],[220], //Avrundat summan av allt schemalagt
    [1.2],[Seminarium],[250], //Avrundat summan av allt schemalagt
    [1.3],[Rapportskrivning],[580], // Ville ge ungefär 60h per person men avrundade uppåt för att det skulle bli jämnt ut 3600 h. 
    
    ..darken([*2*],[*Möten*],[*900*]),
    [2.2],[Gruppmöten],[720], //5 h i veckan för 9 personer i 16 veckor
    [2.2],[Handledarmöten],[150], //Avrundar upp från 16*9 = 144
    [2.2],[Kundmöten],[30], //Tanke: Första mötet genererade 18h. Sedan 6h kvar var för teamledare och analysansvarig


    ..darken([*3*],[*Projektplanering*],[*350*]),
    [3.1],[Analys och design],[150],
    [3.2],[Utbildning],[150],
    [3.3],[Testplanering],[50],
    
    ..darken([*4*],[*Design*],[*350*]),
    [4.1],[Designa systemanatomin.],[50],    
    [4.2],[Skriva arkitekturdokumentet.],[100],
    [4.3],[Designa UI.],[200],
    
    ..darken([*5*],[*Frontend*],[*350*]),
    [5.1],[Systemuppsättning och implementation av UI.],[130],
    [5.2],[Implementera administratörsfunktioner.],[120],
    [5.3],[Implementera tidsredovisarfunktioner.],[100],
    
    ..darken([*6*],[*Backend*],[*350*]),
    [6.1], [Systemuppsättning och initiering av databas.],[50],    
    [6.2], [Implementera autentisering och behörighet.],[90],
    [6.3], [Implementera kommunikation med frontend.],[80],
    [6.4], [Implementera uppgifter.],[20],    
    [6.5], [Implementering av sök och filtrering.],[30],
    [6.6], [Implementera redigering av rapporterad tid.],[20],
    [6.7], [Implementering av filhantering och import/export.],[60],

    ..darken([*7*],[*Testning*],[*250*]),
    [7.1],[Enhetstestning],[50],
    [7.2],[Integrationstestning],[50],
    [7.3],[Systemtestning],[50],
    [7.4],[Prestandatestning],[50],
    [7.5],[Acceptanstester],[50],
  )
)<aktiviteter>





== Resurser
//Alice står för denna del.
I @resurser finns de resurser som projektet har tillgång till för att säkerställa en fullbordad produkt.
#figure(
  caption: "Resurser",
  
  table(
    columns: (1fr, 3fr),
    [*Resurs*], [*Beskrivning*],
    [Kursledning],[Vid frågor gällande kursen och projektet kan kursledningen rådfrågas.],
    [DevOps],[Kunden har gett oss möjlighet att konfigurera och integrera vår produkt i DevOps och erbjuder guidning hos dem.],
    [Azure],[Kunden har gett oss möjlighet att ha produktens databas i Azure och erbjuder hjälp att sätta upp denna.],
    [Typst],[Typst är ett gratis dokumentverktyg som används av projektgruppen för bearbetning av officiell dokumentation.],
    [Google Drive],[Google Drive erbjuder ett gratis dokumentverktyg som används av projektgruppen för bearbetning av intern dokumentation, främst gällande för interna mötesprotokoll.],
  )
)<resurser>




// Axel skrev (start)
= Riskhantering

I detta kapitel analyseras de risker som kan uppstå under projektets gång och en strategi för hur de ska hanteras. // SamuelÅ skrev

== Sammanställning av risker
I avsnittet listas ett antal tänkbara risker tillsammans med en beskrivning av dem. 

// https://www.ieeeinsurance.com/content/dam/amba-sites/pdfs/ieee/IEEE_Risk_Management_Guide.pdf 

// Lägg till vad vi ska göra om risken sker
// Fler risker?

//             Generell      Projektspecifik
//Inderekt        GI                PI
//Direkt          GD                PD


- *Dåliga kodrutiner:* Otydlig kodbas, utan tydligt filstruktur och kommentarer, kan göra det svårt att fortsätta underhålla produkten i framtiden. En dålig uppfattning om vilken kod som existerar skapa situationer där samma funktion ligger på olika ställen i koden.

- *Missuppfattningar i teamet om produkten:* Olika uppfattningar inom teamet om vad produkten ska bli, exempelvis hur den ska se ut eller vilka funktioner den ska ha, riskerar att skapa ett resultat som inte följer _kravspecifikationen_ @ref:kravspecifikation.
// Anton korrigerade 2025-03-03

- *Dålig tidsuppskattning:* Under utvecklingen av projektet tar aktiviteter ofta längre tid än förväntat. Om det sker en stor eller många små ackumulerade felberäkningar i varje aktivitets allokerade tid finns risken att produkten vid leverans är inkomplett.

- *Git-konflikter:* När det tar tid mellan git commits så ökar risken för merge-konflikter. Merge-konflikter riskerar att förlänga tiden som läggs på integration och skapar extra arbete.

- *Otillgänglig serverinfrastruktur:* En risk är att servern som används har stora driftstörningar, vilket leder till att utvecklingen av produkten inte kan fortsätta.

- *Feluppskattning av krav:* En inkorrekt uppfattning av kraven och av kundens förväntningar kan orsaka att kunden inte blir nöjd med produkten.

== Riskvärdering
// 3-10 risker, helst projektspecifika och någon teknisk risk
// Anton korrigerade 2025-03-03
Det här avsnittet beskriver i @riskfaktortabell vilken typ av risk de angivna riskerna är. @riskfaktor används för att räkna ut riskfaktorn _R_ för varje risk, där _S_ är sannolikheten att en risk sker och _P_ är magnituden av dess påverkan på projektet. Värderingen av _S_ och _P_ görs på skalan 1-4 @ref:TDDC88.


#set math.equation(numbering: "(1)")
  $ R = S*P $ <riskfaktor>

#linebreak()
  
#figure(
  caption: "Riskfaktortabell",
  
  table(
    columns: (3fr, 2fr, 2em, 2em, 2em),
    table.header[*Riskbeskrivning*][*Typ av risk*][*S*][*P*][*R*],
    [Dåliga kodrutiner],                          [Direkt, Projektspecifik],    [3], [3], [*9*],
    [Missuppfattningar i teamet om produkten],    [Direkt, Projektspecifik],    [2], [4], [*8*],
    [Dålig tidsuppskattning],                     [Direkt, Generell],           [3], [2], [*6*],
    [Git-konflikter],                             [Direkt, Projektspecifik],    [2], [2], [*4*],
    [Otillgänglig serverinfrastruktur],           [Indirekt, Projektspecifik],  [1], [4], [*4*],
    [Feluppskattning av krav],                    [Direkt, Projektspecifik],    [1], [3], [*3*],
  )
)<riskfaktortabell>


#pagebreak()
== Riskhantering
Avsnittet innehåller en beskrivning av olika åtgärder som kommer användas för att förebygga eller hantera riskerna som beskrivits i det här kapitlet. 
// https://www.ieeeinsurance.com/content/dam/amba-sites/pdfs/ieee/IEEE_Risk_Management_Guide.pdf 


//             Generell      Projektspecifik
//Inderekt        GI                PI
//Direkt          GD                PD

// Alice åtgärdat "bör" och "borde" i risker 5 mars

=== Dåliga kodrutiner //PD
En testplan som kräver kommentarer i koden bidrar till skapandet av struktur i kodbasen. Vidare kan konfigurationsansvarig ansvara för att ordna upp en syntax som resterande medlemmar i projektet efterföljer. Slutligen kan rutiner för mobbprogrammering och peer-review minska risken för onödig repetitiv kod. 

Om filstrukturen upptäcks inte följa strukturen som bestämts, exempelvis om en funktion ligger i fel fil eller en fil ligger i fel mapp, ska denne person åtgärda detta genom att flytta allt till rätt plats. Om en funktion saknar en kommentar ska en sådan läggas till av den som upptäcker det, alternativt ska ansvarig person för koden kontaktas, så att hen kan åtgärda kommentaren istället. Om man upptäcker att det ser ut som att samma funktion ligger på flera ställen i kodbasen ska denne diskutera med personerna som skapade funktionerna för att se om de kan kombineras till en.   
// Alice åtgärdat 5 mars

Ytterligare ett sätt som kodkvaliteten hålls uppe är genom att följa de standarder, rutiner och konventioner som beskrivs i avsnitt 2.5 i kvalitetsplanen @ref:kvalitetsplan.
// Alice åtgärdat referens 5 mars

=== Missuppfattningar i teamet om produkten //PD
Genom att lägga tid på utbildning och designprocessen samt arbeta iterativt med krav, design, implementering och testning minskar risken för missförstånd inom gruppen.

Om detta sker ska teamledaren initialisera ett möte med resten av projektgruppen där missuppfattningarna reds ut och arkitekturen över systemet gås igenom. Varje medlem får möjligheten att argumentera för sin uppfattning och gruppen ser över möjligheten att revidera den design som är till grunden för projektet.


=== Dålig tidsuppskattning //GD
För att förebygga risken ska alla aktiviteter vara små och konkreta för att lättare kunna uppskatta tiden. Dessutom kan utvecklingen organiseras så att produkten kontinuerligt säkerställs vara fungerande samtidigt som funktioner läggs till iterativt.  

Om en feluppskattning av tiden sker ska projektgruppen fokusera på _kravspecifikationens_ centrala funktioner, om de inte redan har implementerats. Dessutom ska arbetet fokusera på att utveckla produkten till stabilt stadium, så att en fungerande produkt kan levereras till kunden även om inte alla krav blev implementerade. Vidare ska projektplanen revideras sådan att en ny tidsplan reds ut som anpassar sig till projektgruppens förutsättningar vad gäller tid och resurser. 

=== Git-konflikter  //PD
För att minska risken för merge-konflikter ska konfigurationsansvarig sätta upp tydliga riktlinjer för hur ofta commits ska göras och hur commit-meddelanden ska formuleras. Varje ny funktion i projektet ska utvecklas i en egen branch som först efter testning och godkänd integration slås ihop med main-branchen.

Om merge-konflikter ändå uppstår ska projektgruppen hålla ett möte för att gå igenom och förtydliga Git-rutinerna så att liknande problem undviks i framtiden.

// Nedan är gamla
// Om konfigurationsansvarig sätter upp rutiner för commits angående hur ofta och vad som ska kommuniceras i meddelanden, kan risken för merge-konflikter undvikas. Varje funktion i projektet ska ha en egen branch i git som först efter testning och integrering mergar tillsammans med main-branchen.

// Om detta sker behöver projektgruppen ha ett möte där gruppen går igenom git-rutiner på nytt för att minska risken för att detta sker igen.

=== Otillgänglig serverinfrastruktur  //PI
Detta är en risk som inte kan undvikas, men om det händer kan försök göras för att lösa det lokalt på en egenskapad server för att åtminstone testa koden och fortsätta utvecklingen av produkten i någorlunda utsträckning.

=== Feluppskattning av krav //PD
En _kravspecifikation_ som har granskats och korrigerats av båda parter minskar risken för missförstånd och ökar chansen att kunden blir nöjd.

Om feluppskattning sker måste försök göras för att omförhandla kraven med kunden, alternativt behöver projektgruppen anpassa sig för att uppfylla de krav som är satta.

// Axel skrev (slut)

#bibliography("references.bib")