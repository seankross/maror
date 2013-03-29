# Checks if shiny is installed
if (!require(shiny)){
  install.packages(shiny,dep=TRUE)
}

library(shiny)

# Define UI
shinyUI(pageWithSidebar(
  
  # Application Title
  headerPanel("Maror - A Statistical Finance Platform"),
  
  # Sidebar with controls
  sidebarPanel(
    textInput("ticker", "Ticker Symbol:", "GE"),
  
    selectInput(inputId = "chart_type",
              label = "Chart type",
              choices = c("Line" = "line","Candlestick" = "candlesticks")                        
    ),
    wellPanel(
      p(strong("Date Range:")),
      selectInput(inputId = "startMonth",
                  label = "Start Month",
                  choices = c("January" = "01",
                              "February" = "02",
                              "March" = "03",
                              "April" = "04",
                              "May" = "05",
                              "June" = "06",
                              "July" = "07",
                              "August" = "08",
                              "September" = "09",
                              "Ocotber" = "10",
                              "November" = "11",
                              "Decemeber" = "12"),
                  selected = "January"),
      textInput("startYear", "Start Year:", "2012"),
      selectInput(inputId = "endMonth",
                  label = "End Month",
                  choices = c("January" = "01",
                              "February" = "02",
                              "March" = "03",
                              "April" = "04",
                              "May" = "05",
                              "June" = "06",
                              "July" = "07",
                              "August" = "08",
                              "September" = "09",
                              "Ocotber" = "10",
                              "November" = "11",
                              "Decemeber" = "12"),
                  selected = "January"),
      textInput("endYear", "End Year:", "2013")
      )
  ),
  
  mainPanel(div(plotOutput(outputId = "plot")) )
))
  
