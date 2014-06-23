library(UsingR) 
data(galton)
shinyServer( function(input, output) {
  output$newHist <- renderPlot({
    hist(galton$child, xlab='Adult Height of Child [inches]', ylab="Frequency", col='orange',main='Histogram', xlim=range(50:85)) 
    mother <- input$mother
    father <- input$father
    gender <- ifelse(input$gender=="female",-5,5)
    output$inputMother <- renderPrint(mother)
    output$inputFather <- renderPrint(father)
    output$inputGender <- renderPrint(input$gender)
    child <- (father + mother + gender)/2
    childFeet <- trunc(child/12)
    childInches <-trunc(child %% 12)
    childFraction <- as.character(fractions((child %% 12) - childInches))
    childFraction <- ifelse(childFraction=="0", "", childFraction)
        lines(c(child, child), c(-10, 150),col="blue",lwd=5)
        text(58, 160, paste("The predicted adult height of the child is ", childFeet, " feet ", childInches, childFraction, " inches."))
      })
} )