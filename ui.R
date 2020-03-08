#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Exponential Distribution Simulation"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("lambdaVal",
                        "Lambda",
                        min = 0.1,
                        max = 1,
                        value = 0.1,
                        step = 0.1),
            sliderInput("numSims",
                        "Number of Samples",
                        min = 1,
                        max = 10000,
                        value = 1000),
            sliderInput("sampSize",
                        "Sample Size",
                        min = 1,
                        max = 100,
                        value = 50),
            submitButton("Submit"),
            h4("Population Mean:"),
            textOutput("popMean"),
            h4("Simulation Mean: "),
            textOutput("mns"),
            #h4("Population Variance:"),
            #textOutput("popVar"),
            #h4("Simulation Variance: "),
            #textOutput("vars")
            h5("User documentation:"),
            tags$a(href="https://osaeed.github.io/Course9FinalProject/documentation.html", "Click here!")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("mnsPlot") #,
            #plotOutput("varsPlot")
            )
    )
))
