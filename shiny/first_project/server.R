

library(shiny)

library("ggplot2")
library("dplyr")
load("C:/Users/Magdalena/STUDIA/apd-r-project/apd.Rda")
dane=cit
rm(cit)
dane$rok=as.numeric(format(dane$data,'%Y'))
colnames(dane)[6]= "P³eæ"

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$myPlot <- renderPlot({

    
    
    if (input$select=="dane"){
    #All
    ggplot(dane,aes(rok,fill=P³eæ))+geom_bar()+
      xlab("Rok")+ylab("Liczba prac")+
      scale_fill_brewer(palette="Paired")+
     theme(axis.title.x = element_text(family="serif", face="bold", size=14, angle=00, hjust=0.54, vjust=0))+
      theme(axis.title.y = element_text(family="serif", face="bold", size=14))
    }
    
    else{
    dd=dane%>%
      filter(field==input$select)
    ggplot(dd,aes(rok,fill=P³eæ))+geom_bar()+
      xlab("Rok")+ylab("Liczba prac")+
      scale_fill_brewer(palette="Paired")+
      theme(axis.title.x = element_text(family="serif", face="bold", size=14))+
      theme(axis.title.y = element_text(family="serif", face="bold", size=14))
    }
    
  })
})