library(shiny)

shinyServer(function(input,output){
  
  
  
  output$density<-renderPlot({
    
    newd <- subset(Rdata2, year==input$year)
    newd2 <-subset(newd,distance<=input$distance)
    x <- newd2$realprice
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x)
    h<-hist(x, breaks=bins, col="red", xlab="Housing price",main=NA) 
    xfit<-seq(min(x),max(x),length=40) 
    yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
    yfit <- yfit*diff(h$mids[1:2])*length(x) 
    lines(xfit, yfit, col="blue", lwd=2)
    
    
    
  }
  
  )
  
}
)