library(shiny)
library(rsconnect)


shinyServer(function(input,output){

  Rdata2 <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTuyy94aRkeYWEeISvd6lU17TsII56h8DFxJRMDUz3_8Ln-HQfAN07by4OuCPiRBW7GyEFcbzRF8f4B/pub?gid=1836512180&single=true&output=csv")
  output$density<-renderPlot({
    Rdata2 <- Rdata2[complete.cases(Rdata2), ]
    newd <- subset(Rdata2, year==input$year)
    newd2 <-subset(newd,distance<=input$distance)
    newd3 <- as.data.frame(newd2)
    colm <- as.numeric(input$var)
    colm2<- as.numeric(input$scale)
    x <- newd3[,colm]
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x)
    h<-hist(x, breaks=bins, col="green",xlim=c(min(Rdata2[,colm]),max(Rdata2[,colm])),ylim=c(0,500), xlab="Housing price(fixed axis scale)",main="Histogram and PDF") 
    xfit<-seq(min(x),max(x),length=40) 
    yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
    yfit <- yfit*diff(h$mids[1:2])*length(x) 
    lines(xfit, yfit, col="red", lwd=2)

  }
  
  )
  output$density2<-renderPlot({
    
    newd <- subset(Rdata2, year==input$year)
    newd2 <-subset(newd,distance<=input$distance)
    newd3 <- as.data.frame(newd2)
    colm <- as.numeric(input$var)
    colm2<- as.numeric(input$scale)
    x <- newd3[,colm]
    
    plot(ecdf(x),main="CDF plot",xlab="Housing price")
    
    
  }
  
  )
  
}
)