library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title=h4("Distribution of HDB price around rulang primary school",align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "1. Select the type of price", choices=c("price"=1,"real price"=2,"log realprice"=3)),
      br(),
      selectInput("distance", "2. Select the type of distnace", choices=c("total"=10,"within 1km"=1,"within2km"=2)),
      br(),
      sliderInput("year","3.Select year for the histogram", min=1990, max=2018, value=1990,animate=TRUE,sep=""),
      br(),
      
      sliderInput("bins","4.Select the number of BINs for the histogram", min=10, max=30, value=20)
    ),
    
    mainPanel(
      
      plotOutput("density")
    )
  )
)

)
