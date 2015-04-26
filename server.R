library(shiny)
library(ggplot2)
library(AER)

# load data
data <- read.csv("breast-cancer-wisconsin.csv")

shinyServer(
  function(input, output) {
    
    # reactive text for plot's caption
    text <- reactive({
      paste('Plot: ', input$variable1, 'vs.', input$variable2)
      })
    
    # plot's caption
    output$caption <- renderText({
      text()
      })
    
    # generate plot
    output$plot <- renderPlot({
      p <- ggplot(data, aes_string(x=input$variable1, y=input$variable2, colour="Class")) + geom_point()
      print(p)
      })
    
    # generate summary
    output$label_variable1 <- renderText({
      input$variable1
    })
    
    output$label_variable2 <- renderText({
      input$variable2
    })
    
    output$summary1 <- renderPrint({
      summary(data[, names(data)==input$variable1])
    })
    
    output$summary2 <- renderPrint({
      summary(data[, names(data)==input$variable2])
    })
    
    output$label_variable3 <- renderText({
      paste0('Linear model: ', input$variable1, ' (input$variable1) as a function of ', input$variable2, ' (input$variable2)')
    })
    
    output$summary3 <- renderPrint({
      lm(data[, names(data)==input$variable1] ~ data[, names(data)==input$variable2])
    })
    
  })