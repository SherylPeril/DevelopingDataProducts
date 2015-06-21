# server.
source('all_sessions.R', local=TRUE)
library(car)
library(RcppEigen)
library(rCharts)
Salaries <- read.csv("data/Salaries.csv")
Teams <- read.csv("data/Teams.csv")
franchise <- read.csv("data/TeamsFranchises.csv")
activefranchise = subset(franchise, active=='Y')
ActiveTeams <- as.character(unique(activefranchise$franchName))
Salaries$TeamName = Teams[match(Salaries$teamID, Teams$teamID),"name"]
TeamData = as.data.frame(Salaries)
TeamData = subset(TeamData, TeamName %in% ActiveTeams)
master <- read.csv("data/Master.csv")
TeamData$Player = master[match(TeamData$playerID, master$playerID),"nameLast"]
TeamData$Player <- as.character(TeamData$Player)
TeamList <- unique(TeamData$TeamName)
TeamList <- sort(as.character(TeamList), decreasing = FALSE)
TeamList <- TeamList[-c(1,5,6,9,19,21,22,26,27,30)]

shinyServer(function(input, output) {
  data <- reactive({
  subset(TeamData,  TeamName==input$var)
  })

  output$plot <- reactivePlot(function(){
    graphData <- data()
    if (nrow(graphData)==0) return()
    
    Boxplot(salary/1000 ~ yearID, type = 'lineChart', graphData, ylab = "$K", xlab = "", main = "Team Salaries", id.method = "y", id.n = 1, labels = graphData$Player)

})
})
