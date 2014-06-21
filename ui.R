
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
    p("I am thinking a number between 1 and 20, you have 6 tries to guess the number! I'll let you know if your guess is too high, too low, or correct!"),
    br(),
    p("Once you got it right I'll think of a new number between 1 and 20 and we can play again."),
    br(),
    textInput(inputId="playerName",label="Your Name",value="Player"),
    numericInput("userInputID",'Enter your guess here',0,min=1,max=20,step=1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h4('Hi,'),
    h4(textOutput("playerName")),
    h4('Attempts made:'),
    verbatimTextOutput("attempts"),
    h4('You entered:'),
    verbatimTextOutput("userInput"),
    h4('It is:'),
    verbatimTextOutput("serverMsg")
  )
))
