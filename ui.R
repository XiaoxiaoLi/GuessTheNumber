
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Guess The Number!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    h4("Rules: Guess a number between 1 and 100. We will let you know if your number is coorect, or if it is too large or too small."),
    numericInput("userInputID",'Enter your guess here',0,min=0,max=100,step=1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h4('Attempts made:'),
    verbatimTextOutput("attempts"),
    h4('You entered:'),
    verbatimTextOutput("userInput"),
    h4('It is:'),
    verbatimTextOutput("serverMsg")
  )
))
