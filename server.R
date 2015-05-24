library(ElemStatLearn)
library(ggplot2)
data(marketing)
market <- function(var, income) { 
  m <- var
  df <- data.frame()
  temp <- data.frame()
  #Set dataset equal to selected income:
  if(income == "<$10,000") { 
    df <- subset(marketing, marketing$Income=="1") }
  if(income == "$10,000-$15,000") { 
    df <- subset(marketing, marketing$Income=="2") }
  if(income == "$15,000-$20,000") { 
    df <- subset(marketing, marketing$Income=="3") }
  if(income == "$20,000-$25,000") { 
    df <- subset(marketing, marketing$Income=="4") }
  if(income == "$25,000-$30,000") { 
    df <- subset(marketing, marketing$Income=="5") }
  if(income == "$30,000-$40,000") { 
    df <- subset(marketing, marketing$Income=="6") }
  if(income == "$40,000-$50,000") { 
    df <- subset(marketing, marketing$Income=="7") }
  if(income == "$50,000-$75,000") { 
    df <- subset(marketing, marketing$Income=="8") }
  if(income == ">$75,000") { 
    df <- subset(marketing, marketing$Income=="9") }
  
  #Adjust variable values and set dataset equal to selected variable: 
  Income <- df$Income
  Sex <- gsub("1","Male",df$Sex)
  Sex <- gsub("2","Female",Sex)
  Marital <- gsub("1","Married",df$Marital)
  Marital <- gsub("2","Live together",Marital)
  Marital <- gsub("3","Divorced",Marital)
  Marital <- gsub("4","Widowed",Marital)
  Marital <- gsub("5","Single",Marital)
  Age <- gsub("^1","14-17",df$Age)
  Age <- gsub("^2","18-24",Age)
  Age <- gsub("^3","25-34",Age)
  Age <- gsub("^4","35-44",Age)
  Age <- gsub("^5","45-54",Age)
  Age <- gsub("^6","55-64",Age)
  Age <- gsub("^7",">65",Age)
  Education <- gsub("^1","<8",df$Edu)
  Education <- gsub("^2","09-11",Education)
  Education <- gsub("^3","12",Education)
  Education <- gsub("^4","13-15",Education)
  Education <- gsub("^5","16",Education)
  Education <- gsub("^6","17+",Education)
  Occupation <- gsub("1","Professional",df$Edu)
  Occupation <- gsub("2","Sales",Occupation)
  Occupation <- gsub("3","Factory",Occupation)
  Occupation <- gsub("4","Clerical",Occupation)
  Occupation <- gsub("5","Homemaker",Occupation)
  Occupation <- gsub("6","Student",Occupation)
  Occupation <- gsub("7","Military",Occupation)
  Occupation <- gsub("8","Professional",Occupation)
  Occupation <- gsub("9","",Occupation)
  Lived <- gsub("1","less than 1yr",df$Lived)
  Lived <- gsub("2","1-3yrs",Lived)
  Lived <- gsub("4","7-10yrs",Lived)
  Lived <- gsub("^3","4-6yrs",Lived)
  Lived <- gsub("5","10+yrs",Lived)
  Dual_Income <- gsub("1","Not Married",df$Dual_Income)
  Dual_Income <- gsub("2","Yes",Dual_Income)
  Dual_Income <- gsub("3","No",Dual_Income)
  Household_count <- gsub("1","One",df$Household)
  Household_count <- gsub("2","Two",Household_count)
  Household_count <- gsub("3","Three",Household_count)
  Household_count <- gsub("4","Four",Household_count)
  Household_count <- gsub("5","Five",Household_count)
  Household_count <- gsub("6","Six",Household_count)
  Household_count <- gsub("7","Seven",Household_count)
  Household_count <- gsub("8","Eight",Household_count)
  Household_count <- gsub("9","Nine+",Household_count)
  Household_under18 <- gsub("0","None",df$Householdu18)
  Household_under18 <- gsub("1","One",Household_under18)
  Household_under18 <- gsub("2","Two",Household_under18)
  Household_under18 <- gsub("3","Three",Household_under18)
  Household_under18 <- gsub("4","Four",Household_under18)
  Household_under18 <- gsub("5","Five",Household_under18)
  Household_under18 <- gsub("6","Six",Household_under18)
  Household_under18 <- gsub("7","Seven",Household_under18)
  Household_under18 <- gsub("8","Eight",Household_under18)
  Household_under18 <- gsub("9","Nine+",Household_under18)
  Status <- gsub("1","Own",df$Status)
  Status <- gsub("2","Rent",Status)
  Status <- gsub("3","Live with family",Status)
  Home_Type <- gsub("1","House",df$Home_Type)
  Home_Type <- gsub("2","Condominium",Home_Type)
  Home_Type <- gsub("3","Apartment",Home_Type)
  Home_Type <- gsub("4","Mobile Home",Home_Type)
  Home_Type <- gsub("5","Other",Home_Type)
  Ethnic <- gsub("1","American Indian",df$Ethnic)
  Ethnic <- gsub("2","Asian",Ethnic)
  Ethnic <- gsub("3","Black",Ethnic)
  Ethnic <- gsub("4","East Indian",Ethnic)
  Ethnic <- gsub("5","Hispanic",Ethnic)
  Ethnic <- gsub("6","Pacific Islander",Ethnic)
  Ethnic <- gsub("7","White",Ethnic)
  Ethnic <- gsub("8","Other",Ethnic)
  Language <- gsub("1","English",df$Language)
  Language <- gsub("2","Spanish",Language)
  Language <- gsub("3","Other",Language)
  
  temp <- cbind(Income, Sex, Marital, Age, Education, Occupation, Lived, Dual_Income, Household_count, Household_under18, Status, Home_Type, Ethnic, Language)
  temp <- as.data.frame(temp)
  temp <- subset(temp, select=var)
  colnames(temp) <- c("type")
  temp <- subset(temp, temp[,1]!="NA")
  g <- ggplot(temp, aes(type))
  g + geom_histogram(aes(fill=type), stat = "bin") + labs(title = paste(income,"Annual Household Income")) + guides(fill=guide_legend(title=var)) + theme(axis.text.x = element_text(angle = 30, vjust = 0.5, size = 12)) 
}
IncomePanel <- function(Attribute, Household_Income) 
market(Attribute, Household_Income)
shinyServer( 
  function(input, output) {
    output$inputValue <- renderPrint({input$Attribute})
    output$inputVal <- renderPrint({input$Household_Income})
    output$prediction <- renderPlot({IncomePanel(input$Attribute, input$Household_Income)})
  }
)