test_list <-list("a" = TRUE, b = 3, c = c("lol", "lal"))
final_list <- list()
for (index in 1:length(test_list)) {
  option_name <- names(test_list)[[index]]
  option_value <- test_list[[index]]
  print(class(option_value))
  final_list[[option_name]] <- option_value
}

#' 
#' 
#' library(opensilexClientToolsR)
#' 
#' 
#' #' experiment_explorer UI Function
#' #'
#' #' @description A shiny Module.
#' #'
#' #' @param id,input,output,session Internal parameters for {shiny}.
#' #'
#' #' @noRd
#' #'
#' #' @importFrom shiny NS tagList
#' mod_experiment_explorer_ui <- function(id) {
#'   ns <- NS(id)
#'   
#'   tagList(
#'     selectInput(inputId = ns("choix_experiment"))
#'   )
#' }
#' 
#' #' experiment_explorer Server Functions
#' #'
#' #' @noRd
#' mod_experiment_explorer_server <-
#'   function(id,
#'            authentification_module,
#'            option_search = list(),
#'            ...) {
#'     moduleServer(id, function(input, output, session) {
#'       ns <- session$ns
#'       reactive({
#'         authentification_module$connect()
#'       })
#'       #################### Voir https://community.rstudio.com/t/pass-reactive-or-static-value-to-the-same-shiny-module/82185/3
#'       
#'       experimentList <- list()
#'       output$choix_experiment <- renderUI({
#'         authentification_module$connect()
#'         experiments_api <- ExperimentsApi$new()
#'         experiments <-
#'           experiments_api$search_experiments(option_search)$data
#'         experiments_df <-
#'           EnvironmentList_to_dataframe(experiments)
#'         experimentList <<-
#'           setNames(experiments_df$uri, experiments_df$name)
#'         
#'         label <- 'Choose an experiment:'
#'         if (isTruthy(input_parameters$multiple)) {
#'           label <- 'Choose one or more experiments:'
#'         }
#'         
#'         updateSelectInput(inputId = ns("choix_experiment"),
#'                           label = label,
#'                           choices = experimentList)
#'       })
#'       
#'       
#'       reactiveExperimentList <- reactive({
#'         experimentList
#'       })
#'       
#'       selected <- reactive({
#'         if (length(experimentList) > 0 && match(input$choix_experiment, experimentList) != 0){
#'           
#'           list( value = input$choix_experiment, label = names(experimentList)[[match(input$choix_experiment, experimentList)]])
#'         } else {
#'           list()
#'         }
#'       })
#'       return(list(
#'         options = reactive({option_search}),
#'         selected = selected,
#'         choices = reactiveExperimentList
#'       ))
#'     })
#'   }

## To be copied in the UI
# mod_experiment_explorer_ui("experiment_explorer_ui_1")

## To be copied in the server
# mod_experiment_explorer_server("experiment_explorer_ui_1")
