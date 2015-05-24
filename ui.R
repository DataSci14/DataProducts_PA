shinyUI(
  pageWithSidebar(
  headerPanel("Market analysis study of household income"),
  sidebarPanel(
    radioButtons('Attribute', "Select Attribute:", choices = c("Sex","Marital","Age","Education","Occupation","Lived","Dual_Income","Household_count","Household_under18","Status","Home_Type","Ethnic","Language")),    
    radioButtons('Household_Income', "Select Household Income:", choices = c("<$10,000","$10,000-$15,000","$15,000-$20,000","$20,000-$25,000","$25,000-$30,000","$30,000-$40,000","$40,000-$50,000","$50,000-$75,000",">$75,000"))
),
mainPanel(
h4('Overview:'),
h5('Surveys were filled out by shopping mall customers in the Bay area in 1987 that pertain to market analysis conssiting of 14 demographic attributes.  A total of 9,409 questionnaires were filled out and 8,993 instances were useable for data analysis.  This shinyapp allows the user to select 1 of 13 demographic Attributes located on the sidebarpanel and Household Income via radio buttons.  Upon a selection, a histogram is generated with the desired parameters and will continue to update itself when new selections are made.  This shinyapp makes it convenient to cycle between variables in the dataset to determine which attributes have more or less influence on Household Income.'),
h4('Attribute:'),
verbatimTextOutput("inputValue"),
h4('Household Income:'),
verbatimTextOutput("inputVal"),
h4('Plot:'),
plotOutput("prediction", width = "400px", height = "400px")
  )
 )
)


