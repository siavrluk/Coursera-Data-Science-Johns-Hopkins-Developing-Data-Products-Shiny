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
    titlePanel("Predict Happiness Score"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("slideLifeExp",
                        "Select Life Expectany",
                        value = 65, min = 1, max = 100, step = 1),
            selectInput("RegionSelection", "Select Region", choices = c("Central and Eastern Europe",
                                                                    "Commonwealth of Independent States",
                                                                    "East Asia",
                                                                    "Latin America and Caribbean",
                                                                    "Middle East and North Africa",
                                                                    "North America and ANZ",
                                                                    "South Asia",
                                                                    "Southeast Asia",
                                                                    "Sub-Saharan Africa",
                                                                    "Western Europe"
                                                                    )),
            checkboxInput("showModel1", "Show/Hide Model1 Prediction", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model2 Prediction", value = TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h4("Predicted Happiness Score from Model 1"),
            textOutput("pred1"),
            h4("Predicted Happiness Score from Model 2"),
            textOutput("pred2")
        )
    )
))
