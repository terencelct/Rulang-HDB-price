library(shiny)
library(rsconnect)


shinyServer(function(input,output){

  Rdata2 <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQDJVOSM1jFw769RZa0jkB4ovuJFnuaeFePoTzghfOrsrYgm3g3r_YcDaQjYcyxFFxbdMnU6cfyjOHP/pub?gid=1746464075&single=true&output=csv")
  output$density<-renderPlot({
    
    newd <- subset(Rdata2, year==input$year)
    newd2 <-subset(newd,distance<=input$distance)
    newd3 <- as.data.frame(newd2)
    colm <- as.numeric(input$var)
    colm2<- as.numeric(input$scale)
    x <- newd3[,colm]
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x)
    h<-hist(x, breaks=bins, col="green",xlim=c(min(Rdata2[,colm]),max(Rdata2[,colm])),ylim=c(0,450), xlab="Housing price(fixed axis scale)",main=NA) 
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
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x)
    h<-hist(x, breaks=bins, col="green",xlim=c(min(x),max(x)), xlab="Housing price(flexible axis scale)",main=NA) 
    xfit<-seq(min(x),max(x),length=40) 
    yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
    yfit <- yfit*diff(h$mids[1:2])*length(x) 
    lines(xfit, yfit, col="red", lwd=2)
    
  }
  
  )
  
}
)