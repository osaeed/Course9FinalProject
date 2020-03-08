#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$popMean <- renderText({ 1 / input$lambdaVal }) 
    output$popVar <- renderText({ 1 / (input$lambdaVal * input$lambdaVal) }) 
    output$mnsPlot <- renderPlot({
        mns = NULL
        vars = NULL
        set.seed(1)
        lambda <- input$lambdaVal
        numSamples <- input$numSims
        sampleSize = input$sampSize
        otherText <- paste("- Lambda = ", lambda, ", # Samples = ", numSamples, ", Sample Size = ", sampleSize)
        # run 1000 iterations of sample 40 data points from the exponential distribution with lambda = 0.2.  For each sample of 40, calculate the mean and variance, and add to the approprate vector.
        for (i in 1:numSamples) {
            samp <- rexp(sampleSize, rate=lambda)
            mns = c(mns, mean(samp))
            vars = c(vars, var(samp))
        }
        hist(mns, xlab = 'Sample Mean', main = paste('Samples Means' , otherText))
    })
    output$mns <- renderText({
        mns = NULL
        vars = NULL
        set.seed(1)
        # run 1000 iterations of sample 40 data points from the exponential distribution with lambda = 0.2.  For each sample of 40, calculate the mean and variance, and add to the approprate vector.
        for (i in 1:input$numSims) {
            samp <- rexp(input$sampSize, rate=input$lambdaVal)
            mns = c(mns, mean(samp))
            vars = c(vars, var(samp))
        }
        mean(mns)    
    })
    output$vars <- renderText({
        mns = NULL
        vars = NULL
        set.seed(1)
        # run 1000 iterations of sample 40 data points from the exponential distribution with lambda = 0.2.  For each sample of 40, calculate the mean and variance, and add to the approprate vector.
        for (i in 1:input$numSims) {
            samp <- rexp(input$sampSize, rate=input$lambdaVal)
            mns = c(mns, mean(samp))
            vars = c(vars, var(samp))
        }
            mean(vars) 
        })
    output$varsPlot <- renderPlot({
        mns = NULL
        vars = NULL
        set.seed(1)
        lambda <- input$lambdaVal
        numSamples <- input$numSims
        sampleSize = input$sampSize
        otherText <- paste("- Lambda = ", lambda, ", # Samples = ", numSamples, ", Sample Size = ", sampleSize)
        # run 1000 iterations of sample 40 data points from the exponential distribution with lambda = 0.2.  For each sample of 40, calculate the mean and variance, and add to the approprate vector.
        for (i in 1:numSamples) {
            samp <- rexp(sampleSize, rate=lambda)
            mns = c(mns, mean(samp))
            vars = c(vars, var(samp))
        }
        hist(vars, xlab = 'Variance of Sample', main = paste('Variances of Samples' , otherText))
    })

    
    
})
