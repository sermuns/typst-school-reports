  #let details = (
  title: "Testplan",
  group: "PUM02",
  history: (
    "2.0",
    "2025-04-14",
    "Ändring efter intern feedback",
    "S.Åk, I.N",
    "A.T, A.B",
    
    "1.1",
    "2025-03-30",
    "Åtgärdat extern feedback",
    "A.A",
    "A.T, S.Åk",
    
    "1.0",
    "2025-03-11",
    "Åtgärdat intern feedback",
    "J.T",
    "A.T",

    "0.3",
    "2025-03-06",
    "Åtgärdat intern feedback",
    "A.A",
    "A.T",

    "0.2",
    "2025-03-04",
    "Åtgärdat intern feedback",
    "A.A, S.Ås",
    "A.T, S.Åk",
    
    "0.1",
    "2025-02-21",
    "Skapats",
    "A.A, A.B, I.N, S.T, S.Åk, S.Ås",
    "A.T",
  ),
)
#import "style.typ": style
#show: style.with(details)


#bibliography("references.bib", title: "Referenser")

= Introduktion 
Testplanen beskriver de strategier och metoder för testning som ska utföras på den beställda produkten och dess tillhörande system. Dokumentet kommer uppdateras kontinuerligt under projektets gång i takt med ändringar av krav, planering och projektspecifika beslut.


== Bakgrund
Målet med projektet är att skapa en produkt åt Digitaliseringsavdelningen (DIGIT) på Linköpings Universitet. De har beställt ett tidsredovisningssystem för sina anställda. Mer information om projektet hittas i _projektplanen_ @ref:projektplan. 

== Syfte
Syftet med testplanen är att ge projektgruppen ett underlag för hur testerna ska utföras, vad som ska testas och vem som har ansvar för de olika testerna. Syftet med testerna är att säkerställa produktens funktionalitet och användarbehov enligt _kravspecifikationen_ @ref:kravspecifikation. 
  

== Mål
Målet med testerna är att kunna lämna över en produkt till beställaren som följer de krav som definierats i _kravspecifikationen_ @ref:kravspecifikation.


== Målgrupp
Testplanen riktar sig till utvecklare, testare, testledare och andra intressenter som är involverade i testningsprocessen.

== Definitioner, akronymer och förkortningar
Förklaringar till de förkortningar, definitioner och akronymer som används i det här dokumentet finns i projektets _begreppslista_ @ref:begreppslista.

= Testobjekt

Följande är en lista över systemkomponenter och dokument som ska testas i detta projekt:

#[
  #set enum(numbering: "A)")
  + Tidsredovisningssystemets frontend, Version 1.0
Utvecklat i Svelte 5 @ref:svelte med TypeScript @ref:typescript. Funktioner som ska testas inkluderar:
- Inloggning och autentisering
- Redovisning av arbetstid
- Skapa och redigera uppgifter
- Import och export av .csv-filer med redovisad tid 
]

#[
  #set enum(numbering: "A)", start: 2)
+ Tidsredovisningssystemets backend, Version 1.0 
Utvecklat i ASP.NET @ref:asp.net med C\# @ref:Csharp_documentation. Backend ansvarar för datalagring och logik. Funktioner som ska testas inkluderar:
- Att autentiseringen fungerar
- Att varje ändpunkt tar emot och skickar den data som förväntas
- Sortering av uppgiftslistor
- Integration med LiU-API
]

#[
  #set enum(numbering: "A)", start: 3)
+ Användartester, Version 1.0
Scenariobaserade tester utifrån följande användarhistorier @ref:TDDC88:
- Som en användare vill jag kunna:
  - logga in och identifiera mig för att få tillgång till systemet och relevanta funktioner för min roll. 
  - exportera en rapport som .csv-fil för att spara ner och arbeta med lokalt.
  - använda systemet på både en dator och en mobil för att inte begränsa min användning av systemet när jag ska använda det.
- Som en tidsredovisare vill jag kunna:
  - se, lägga till och redigera tider som jag arbetat på en uppgift.
  - exportera en mall, som jag kan fylla i mina arbetstider i för att externt kunna jobba med min tidsredovisning, och sedan importera den till systemet för att redovisa tider. 
  - söka och filtrera bland uppgifter samt favorisera de uppgifter som är mest relevanta för mig för tillfället. 
  - se statistik över hur många timmar som jag jobbat och hur mycket flextid jag har för att veta hur jag ska planera mitt arbete.
- Som en administratör vill jag kunna: 
  - skapa och redigera uppgifter samt tilldela dem till tidsredovisare.
  - skapa rapporter över hur tidsredovisare jobbat och hur mycket tid som redovisats till en uppgift. 
- Som en utvecklare vill jag kunna:
  - läsa koden och förstå hur den är strukturerad för att enkelt bygga ut det befintliga systemet. 
]

#[
  #set enum(numbering: "A)", start: 4)
+ Projektets _kravspecifikation_ @ref:kravspecifikation, Version 1.1
_Kravspecifikationen_ specificerar samtliga funktionella, icke-funktionella och kvalitetskrav och står till grund för att verifiera att funktionerna uppfylls. 
] 

= Testomfattning 
Testomfattningen beskriver de funktioner i systemet som ska eller inte ska testas.

== Funktioner som ska testas
#[
  #set enum(numbering: "A)")
+ Inloggning och autentisering 

+ Redovisning av arbetstider

+ Importering av arbetstider från .csv-fil

+ Redigering av redovisade arbetstider

+ Visning av redovisade arbetstider

+ Skapande av uppgifter

+ Redigering av uppgifter

+ Sökning och filtrering av uppgifter

+ Favorisering av uppgifter

+ Skapande av rapporter

+ Exportering av rapporter till .csv-fil

+ Sökning och filtrering av rapporter

+ Statistikgenerering

+ Responsivitet och tillgänglighet

+ Felhantering
]

== Funktioner som inte ska testas
#[
  #set enum(numbering: "A)")
+ Användargränssnittets kompatibilitet med äldre versioner av webbläsare innan år 2020
]

= Teststrategi
Testerna kommer utföras med två tillvägagångssätt under utvecklingen. Det ena tillvägagångssättet är genom manuella tester, script eller testfiler som exekveras i _Azure Pipeline_ @ref:azure-pipelines. Testfilerna är lokaliserade i samma mapp som den fil som ska testas. Det andra tillvägagångssättet är genom enkäter och användningstester.

== Testnivåer
De olika _testnivåerna_ @ref:TDDC88 som testningen ska fokusera på är: 

- *Enhetstester* 
Syftet med enhetstesterna är att testa enskilda funktioner i koden. Målet är att backendkoden ska ha en kodtäckning på 95%, enligt _kravspecifikationen_ @ref:kravspecifikation. Enhetstester skrivs för varje backendfunktion och placeras i tillhörande testfil. Testfallen utgår ifrån en funktion som implementerats i koden och ska träffa alla delar av koden för att testerna ska ha så stor kodtäckning som möjligt. På denna testnivå utförs även kodkvalitetstester för att säkerställa att koden är läsbar och följer de kodkonventioner och formatering som bestämts.

- *Integrationstester*
Syftet med integrationstesterna är att säkerställa att de fåtal komponenter i backend som direkt interagerar med varandra, fungerar tillsammans. Integrationstester ska skrivas där backendfunktioner anropar varandra.

- *Systemtester* 
Systemtesterna är manuella tester som utförs av testarna för att säkerställa att alla systemfunktioner är testade. Testarna utför uppgifter baserade på de användarscenarion som tagits fram i _kravspecifikationen_ @ref:kravspecifikation. Efter att testerna är utförda ska testarna svara på en _SUS-enkät_ @ref:sus som ger ett underlag för hur systemet var att använda. Målet är att ha ett snitt på minst 68 i SUS-betyg. På denna testnivå utförs även prestandatester för att säkerställa systemets respons och stabilitet under beslastning. Målet är att LCP @ref:LCP ska maximalt vara 2,5 sekunder i minst 95 % av fallen.

- *Acceptanstester* 
Syftet med acceptanstesterna är att kontrollera att systemet fungerar enligt användarnas behov. De utförs av kunden vid sluttestningen innan överlämningen av produkten för att säkerställa att _kravspecifikationen_ @ref:kravspecifikation är uppfylld.


== Testverktyg

- *xUnit:* För att testa backend används ett externt testbibliotek _xUnit_ @ref:xunit. @enhetstestbackend visar hur xUnit ska användas i en testfil för att testa en funktion. Genom att köra funktionen och jämföra det med ett förväntat resultat så kan xUnit avgöra om funktionen fungerar som den ska. 

#figure(
  caption: "Mall för enhetstester i C# med xUnit",
  kind: "figure",
  supplement: [Figur],
  rect(
    width: 80%,
    inset: (left: 1em)
  )[
#set align(left)
```cs
// Sum.cs
public class Fun
{
    public static int Sum(int a, int b)
    {
        return a + b;
    }
}

// SumTest.cs
using Xunit;

public class SumTests
{
    [Fact]
    public void Add_1_And_2_ShouldEqual_3()
    {
        // Arrange
        int varA = 1;
        int varB = 2;

        // Act
        int res = Sum.Sum(varA, varB);

        // Assert
        Assert.Equal(3, res);
    }
}
```
]

)<enhetstestbackend>

- *Lighthouse:* För att mäta systemets prestanda används Lighthouse, vilket är ett sätt att automatiskt samla in så kallade _Web Vitals_ @ref:webvitals på en webbapplikation. Mer specifikt används verktyget `lighthouse-ci` @ref:lighthouse-ci så att det körs vid varje pushad commit i en _Azure Pipeline_ @ref:azure-pipelines. Den genomför då mätningen tre gånger, sammanställer ett medelvärde och laddar till sist upp mätdatan för den aktuella commit:en. På så vis kan alla mätvärden spåras över tid.

- För att testa kodens kvalitet används följande verktyg:
  - *ESLint:* För att hålla koden ren och konsekvent används _ESLint_ @ref:eslint. Det är ett verktyg framtaget för TypeScript som varnar för buggar och fel i kodstil. 
  - *svelte-check:* Likt ESLint så utför _svelte-check_ @ref:svelte-check en kontroll så att det inte sker kompileringsfel, att alla variabler används och att sveltekomponenter används korrekt.

  ESLint och svelte-check körs som en _Azure Pipeline_ @ref:azure-pipelines men kan även utföras av utvecklarna i samband med att man slår ihop två utvecklingsgrenar i Azure DevOps. För att genomföra detta manuellt skrivs de kommandon som syns i @npmrun.

#figure(
  caption: "Manuellt test av kodkvalitet i frontend",
  kind: "figure",
  supplement: [Figur],
  rect(width: 80%,
  [
    #set align(left)
    #pad(left: 3%, 
    ```bash
    npm run format
    npm run check
    npm run lint
    ```
  )])
)<npmrun>

- *SUS-enkät:* Efter testerna är klara svarar testpersonerna på en _SUS-enkät_ @ref:sus som innehåller följande frågor:
  #[
  + Jag tror att jag skulle vilja använda denna produkt ofta.
  + Jag tyckte att denna produkt var onödigt komplicerad.
  + Jag tyckte att denna produkt var lätt att använda.  
  + Jag tror att jag kommer behöva hjälp av en teknisk person för att kunna använda denna produkt.
  + Jag tyckte att det var för mycket inkonsekvens i produkten.
  + Jag kan tänka mig att de flesta skulle lära sig att använda denna produkt mycket snabbt.
  + Jag tyckte att denna produkt var mycket besvärlig att använda.
  + Jag kände mig väldigt trygg när jag använde denna produkt.
  + Jag behövde lära mig mycket innan jag kunde komma igång med denna produkt.
  ]

  Varje test är viktat med @SUS-score och resulterar i ett betyg på skalan 1-100.

  #set math.equation(numbering: "(1)")
  $ "SUS-betyg" =2.5 dot (20 + "summan av udda frågor" - "summan av jämna frågor") $ <SUS-score>

= Riskanalys
== Risker

Följande är en lista över de risker som kan påverka resultatet eller omfattningen av de tester som utförs:

#[
  #set enum(numbering: "A)")
  
+ Försenad integration mellan backend och frontend kan leda till att testningen skjuts upp och enbart görs på en temporär databas kopplad direkt till frontendservern. Dessa tester riskerar att göras i onödan om viss logik som skrivs på frontendservern ska migreras till backendservern.

+ Försenad integration med LiU:s API kan leda till att fiktiv data används för långt in i projektets implementation och resultera i att koden förlitar sig för mycket på dess struktur.


+ Tidsbrist kan leda till att inte tillräckligt många tester utförs och att projektet då inte håller _kravspecifikationens_ @ref:kravspecifikation kvalitetskrav.

+ Testerna har inte en tillräckligt stor kodtäckning. 

+ Ändrade krav från kunden kan påverka planeringen och riskerar att tester behöver skrivas om. 
]

== Riskhantering
#[
  #set enum(numbering: "A)")
  
+ Tydlig kommunikation mellan utvecklarna är viktig för att backend ska ha samma ändpunkter som frontend förväntar sig. På så sätt behöver inte testkoden för klienten skrivas om. 

+ Att fokusera på den implementering där utvecklarna inte är begränsade är att prioritera för att kunna börja testa tidigt. 

+ Tidsbristen kan undvikas genom att testmoment ingår i varje sprint. I sprintplaneringen ska det förtydligas vad som ska testas, vilka som ska testa och när testningen ska utföras så att det inte blir någon felkommunikation.

+ Genom att köra _Azure Pipeline_ @ref:azure-pipelines genereras en sammanfattning om hur mycket av koden som blev körd. 

+ Ändrade krav från kunden kan påverka planeringen och riskerar att tester behöver skrivas om. 
]

  
= Testkriterier
Innan projektet är avslutat så måste godkännande- och överlämningskriterier vara uppfyllda för att säkerställa att systemet är färdigt att använda och uppfyller alla ställda krav.

== Godkännandekriterier
För att sluttestningen ska kunna godkännas måste alla testnivåer ha genomförts enligt testplanen. Detta innebär att alla testfall ska ha körts och alla kritiska buggar och fel som identifierats under tester ska ha åtgärdats.

== Överlämningskriterier
För att produkten ska kunna överlämnas måste följande kriterier vara uppfyllda: 
- Tester ska ha utförts som bekräftar att produkten uppfyller de krav ifrån _kravspecifikationen_ @ref:kravspecifikation som har prioritet 1. 
- Beställaren måste ha godkänt acceptanstesterna och att systemet uppfyller deras behov. 
- Systemet ska vara redo för driftsättning.

= Testartefakter
- Tester rapporteras löpande i en testrapport. Testrapporten innehåller en beskrivning av aktiviteterna, resultatet, de olika avvikelserna i testet och en utvärdering av varje aktivitet. Under projektgruppsmöten används testrapporten för att planera testerna för nästa sprint.

- Resultatet av svaren från _SUS-enkäten_ @ref:sus som fylls i efter systemtesterna sparas ner i ett kalkylark och används till grund för utveckling av designen.

= Miljöbehov
Följande element krävs för att genomföra testerna:

- En dator med en webbläsare som stöds enligt krav NFR7 i _kravspecifikationen_ @ref:kravspecifikation.

- _.NET SDK_ @ref:dotnet måste vara installerat för att köra backendtesterna.

- _Node.js_ @ref:node måste vara installerat för att köra frontendtesterna.

- _Lighthouse_ @ref:lighthouse-ci måste vara installerat för att köra prestandatesterna.

= Roller och ansvar <roller-och-ansvar>
Projektgruppen har olika roller och ansvarsområden. Kapitlet beskriver rollerna och vilket ansvar som medföljer varje roll.

== Testroller

- *Testledare (TL):* Planerar, koordinerar testning och säkerställer testutförande.

- *Utvecklare (U):* Projektmedlem som utvecklar kod i projektet.

- *Testare (T):* Utvecklare inom projektgruppen som testar annan utvecklares kod.

- *Slutanvändare (Kund):* Beställaren av produkten.

== Ansvar 
De olika rollerna utför tester inriktade på olika testnivåer där de även är ansvariga för att testerna utförs. Ansvarsområdena för varje roll kan läsas av i @ansvarsområden.
#figure(
  caption: "Ansvarsområden",
  table(
    columns: (6fr, 1fr, 1fr, 1fr, 1fr),
    align: horizon,
    table.header([Ansvar],                  [TL], [U],  [T],  [Kund]),
     [Enhetstester],                        [],  [X],  [X],  [],
     [Integrationstester],                  [],  [X],  [X],  [],
     [Systemtester],                        [],  [],   [X],  [],
     [Acceptanstester],                     [],   [],   [X],  [X],
     [Rapportering],                        [X],  [],   [X],  [],
     [Dokumentation],                       [X],  [],   [X],   [],
     [Godkännande av godkännandekriterier], [X],  [],   [],   [X],
     [Godkännande av avslutskriterier],     [X],  [],   [],   [X],
  )
)<ansvarsområden>
