#let version = "0.2"
#set document(title: "Gruppkontrakt PUM2 v" + version)
#set page(
  margin: 2cm,
  numbering: "1 / 1" 
)
#set text(
  font: "New Computer Modern Sans",
  size: 12pt,
  lang: "sv",
)
#set heading(numbering: "1.")
#show rect: emph
#show raw: it => {
  set text(font: "IBM Plex Mono")
  box(
    fill: luma(200),
    outset: 2pt,
    radius: 2pt,
    it
  )
}

#context{
  set text(2em)
  set par(spacing: 10pt)
  set align(center)
  strong(document.title)
  line(length: 100%)
}

// Typ hela skriven av SamuelÅ och SamuelT

= Bakgrund
Det här är ett kontrakt som upprättas av gruppen PUM2 i kursen TDDD96 år 2025 på Linköpings universitet. Kontraktet skapar en gemensam syn på hur vi ska arbeta tillsammans och vad vi kan förvänta av varandra. Den etablerar också riktlinjer för hur vi ska kommunicera och hantera utmaningar under projektets gång.

= Rutiner <rutiner>
#rect[Hur ofta ska möten hållas? När och var sker möten?]

Gruppen träffas minst en gång i veckan, torsdagar är att föredra. Under planeringsfasen hålls fler möten för att ge möjlighet till diskussion. Medlemmar ska undvika att boka upp schemalagd projekttid. Inför varje vecka kommer en omröstning att skickas ut, där medlemmar kan rösta på tider.

Möten med gruppen delas upp i _frivilliga_ och _generella_. Skillnaden mellan dessa typer av möten är som följer:
- De frivilliga mötena är frivilliga att delta på och är ett tillfälle för gruppmedlemmar att arbeta tillsammans på samma plats. 
- Generella möten ska alla i största möjliga utsträckning delta på så att information som gäller hela gruppen ska kunna delas. Dessutom är generella möten till för att gruppen ska kunna fatta generella beslut som gäller projektet i sin helhet eller stora implementationsdetaljer. 

Möten kommer i allra största utsträckning bokas mellan 08:15-17:00, och undvika lunch. Helger ska också undvikas. Undantag kan göras för generella möten om majoriteten av gruppen går med på det.
  
Möten kommer främst hållas på plats. Hybridmöten, där en del är på distans, går att lösa, men då ska salar som har den möjligheten bokas. Ibland kan korta "standups" hållas digitalt.

Medlemmar förväntas inte arbeta på projektet under kvällar/helger, men om medlemmen individuellt ligger efter i sin tid förväntas den ta ansvar och komma upp i timmarna på lämpligt sätt.


= Frånvaro
#rect[Hur ska gruppen hantera medlemmar som inte närvarar på möten eller inte gör sin del i arbetet.]

Om en medlem riskerar att bli sen till ett möte, ska den meddela gruppen så fort som möjligt med en uppskattad ankomsttid.

Om en medlem blir sen till ett möte påbörjas mötet om möjligt ändå. Vid extremare fall av väldigt sen ankomst eller upprepad sen ankomst får gruppen ha möte om konsekvenser. En konsekvens kan vara att kursens personal kontaktas eller att medlemmen får bjuda gruppen på middag. 

Giltiga anledningar till att inte närvara på ett generellt möte är sjukdom, mental ohälsa, planerad frånvaro (1 vecka förvarning). Det är dock alltid gruppmedlemmens ansvar att kommunicera.

Medlemmar som är frånvarande utan att kommunicera kommer kontaktas av teamledaren. Om det inte hjälper, kommer kursens personal blandas in.

Det finns inga bra svepskäl för att inte ha gjort det man bestämt mellan möten, men mycket går att lösa när man kommunicerar och visar öppenhet inför gruppen.
  
Frånvaro ska kompenseras genom att ta igen det som missats.
- Om en medlem missar ett *möte*, ska tillhörande mötesprotokoll läsas av medlemmen. 
- Om en medlem missar en *föreläsning*, ska informationen som förmedlades under föreläsningen tas igen av medlemmen.
  - Det är speciellt viktigt att roll-specifika föreläsningar tas del av medlemmen med roll i fråga.

Om en medlem upplever svårigheter med att veta vad de ska göra, ska de kommunicera med gruppen och fråga vad den kan hjälpa till med. Om en medlem upplever att den har för mycket att göra och känner sig överväldigad, ska den också prata med gruppen och be om assistans eller avlastning. Rimligen kan "närmsta ledare" så som backend/frontend-utvecklingsledare kontaktas och ge mer anpassad uppdelning av arbetet.

= Kommunikation
#rect[Genom vilka kanaler ska medlemmar kommunicera? Hur kontaktbara förväntas medlemmar vara?]

Gruppen sköter all intern kommunikation genom Discord. Varje medlem förväntas därför vara inloggad och ha kanalen lätt till hands. Medlemmen ska hålla sig uppdaterad *minst* en gång per vardag.
- Kanalen `#viktigt` ska endast användas för enstaka viktiga meddelanden (ex. kursinformation, ändringar i planer, mötestider) som annars skulle försvinna i `#generellt`. Diskussioner kring viktiga meddelanden kan föras i tillhörande tråd.

Medlemmar kan förväntas vara kontaktbara under normal arbetstid (kl 8-17 på vardagar), men vid generella ärenden kan medlemmar kontaktas per telefon. Frågor och diskussioner får ske när som helst på Discord, men övriga medlemmar kan inte förväntas bidra utanför ordinarie arbetstid.

= Konflikter
#rect[Hur ska det hanteras när olika lösningar presenteras? Hur hanteras det när medlemmar blir oense?]

Konflikter inom gruppen kan uppstå i *sakfrågor*. Om det är två medlemmar som har starka åsikter kring skilda lösningar på ett visst problem, måste de motivera inför gruppen varför just sin lösning är bäst. Gruppen ska då få möjlighet att läsa in sig på ämnet och kunna värdera lösningarna. Beslutet tas till sist genom majoritetsbeslut från gruppen.

Medlemmar kan hamna i *personliga konflikter* med varandra. Dessa konflikter ska primärt lösas sinsemellan i enrum för att minska risken att parterna blir defensiva framför hela gruppen.

Medlemmar i konflikt ska försöka att använda subjektivt språk. De ska alltså undvika formuleringar som "Du gör fel" utan istället säga "Jag blir ledsen när du gör så här, eftersom ...".

Om de inte lyckas bli sams får teamledaren (om inte teamledaren är delaktig i konflikten) agera opartisk medlare. Om konflikten kvarstår kontaktas handledaren för vidare hjälp. 

= Dokument
#rect[Var skrivs vilka dokument? Hur hanteras versionsnummer på formella dokument?]
All "formell" dokumentation (Projektplan, Kravspecifikation, Kvalitetsplan, Arkitekturdokument, Testplan, Testrapport) skrivs i Typst. Övriga "informella" dokument som mötesprotokoll, anteckningar, interna diskussioner sparas i gruppens Google Drive.

I de formella dokumenten ska medlemmar "signera" sina stycken genom att i Typst kommentera med namn (exempelvis `//SamuelÅ` för Samuel Åkesson).

Man får redigera stycken som andra har skrivit, men meddela gärna författaren först.

Medlemmar förväntas vara insatta i alla formella dokumenten som skrivs.

De formella dokumenten kommer att vara versionsnumrerade: 
- `1.0` symboliserar första inlämning.
- `1.1` symboliserar första revidering inför andra inlämning.
- `1.2` symboliserar andra revidering inför andra inlämning.
- `2.0` symboliserar andra inlämning.
När författarna av dokumentet vill få dokumentet ordentligt korrekturläst ska den mindre siffran ökas, och hela gruppen ska meddelas. På så sätt kan gruppen "frysa" en version inför inlämning.
//Alice 20 feb: Detta har vi väll inte gjort hitills. Kanske förtydliga att detta börjar gälla efet första inlämning eller?

= Mål och ambition
#rect[Vad är gruppens ambitionsnivå? Vad är av högsta prioritet?]

Gruppen har för avsikt att göra det bästa möjliga arbetet efter förutsättningarna och skapa värde för kunden. Varje medlem ser också projektet som en möjlighet till utveckling, och ta lärdom inför arbetslivet.

Om arbetet börjar gå riktigt illa mot slutet kommer produktens kvalitet nedprioriteras för medlemmarnas välmående. Gruppen vill inte skapa en fantastisk produkt till varje pris, utan skapa en rimlig lösning inom projektets ramar. För att motverka ett scenario då produktens kvalitet nedprioriteras ska gruppen kontinuerligt arbeta med realistiska förväntningar och tidsuppskattningar.

#colbreak()
= Beslutsfattande
#rect[Hur tas beslut? Vad bör diskuteras i helgrupp?]

Gruppen tar* _generella beslut_ på _generella möten_*. Generella beslut ska dessutom meddelas i förväg i mötets agenda, så att medlemmar har möjlighet att fundera på frågan.

Ett *generellt beslut* är ett beslut som påverkar hela projektet i sin helhet, påverkar vårt arbetssätt, ändrar på övergripande implementationsdetaljer eller dylikt. 
- Exempel på generellt: Ska vi använda Scrum som arbetsmetod?
- Exempel på icke generellt: Ska knappen för att öppna en tidsredovisning vara blå?
En medlem som tycker att en fråga är väldigt viktig har möjlighet att lyfta den som ett generellt beslut trots att den kanske inte annars hade klassificerats som ett generellt beslut. 

Grundregeln är att *alla medlemmar ska vara närvarande vid generella beslut* med vissa *undantag*:
- Om medlemmen som är frånvarande i god tid innan mötet visste om att beslutet skulle tas och i förväg har kunnat yttra sin åsikt.
- Om medlemmen som är frånvarande går att kontakta på telefon och på så sätt yttrat sin åsikt.
- Om beslutet är tidskritiskt och inte kan vänta tills alla medlemmar kan närvara. 

En medlem som inte närvarade vid ett generellt beslut kan kräva omröstning inom en vecka.

För att generella beslut ska godtas måste *5 av 9* medlemmar rösta för.

För implementationsdetaljer som inte rör hela systemets arkitektur har varje delgrupp större frihet. Exempelvis har de som jobbar med frontend fria tyglar att skapa design, eftersom det inte påverkar underliggande datastrukturer.

#pagebreak()

//#v(1fr)
= Underskrifter
#v(2cm)

#set stack(spacing: .5em)
#grid(
  columns: (1fr,)*2,
  gutter: 5em,
  
  stack(
    line(length:100%),
    [Alice Almgren],
  ),
  stack(
    line(length:100%),
    [Anton Taber Almqvist],
  ),
  stack(
    line(length:100%),
    [Axel Berg],
  ),
  stack(
    line(length:100%),
    [Isabel Neubauer],
  ),
  stack(
    line(length:100%),
    [Jakob Tormalm],
  ),
  stack(
    line(length:100%),
    [Samuel Åkesson],
  ),
  stack(
    line(length:100%),
    [Samuel Tuvstedt],
  ),
  stack(
    line(length:100%),
    [Simon Gunnarsson],
  ),
  stack(
    line(length:100%),
    [Stina Åström],
  ),
)