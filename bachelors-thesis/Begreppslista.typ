#let details = (
  title: "Begreppslista",
  simple: true,
  history: (
    "1.0",
    "2025-04-23",
    [
      Sorterat alfabetiskt.
    ],
    "",
    "0.1",
    "2025-02-09",
    "Skapats",
    "Hela gruppen",
  ),
)
#import "style.typ": *
#show: style.with(details)

#set table.cell(breakable: false)

#let definitions(..cells) = table(
  columns: (auto, auto, auto),
  table.header[*Begrepp (svenskt)*][*Förklaring*][*Begrepp (engelskt)*],
  ..cells
)

= Introduktion
Detta dokument innehåller alla återkommande begrepp som används i projektets resterande dokument. Det finns även tillhörande engelska begrepp som används i kodbasen.
// Från och med den 18/2 är det UPPGIFT

= Projektspecifika begrepp
#definitions(
  [Admin/Administratör], [En användare som kan hantera uppgifter och skapa rapporter/sammanställningar.],[Administrator],
  [Aktivitet], [Ett ID som används för att koppla en uppgift till faktureringställe.],[Activity],
  [DIGIT], [Digitaliseringsavdelningen vid LiU],[Digitalisation Division],
  [LiU], [Linköpings Universitet],[-],
  [Roll], [En användares roll i systemet, tidsredovisare eller administratör.],[Role],
  [Tidsredovisare], [LiU-medarbetare som redovisar arbetad tid.],[Time tracker],
  [Tidsredovisning], [Processen där tidsredovisare rapporterar tid arbetad på uppgifter i ett uppdrag],[Time tracking],
  [Uppgift], [En arbetsuppgift som tidsredovisare kan rapportera tid till.],[Task],
)

//Uppdaterad Simon feb 20
= Externa begrepp
#definitions(
[ASP.net], [Ett ramverk för att bygga webbapplikationer. I detta projekt använder vi C\# som programmeringsspråk tillsammans med ramverket.], [-],
[Azure], [En samling molnbaserade tjänster tillhandahållet av Microsoft.], [-],
[Backend], [Den delen av systemet som behövs för bland annat interagera med databas och autentisera användare.], [-], 
[`.csv`], [Ett filformat. Står för "Comma separated values"], [-],
[C\#], [Ett programmeringsspråk som kommer användas för backendutveckling.], [-],
[DevOps], [Integration och automatisering av mjukvaruutveckling och informationsteknologi.], [-],
[Digitaliseringsavdelningen (DIGIT)], [Digitaliseringsavdelningen på LiU], [Digitalisation Division (DIGIT)],
[Discord], [En kommunikationskanal som erbjuder röstsamtal.], [-],
[ESLint], [Ett statiskt kodanalysverktyg för JavaScript och TypeScript som hjälper till att identifiera och åtgärda kodproblem.], [-],
[Frontend], [Den delen av systemet som användare upplever och interagerar med. I projektets fall är det hemsidan.], [-],
[Google Drive], [En molnbaserad filhanterare där dokument kan sparas och delas med andra.], [-],
[Grupp], [En grupp i LiU:s behörighetssystem som styr åtkomst till uppdrag och funktioner. Även kallat säkerhetsgrupp], [Group],
[LCP], [Largest contentful paint @ref:LCP. Tiden det tar för det största element att ladda in.], [-],
[LiU-ID], [Ett användarnamn som används för digitala tjänster på Linköpings universitet], [-],
[MS Teams], [En kommunikationsplattform och samarbetsverktyg.], [-],
[React/Svelte], [Ett ramverk för att bygga webbapplikationer. I detta projektet använder vi TypeScript som programmeringsspråk tillsammans med ramverket.], [-],
[SQL], [Structured Query Language. Ett standardspråk för databashantering.], [-],
[SSO], [Single Sign On, ett verktyg för autentisering av användare], [-],
[TypeScript], [Ett typat programmeringsspråk som kommer användas för frontendutveckling.], [-],
[UI], [Användargränssnittet för produkten.], [-],
)


//Simon 20 feb
= Processbegrepp
#definitions(
[Burndown-chart], [Grafisk visualisering av kvarvarande arbete.], [-],
[Kanban], [En agil metod för att visualisera arbetsflöden och hantera pågående arbete genom en tavla.], [-],
[LCP], [Tiden det tar för det största synliga innehållet på en webbsida att laddas och visas för användare.], [Largest Contentful Paint],
[Produktbacklogg], [Lista över prioriterade funktioner och krav som ska utvecklas i produkten.], [Product backlog],
[Produktägare], [Ansvarig för produktbackloggen, prioriterar krav och ser till att teamet skapar värde under sprintar.], [Product owner],
[Scrum], [En agil mjukvaruutvecklings process som bygger på iterativt arbete i tidsbegränsade sprintar.], [-],
[Scrum master], [En coach som säkerställer att scrumprocessen följs, stödjer teamet under sprintar.], [-],
[Sprint], [En tidsbegränsad arbetscykel i Scrum som varar en till fyra veckor, där teamet utvecklar och implementerar uppgifter och funktioner från sprintbackloggen.], [-],
[Sprint retrospektiv], [Ett möte i slutet av en sprint där teamet reflekterar över hur det gått, samt identifierar förbättringsområden till kommande sprintar.], [Sprint retrospective],
[Sprint review], [Ett möte i slutet av en sprint där teamet redovisar vilka uppgifter och funktioner som har eller inte har levererats under den senaste sprinten.], [-],
[Sprintbacklogg], [De uppgifter och funktioner som valts ut från produktbackloggen för den aktuella sprinten.], [Sprint backlog],
[Sprintplanering], [Ett möte där teamet väljer vilka uppgifter som ska genomföras under den kommande sprinten.], [Sprint planning],
[SUS], [En skala för att mäta användbarheten på ett system, baserat på användares upplevelse av dess funktionalitet och design.], [SUS System Usability Scale],
[Utvecklingsteam], [En grupp som utvecklar och levererar funktionalitet i sprintar.], [Development team],

)

#bibliography("references.bib")
