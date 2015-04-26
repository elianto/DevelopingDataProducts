library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Developing Data Products project - Coursera"),
  
  headerPanel("Breast Cancer Wisconsin (Diagnostic) Data Set"),
  h4("The original data and their description are available",
     a("here", href="https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29"),
     "and",
     a("here", href="https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.names"),
     ". Citation form the description: This breast cancer databases was obtained from the University of Wisconsin Hospitals,
     Madison from Dr. William H. Wolberg. Features are computed from a digitized image of a fine needle aspirate (FNA) of a breast mass. They describe characteristics of the cell nuclei present in the image."),
  h4("This shiny app provides plots of one variable in the dataset against the other, and compute a linear regression using the two choosen variables."),
  br(),

  
  sidebarLayout(sidebarPanel(
    
    helpText("Choose the two variables you want to explore against each other and see the plot, summaries, and linear model updating."),
    br(),
    
    
    selectInput("variable1", label = "Choose the first variable:",
                choices = c("Patient_id", "Clump_Thickness", "Uniformity_Cell_Size",
                            "Uniformity_Cell_Shape", "Marginal_Adhesion",
                            "Single_Epithelial_Cell_Size", "Bare_Nuclei",
                            "Bland_Chromatin", "Normal_Nucleoli", "Mitoses"),
                selected = "Clump_Thickness"),
    
    selectInput("variable2", label = "Choose the second variable:",
                choices = c("Patient_id", "Clump_Thickness", "Uniformity_Cell_Size",
                            "Uniformity_Cell_Shape", "Marginal_Adhesion",
                            "Single_Epithelial_Cell_Size", "Bare_Nuclei",
                            "Bland_Chromatin", "Normal_Nucleoli", "Mitoses"),
                selected = "Normal_Nucleoli")
    ),
    
    
    mainPanel(
      h4(textOutput("caption")),
      plotOutput("plot"),
      br(),
      
      h4("Basic summary of choosen variables:"),
      br(),
      h5(textOutput("label_variable1")),
      verbatimTextOutput("summary1"),
      br(),
      h5(textOutput("label_variable2")),
      verbatimTextOutput("summary2"),
      br(),
      h5(textOutput("label_variable3")),
      verbatimTextOutput("summary3")
      
      )
    )
  ))
