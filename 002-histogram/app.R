# https://stat.ethz.ch/R-manual/R-patched/library/datasets/html/crimtab.html

library(shiny)
data(crimtab)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Data of 3000 male criminals over 20 years old undergoing their sentences in the chief prisons of England and Wales. "),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  ),
  tags$h4("About the dataset: The 42 rownames (9.4, 9.5, ...) correspond to midpoints of intervals of finger lengths 
          whereas the 22 column names (colnames) (142.24, 144.78, ...) correspond to (body) heights of 3000 criminals")
)


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- crimtab
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#0066CC", border = "black",
         xlab = "Number of Sentences",
         ylab = "Number of Criminals",
         main = "Histogram of male criminals")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)

