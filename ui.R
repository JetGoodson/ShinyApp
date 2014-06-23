shinyUI(pageWithSidebar( 
  headerPanel("Simple Child Height Predictor"), 
  sidebarPanel(
    h2('Input'),
    h3('Please input the following data:'),
  sliderInput('mother', 'Height of the Mother in inches?',value = 66, min = 54, max = 78, step = 0.5,),
  sliderInput('father', 'Height of the Father in inches?',value = 72, min = 60, max = 84, step = 0.5,),
  selectInput("gender", "Gender of the Child at Birth?",
                     choices = c("Female" = "female", 
                       "Male" = "male"), selected=1)
  ),
  mainPanel( 
    h2('Results:'),
    p("The input height in inches for the mother was:"),
    verbatimTextOutput("inputMother"),
    p("The input height in inches for the father was:"),
    verbatimTextOutput("inputFather"),
    p("The input gender of the child at birth was:"),
    verbatimTextOutput("inputGender"),
    plotOutput('newHist'),
    p('The predicted adult height of the child (blue line marker) is compared to the Galton height data in the histogram above.')
    ) 
  ))