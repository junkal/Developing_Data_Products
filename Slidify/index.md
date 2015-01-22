---
title       : Stock Trend Analyser
subtitle    : Developing Data Products (January 2015)
author      : junkal
job         : 
logo        : logo.jpg
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url         :
  assets: ./assets
  lib: ./libraries
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About the app

- This app plots the stock market prices and market index over time
- It obtains the stock data from yahoo finance
- The plots display 3 Candlestick Charts (2 on stock information and 1 on market index) over a defined time period

---

## Quantmod package and processing involved

- The app requires both the shiny package and quantmod package. 
- It relies on two key functions from quantmod package - getSymbols and chartSeries
- The getSymbols function retrieve the information of the specified stock symbol (default source is Yahoo finance)

```r
library(quantmod)
plotData<-getSymbols("GOOG", from="2014/12/01", to="2015/01/01", auto.assign=FALSE)
```
- **chartSeries** plot the graph with the data retrieved from getSymbols

```r
chartSeries(plotData, type = 'candlesticks', name="Google")
```

---

## Observe the stock trend over time

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

---

## Links

- Try the app at: http://junkal.shinyapps.io/ShinyApp 
- Source code is at: https://github.com/junkal/Developing_Data_Products
