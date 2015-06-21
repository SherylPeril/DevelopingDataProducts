library(shiny)


shinyUI(fluidPage(
  titlePanel("baseball-app"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("MLB Data Downloaded from: http://seanlahman.com/files/database/ readme2014.txt"),
    
      selectInput("var", 
                  label = 'Choose a Team to Display Salaries',
                  choices = TeamList,
                  selected = "Arizona Diamondbacks")
      
  
      ),
    mainPanel(plotOutput("plot"), height = "800px")
  )
))