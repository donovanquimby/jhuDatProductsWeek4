#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data("attenu")
att3 <- attenu

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Earthquake Data Explorer"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            
            checkboxGroupInput("events", "Choose which earthquakes:",
                        choices = unique(att3$event),
                        inline = TRUE,
                        selected = unique(att3$event)
                        ),
                        
                                
            selectInput("x", "Choose a x variable:", choices = names(att3),
                        selected = "dist"),
            
            selectInput("y", "Choose a y variable:",  choices = names(att3),
                        selected = "accel"),
            
            submitButton(text  = "Apply Changes", icon = icon("calculator")),
            h5("Note: Press submit button after changes to update plot")
            
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("scatPlot")
      
       
    )
  )
))
