Salaries <- read.csv("data/Salaries.csv")
Teams <- read.csv("data/Teams.csv")
franchise <- read.csv("data/TeamsFranchises.csv")
activefranchise = subset(franchise, active=='Y')
ActiveTeams <- as.character(unique(activefranchise$franchName))
Salaries$TeamName = Teams[match(Salaries$teamID, Teams$teamID),"name"]
TeamData = as.data.frame(Salaries)
TeamData = subset(TeamData, TeamName %in% ActiveTeams)
TeamList <- unique(TeamData$TeamName)
TeamList <- sort(as.character(TeamList), decreasing = FALSE)
TeamList <- TeamList[-c(1,5,6,9,19,21,22,26,27,30)]