#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

data <- read.csv("world-happiness-report-2021.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    
    model1 <- lm(Ladder.score ~ Healthy.life.expectancy, data = data)
    model2 <- lm(Ladder.score ~ Healthy.life.expectancy + Regional.indicator, data = data)
    
    pred1 <- reactive({
                lifeExpInput <- input$slideLifeExp
                predict(model1, newdata = data.frame("Healthy.life.expectancy" = lifeExpInput))
             })
    
    
    pred2 <- reactive({
                lifeExpInput <- input$slideLifeExp
                RegionInput <- switch(input$RegionSelection,
                                      "Central and Eastern Europe" = "Central and Eastern Europe",
                                      "Commonwealth of Independent States" = "Commonwealth of Independent States",
                                      "East Asia" = "East Asia",
                                      "Latin America and Caribbean" = "Latin America and Caribbean",
                                      "Middle East and North Africa" = "Middle East and North Africa",
                                      "North America and ANZ" = "North America and ANZ",
                                      "South Asia" = "South Asia",
                                      "Southeast Asia" = "Southeast Asia",
                                      "Sub-Saharan Africa" = "Sub-Saharan Africa",
                                      "Western Europe" = "Western Europe")
                predict(model2, newdata = data.frame("Healthy.life.expectancy" = lifeExpInput, "Regional.indicator" = RegionInput))
             })
    
    
    output$plot1 <- renderPlot({
        lifeExpInput <- input$slideLifeExp
        RegionInput <- switch(input$RegionSelection,
                              "Central and Eastern Europe" = "Central and Eastern Europe",
                              "Commonwealth of Independent States" = "Commonwealth of Independent States",
                              "East Asia" = "East Asia",
                              "Latin America and Caribbean" = "Latin America and Caribbean",
                              "Middle East and North Africa" = "Middle East and North Africa",
                              "North America and ANZ" = "North America and ANZ",
                              "South Asia" = "South Asia",
                              "Southeast Asia" = "Southeast Asia",
                              "Sub-Saharan Africa" = "Sub-Saharan Africa",
                              "Western Europe" = "Western Europe")
        
        data$Regional.indicator <- as.factor(data$Regional.indicator)
        plot(data$Healthy.life.expectancy, data$Ladder.score,
             xlab = "Life Expectancy", ylab = "Happiness Score", col = data$Regional.indicator)
        
        if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        
        if(input$showModel2){
            abline(model2, col = "blue", lwd = 2)
        }
        
        legend.cols = as.numeric(as.factor(levels(data$Regional.indicator)))
        
        legend("topleft", c("Model1 Prediction", "Model2 Prediction"), pch = 16, col = c("red", "blue"))
        legend("bottomright", legend=levels(data$Regional.indicator), pch = 1, col = 1:nlevels(data$Regional.indicator), cex = 0.7)
        points(lifeExpInput, pred1(), col = "red", pch = 16, cex = 2)
        points(lifeExpInput, pred2(), col = "blue", pch = 16, cex = 2)
       

    })
    
    output$pred1 <- renderText({
        pred1()
    })

    output$pred2 <- renderText({
        pred2()
    })

})
