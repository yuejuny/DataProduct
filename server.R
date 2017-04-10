shinyServer(function(input,output){
  load("HeightWeight.Rdata")
  library(ggplot2)

  output$scatterPlot <- renderPlot({
    id <- sample(DT$Index,size=input$percentage/100*25000,replace=FALSE)
    df <- DT[id,]
    ggplot(data=df,aes(Height,Weight))+geom_point(alpha=0.1,colour='blue')+
      labs(x="Height, inch",y="Weight, pound")
    
  })
  output$text1 <- renderText({
    paste("Height range:",input$HeightBand[1],"-",input$HeightBand[2],"inches.")
  })
  output$HeightHist <- renderPlot({
    id2 <- DT$Height >= input$HeightBand[1]&
      DT$Height <= input$HeightBand[2]
    df2 <- DT[id2,]
    ggplot(data=df2,aes(Weight))+geom_histogram()
  })
  
})