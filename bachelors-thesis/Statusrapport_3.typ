#let details = (
  title: "Statusrapport 3",
  history: (
    "0.1",
    "2025-04-13",
    "Färdigställt",
    "S.Åk",
    "I.N",
  ),
)
#import "style.typ": *
#show: style.with(details)

#show heading: it => it.body // Rubriker hamnar på samma sida
#set par(justify: true)


= Projektöversikt

// copy paste från statusrapport 2 delvis
Kandidatgruppen PUM2 har fått i uppgift att skapa ett tidsredovisningssystem för Digitaliseringsavdelningen (DIGIT) på Linköpings universitet. Gruppen skriver ett kandidatarbete tillsammans och ska vardera lägga ner 400 timmar på kursen. Under denna period genomförs realiseringsfasen och just nu befinner vi oss i mitten av den. Projektgruppen har fortfarande en uppdelning i två grupper (frontend och backend) men det är vissa nyckelpersoner i varje grupp som säkerställer att kommunikationen mellan systemets två delar fungerar korrekt. Denna statusrapport handlar om arbetet som har genomförts sedan Statusrapport 2, vilket främst innefattar vecka 14-15 eftersom vecka 12-13 var tenta-p. 

= Målsättningar

// Text från "Nästa steg" i Statusrapport 2
I realiseringsfasen tas projektets slutresultat fram genom att tidsredovisningssystemet utvecklas till en färdig produkt. Funktioner som kommer implementeras under perioden är interaktion med hemsidan, funktioner kopplat till användare och tidsrapportering, autentisering och filhantering.

Målet denna period har varit att färdigställa hemsidans design, implementera funktioner och koppla samman hemsidan med servern och databasen. Målet var också att genomföra gedigen funktionstestning och användartestning. Det sista målet har vi inte uppnått. Anledningen till att testningen inte har genomförts är på grund av att integrationen mellan frontend och backend har tagit längre tid än förväntat. Den huvudsakliga processen Scrum har fortsatt utvecklas och förbättrats under denna period. // Vi har tyvärr inte påbörjat enhetstestning. Inga tester överhuvudtaget har påbörjats i backend [Samuel Åkesson] 
// Isabel: Tog bort enhetstestningen

= Problem och åtgärder

Under en sprint-reflektion framkom det att produktägarna och teamet ofta har överskattat teamets kapacitet och underskattat uppgifternas tidsåtgång. Det har resulterat i att max 60% av uppgifterna blir färdiga inom sprinten. För att motverka detta har produktägarna säkerställt att uppgifterna är specifika och tydliga, och även selektivt valt ut de viktigaste uppgifterna att genomföra i sprinten. Ytterligare en förändring som har genomförts är att öka sprinten från en vecka till två veckor.

Den främsta utmaningen som har funnits i detta projektarbete handlar om kommunikation mellan gruppens medlemmar. I och med att projektgruppen tidigt delades upp i två separata team med olika fokusområden (frontend och backend), har detta resulterat i kommunikationsproblem och missförstånd mellan teamen. I början av projektet märktes detta inte av då båda teamen fokuserade på att lära sig sina områden och planera arbetet, men efter vecka 12 har det blivit ett större problem. Under denna period när integration är viktigt har det uppstått oklarheter och missförstånd mellan vad det ena teamet förväntade sig av det andra teamet, och vice versa. Åtgärden som har implementerats för att motverka missförstånd är att införa möten mellan nyckelpersoner i båda team, däribland frontend- och backendutvecklingsledaren, vilket har skapat en möjlighet att diskutera, förklara och ta sig vidare med beslut. Det har även etablerats en nytt arbetssätt med mål att säkerställa att backend-teamet vet vad frontend-teamet behöver för information från databasen till hemsidan. Detta sker i form av ett gemensamt dokument där varje part noterar informationen som behövs. // Vad är den nya kommunikationskanalen? [Samuel Åkesson]
// Isabel: förtydligat att det gäller ett gemensamt dokument

Ytterligare ett fortsatt problem är kontakt med kunden för att få tillgång till autentisering (OAuth) med LiU-ID. En åtgärd för detta är att skapa ett enkelt temporärt inloggningssystem som möjliggör fortsatt utveckling av produkten utan att behöva tillgång till informationen från LiU. 

Ett till problem som har uppstått är att den initiala tidplanen inte längre stämmer. Vissa milstolpar har tagit längre tid att implementera än väntat, till exempel autentisering och inloggning med LiU-ID. Lösningen på detta problem har varit att uppdatera tidplanen och arbeta på andra milstolpar. 

= Nästa steg

I resten av realiseringsfasen kommer produktens funktioner implementeras och testas. Testningen gäller både enhetstester och integrationstester men också användartester. 
Dessa kommer säkerställa korrekthet i koden och bidra till högre kvalitet på produkten. Kandidatrapporten kommer arbetas på och förbättras efter opponeringen på halvtidsseminariet. // Bra! [Samuel Åkesson]