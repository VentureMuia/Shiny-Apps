# install the package
install.packages("shiny")

# importing the packages
library(shiny)

# Creating the UI
UI<-shinyUI(
  fluidPage(
    titlePanel(title = "This is my first shiny application"),
    sidebarLayout(
      sidebarPanel(
        textInput("name","Enter your name",""),
        textInput("age","Enter your age","")
        
      ),
      mainPanel(h3("Personal information"),
        textOutput("myname"),
        textOutput("myage")
      )
    )
    
  )
)

server<-function(input,output,session){
  output$myname=renderText({input$name})
  output$myage=renderText({input$age})
  
}

shinyApp(UI,server)
