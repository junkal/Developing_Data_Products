library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shares Trend Comparison"),
  
  sidebarPanel(
    #Symbol
    textInput("symbol1", "Stock symbol 1:", "AAPL"),
    textInput("symbol2", "Stock symbol 2:", "GOOG"),
    dateInput("dateFrom", "From:","2014-12-01" ),
    dateInput("dateTo", "To:" ),
    selectInput("marketindex",
                label="Select a market index to compare with",
                choices=list("STI"=1,
                             "DJI"=2,
                             "NASDAQ"=3,
                             "S&P 500"=4,        
                             "HANG SENG"=5,
                             "NIKKEI 255"=6 ),                  
                selected=1),
    h4('Instruction'),
    p('1. Enter the 2 stock symbols to compare'),
    p('2. Select the time frame'),
    p('3. Select the market index to compare from the drop-down menu')
  ),
  
  mainPanel(
    plotOutput("symbolPlot"),
    plotOutput("symbolMainIndex")
  )
))