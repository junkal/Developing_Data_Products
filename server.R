library(shiny)
library(quantmod)

shinyServer(function(input, output){
  output$symbolPlot <- renderPlot({
    
    if (input$symbol1 != "" & input$symbol2 != "")
    {
    
      layout(matrix(1:2, nrow=2))
      plotData<-getSymbols(input$symbol1,
                           from=input$dateFrom, 
                           to=input$dateTo, 
                           auto.assign=FALSE)
      
      chartSeries(plotData,
                  type = 'candlesticks',
                  name=input$symbol1,
                  layout=NULL,
                  TA=NULL,
                  theme=chartTheme("white"))
      
      plotData2<-getSymbols(input$symbol2,
                            from=input$dateFrom, 
                            to=input$dateTo, 
                            auto.assign=FALSE)
      
      chartSeries(plotData2,
                  type = 'candlesticks',
                  name=input$symbol2,
                  layout=NULL,
                  TA=NULL,
                  theme=chartTheme("white"))
      layout(1)
    }
    
    #code to put two plots on the same chart
    #but chart_Series is currently an experimental version
    #mytheme <- chart_theme()
    #mytheme$col$line.col <- 'blue'
    #chart_Series(Cl(plotData),name=input$symb, theme=mytheme)
    #add_Series(Cl(plotData2),on=1)
    
  }) #end renderPlot
  
  index_string = "STRAITS TIMES INDEX"
    
  datasetInput <- reactive({
    if (input$marketindex == "1"){
      
      index_string <<- "STRAITS TIMES INDEX"
      
      getSymbols("^STI",
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif STRAITS TIMES INDEX
    
    else if (input$marketindex == "2"){
      
      index_string <<- "DOW JONES INDUSTRIAL AVERAGE"
      
      getSymbols("DIA", 
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif DOW JONES INDUSTRIAL AVERAGE
    
    else if (input$marketindex == "3"){
      
      index_string <<- "NASDAQ"
      
      getSymbols("^INDS", 
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif NASDAQ

    else if (input$marketindex == "4"){
      
      index_string <<- "STANDARD & POOR 500"
      
      getSymbols("^GSPC", 
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif S&P 500
    
    else if (input$marketindex == "5"){
      
      index_string <<- "HANG SENG"
      
      getSymbols("^HSI", 
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif HANG SENG
    
    else if (input$marketindex == "6"){
      
      index_string <<- "NIKKEI 225"
      
      getSymbols("^N225", 
                 from=input$dateFrom, 
                 to=input$dateTo, 
                 src = "yahoo",
                 auto.assign=FALSE)} #endif NIKKEI 225
  })
  
  output$symbolMainIndex <- renderPlot({    
    chartSeries(datasetInput(),
                type = 'candlesticks',
                name=index_string,
                layout=NULL,
                TA=NULL,
                theme=chartTheme("white"))
  }) #end renderPlot
})

#code to combine volume of two symbols
#Symbols<-c(input$symbol1, input$symbol2)

#xtsStock <- xts()
#xtsFinalPrices <- xts()

#for (i in 1:length(Symbols))
#{
#  xtsStocks <- getSymbols(Symbols[i], from=input$dateFrom, to=input$dateTo, auto.assign = FALSE) 
#  xtsFinalPrices <- merge(xtsFinalPrices,xtsStocks[,5]) 
#}

#xtsFinalPrices


