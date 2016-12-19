library(shiny)

fluidPage(
  
  titlePanel (h2("Analysis of zymogen activation",  align = "right")),
 
 
                
  sidebarLayout(
    
    sidebarPanel(
   
              fluidRow(
                  column(6, fileInput("data", label = "Select dataset:")),
                           
                  column(3,radioButtons(inputId = "sep", label = "File type", choices = c(csv = ",", txt ="\t"), selected = ",")),
                  
                  column(3,checkboxInput(inputId= "header", label = "Columns have header text", value = TRUE))
                         ),
                         
              fluidRow(
                  
                           
                  column(7, numericInput("numrows",
                                                  label = h5("Number of rows in plots and table"), value = 8)),
                           
                  column(5,  uiOutput("what"))
                      ),

              fluidRow(
                  column(5, uiOutput("maxt")),
                  
                  column(7, numericInput("num", 
                                         label = h5("Maximum absorbance"), step = 0.1,
                                         value = 0.4))
                     ),
              fluidRow(
                  column(6, checkboxInput("zero", label = "Zero at initial absorbance", value = TRUE)),
      
                  column(3,checkboxInput( "names", label = h5("Well names", value = FALSE))
      
                  
              ),
              fluidRow(
                
                column(6, numericInput("delay",label=h5("Time delay"), step = 20, value=0)),
                 
                column(4, checkboxInput("sqr", label =  "Use time squared", value = TRUE))
                
              
              )),
              
              checkboxInput("pM", label = h4("Calculate rates of zymogen activation in pM/s using constants below", value = FALSE)),
              
              fluidRow(
                  column(5, numericInput("kcat", 
                   label = h5("kcat (s-1) for chromogenic substrate"),
                   value = 60)),
                  
                  column(5, offset=1,  numericInput("Km", 
                   label = h5("Km (mM) for chromogenic substrate"), step = 0.1,
                   value = 0.26))
                      ),
      
              fluidRow(
                  column(6, numericInput("Sub", 
                   label = h5("[S] (mM) for chromogenic substrate"), step = 0.1,
                   value = 0.24)),
      
                  column(5, numericInput("Ext", 
                   label = h5("Absorbance for 1M chromophore"), step = 100,
                   value = 2500))
                      ),

      helpText(h4("Please cite this page if you find it useful, Longstaff C, 2016, Shiny App for calculating zymogen activation rates, version 0.6
               URL address, last accessed", Sys.Date()))
     
   
    
    
  ),
  mainPanel( 
    tabsetPanel(type="tab",
                tabPanel("Plots", 
                         
                         
                         plotOutput(outputId = "myplotAll"),
                         h4(textOutput("text3")),
                         tags$br(),
                         tags$br(),
                         
                         h4(textOutput("text4")),
                         
                         h5(""), tableOutput("resultsTable"), align = "center"),
                
                 
                
                   
                
                tabPanel("Curve", 
                         
                          
                         
                         plotOutput(outputId = "myplot"),
                         
                       
                         
                         #fluidRow(
                           
                         
                          column(5, 
                                 radioButtons(inputId="curveRes", label = "Results to plot", 
                                              choices = c("Absorbance", "Residual"), selected = "Absorbance")
                                 )
                          
                        
                ),
                
                          
                
              
                tabPanel("Raw data", dataTableOutput("contents")),
                       
                
                tabPanel("Help",
                         
                  tags$blockquote(h5("►Load a data file in csv or txt fomat (tab separator)",
                                  tags$br(), 
                                  "►If the columns have headers, check the box",
                                  tags$br(),
                                 "►Select the number of rows to organise the graphs and table",
                                  tags$br(), 
                                  "►All the plots are shown or individual curves can be analysed on the next tab",
                                 tags$br(), 
                                  "►Select the cut off for maximum absorbance",
                                 tags$br(), 
                                 "►Choose how many data points you want to include",
                                 tags$br(),
                                 "►Tick the box if you want to zero each curve at the first absorbance reading",
                                 tags$br(),
                                  "►Select time squared to calculate the rate of zymogen activation in ⌂Abs/sec²",
                                 tags$br(),
                                 "►If time squared is not selected you can calculate simple rates of substrate hydrolysis over time",
                                 tags$br(),
                                 "►With time squared selected, you can also calculate zymogen activation rates in pM/s  if you know the constants for the enzyme on the chromogenic substrate in the boxes below",
                                 tags$br(),
                                 "►For more details on this calculation, see for e.g. Sinnger, V. et al (1999), J Biol Chem, 274, 12414-22",
                                 tags$br(),
                                 "►Note: Data files should not contain any gaps or spaces between characters",
                                 tags$br(),
                                 "►Avoid unusual characters such as % and ' in names",
                                 tags$br(),
                                 "►Code and detailed help notes are available in a Github respository at https://github.com/drclongstaff/"
                                 )
  
  ),
  
                
                  
                  
                  
                  tags$img(src="screenCapSq.png", width=600, height=700)
                  
                )
                
               
                
    )
  )
  
)   
)
