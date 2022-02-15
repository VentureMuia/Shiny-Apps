# install the package
install.packages("shiny")

# importing the packages
library(shiny)

# Creating the UI
UI<-shinyUI(
  fluidPage(
    titlePanel(title = "This is my first shiny application"),
    sidebarLayout(
      sidebarPanel(h3("Enter personal information"),
        textInput("name","Enter your name",""),
        textInput("age","Enter your age",""),
        radioButtons("gender","Choose your gender","Male",choices = c("Male","Female")),
        sliderInput("height","Select your height",min = 0,max = 3,value = 2,step = 0.5),
        submitButton("Submit")
        
      ),
      mainPanel(h3("Display Personal Information"),
        textOutput("myname"),
        textOutput("myage"),
        textOutput("mygender"),
        textOutput("myheight")
        
        
      )
    )
    
  )
)

server<-function(input,output,session){
  output$myname=renderText({paste("My name is:",input$name)})
  output$myage=renderText({paste("Your age is:",input$age,"Years")})
  output$mygender<-renderText({paste("Your gender is:",input$gender)})
  output$myheight<-renderText({paste("My height is:",input$height,"M")})
  
}

shinyApp(UI,server)
 