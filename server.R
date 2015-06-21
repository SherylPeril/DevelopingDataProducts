# server.
library(shiny)
library(httr)


shinyServer(function(input, output) {
  data <- reactive({
  subset(TeamData,  TeamName==input$var)
  })

  output$plot <- reactivePlot(function(){
    graphData <- data()
    if (nrow(graphData)==0) return()
    
    boxplot(salary/1000 ~ yearID, type = 'lineChart', graphData, 
            ylab = "$K", main = "Team Salaries")

})
})
