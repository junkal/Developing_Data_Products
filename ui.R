library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shares Trend Comparison"),
  
  sidebarPanel(
    #Symbol
    textInput("symbol1", "Stock Symbol:", "AAPL"),
    textInput("symbol2", "Stock Symbol:", "GOOG"),
    dateInput("dateFrom", "From:","2014-12-01" ),
    dateInput("dateTo", "To:" ),
    selectInput("marketindex",
                label="Select an index to compare with",
                choices=list("STI"=1,
                             "DJI"=2,
                             "NASDAQ"=3,
                             "S&P 500"=4,        
                             "HANG SENG"=5,
                             "NIKKEI 255"=6 ),                  
                selected=1)
    #http://stackoverflow.com/questions/23334696/changing-select-input-choices-in-r-shiny
  ),
  
  mainPanel(
    
    plotOutput("symbolPlot"),
    plotOutput("symbolMainIndex")
  )
))