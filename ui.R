shinyUI(pageWithSidebar(
  headerPanel("Text Prediction"),
  sidebarPanel(
    textInput("textUserInput", label = h3("Enter Text"),value=""),     
    submitButton('Submit')
     ),
  mainPanel(
    p('Unprocessed input:'),
    textOutput('textUserInputCleaned'), 
    
    
    p('Cleaned input:'),
    textOutput('textOutput')
    )
))
