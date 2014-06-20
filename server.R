
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  correctNumber <- sample(0:100,1)
  attempts <<- -1
  output$userInput <- renderPrint({input$userInputID})
  output$serverMsg <- renderText({
    if(input$userInputID>correctNumber){
      return("Too large!")
    }else if (input$userInputID<correctNumber){
      return("Too small!")
    }else{
      correctNumber <<- sample(0:100,1)
      msg <- paste("Correct! Congrats! You got it right in",attempts,"attemps. New number generated, guess again!", sep=" ")
      attempts <<- -1
      return(msg)
    }
  })
  output$attempts <- renderPrint({
    attempts <<- attempts+1
    attempts+input$userInputID-input$userInputID})
})
