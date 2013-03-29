# Checks if quantmod is installed
if (!require(quantmod)){
  install.packages(quantmod,dep=TRUE)
}

# Checks if shiny is installed
if (!require(shiny)){
  install.packages(shiny,dep=TRUE)
}

library(shiny)
library(quantmod)

# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }
  
  envir[[symbol]]
}

shinyServer(function(input, output){
  # Create an environment for storing data
  symbol_env <- new.env()
  
  # Make a chart for a symbol, with the settings from the inputs
  make_chart <- function(symbol) {
    symbol_data <- require_symbol(symbol, symbol_env)
    
    chartSeries(symbol_data,
                name      = symbol,
                type      = input$chart_type,
                subset    = paste(input$startYear,"-",input$startMonth,"::",input$endYear,"-",input$endMonth,sep=""),
                theme     = "white")
  }
  
  output$plot <- renderPlot({ make_chart(input$ticker) })
  
})
