#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
  output$scatPlot <- renderPlot({
        
        att4 <- attenu %>% filter(event %in% input$events )
        
        
        att4$event <- as.factor(att4$event)

        # draw the ggplot
        ggplot(att4, aes_string(x=input$x, y=input$y, color = "event")) + geom_point(size =4)

  })
  
})
