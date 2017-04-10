
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Height and Weights Relationship"),

    # Sidebar with a slider input for the number of b
    sidebarLayout(
      sidebarPanel(helpText("Choolse the percentage of the 25,000 records of
                     heights and weights to plot."),
                   sliderInput("percentage",
                               label="Percentage of data to plot:",
                               min=0,max=100,value=50),
                   helpText("Specify range of height (inch)"),
                   sliderInput("HeightBand",
                               label="Range of Height:",
                               min=60,max=76,value=c(65,70))),
      mainPanel(h2("Data Description"),
                p("Human height and weight are hereditable, but lifestyles, diet,
                  health and environmental factors also play a role in determining
                  individual's physical characteristics. This database contains
                  25,000 records of human heights and weights. These data were obtained
                  in 1993 by a Growth Survey of 25,000 children from birth to
                  18 year of age recruited from Maternal and
                  Child Health Centres and schools and were used to develop
                  Hong Kong's current growth chart for weight, height,
                  weight-for-age, weight-for-height and body mass index."),
                br(),
                p(a("The complete data set are available here.",
                    href="http://socr.ucla.edu/docs/resources/SOCR_Data/SOCR_Data_Dinov_020108_HeightsWeights.html")),
                h2("Scatter plot of the selected data"),
                plotOutput("scatterPlot"),
                h2("Weight Distribution Given Range of Height"),
                textOutput("text1"),
                plotOutput("HeightHist")
      )
    )
))

