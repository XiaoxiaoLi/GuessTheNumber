
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  correctNumber <- sample(1:20,1)
  attempts <<- -1
  output$playerName <- renderText({input$playerName})
  output$userInput <- renderPrint({input$userInputID})
  output$attempts <- renderPrint({
    attempts <<- attempts+1
    attempts+input$userInputID-input$userInputID})
  output$serverMsg <- renderText({
    if(input$userInputID==correctNumber){
      msg <- paste("Correct! Congrats! You got it right in",attempts,"attemps. New number generated, guess again!", sep=" ")
      correctNumber <<- sample(1:20,1)
      attempts <<- 0
      return(msg)
    }else{
      if(attempts>5){
        msg<-paste("Sorry used up all 6 of your chances! The correct answer is",correctNumber,". New number generated, guess again!")
        attempts<<- 0
        attempts+input$userInputID-input$userInputID
        correctNumber <<- sample(1:20,1)
        return(msg)
      }
      if(input$userInputID>correctNumber){
        return("Too high!")
      }else if (input$userInputID<correctNumber){
        return("Too low!")
      }
    }
  })
  
})
