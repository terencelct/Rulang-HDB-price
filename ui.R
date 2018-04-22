library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title=h4("Distribution of HDB price around rulang primary",align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("distance", "1. Select the type of distnace", choices=c("total"=10,"within 1km"=1,"within2km"=2)),
      br(),
      sliderInput("year","2.Select year for the histogram", min=1990, max=2018, value=1990,animate=TRUE),
      br(),
      
      sliderInput("bins","2.Select the number of BINs for the histogram", min=10, max=30, value=20)
    ),
    
    mainPanel(
      
      plotOutput("density")
    )
  )
)

)
