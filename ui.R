
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
    p("Once you got it right within the 6 attempts you win, and a new game starts. If after six attempts you still haven't guessed the number you lose, I will let you know what the number is, and a new game starts."),
    p("On the right, I will greet you if you enter your name down below. I will show you how many attempts you made in the current game, the last guess you entered, and a message after you made a guess."),
    br(),
    textInput(inputId="playerName",label="Enter Your Name:",value="Player"),
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
