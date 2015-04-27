library(tm)

CleanInputString <- function(textInput)
{
  # First remove the non-alphabatical characters
  textInput <- iconv(textInput, "latin1", "ASCII", sub=" ");
  textInput <- gsub("[^[:alpha:][:space:][:punct:]]", "", textInput);
  
  # Then convert to a Corpus
  textInputCrps <- VCorpus(VectorSource(textInput))
  
  # Convert the input sentence to lower case
  # Remove punctuations, numbers, white spaces
  # non alphabets characters
  textInputCrps <- tm_map(textInputCrps, content_transformer(tolower))
  textInputCrps <- tm_map(textInputCrps, removePunctuation)
  textInputCrps <- tm_map(textInputCrps, removeNumbers)
  textInputCrps <- tm_map(textInputCrps, stripWhitespace)
  textInput <- as.character(textInputCrps[[1]])
  textInput <- gsub("(^[[:space:]]+|[[:space:]]+$)", "", textInput)
  
  # Return the cleaned resulting senytense
  # If the resulting string is empty return empty and string.
  if (nchar(textInput) > 0) {
    return(textInput); 
  } else {
    return("");
  }
}
shinyServer(
  function(input, output) {       
    output$textUserInputCleaned <- renderText({input$textUserInput})   
    #output$textOutput <- CleanInputString(as.character(renderText({input$textUserInput})))
  }
)

