#' Read data entity sizes
#'
#' @description
#'     Read Data Entity Sizes operation, specifying the scope, identifier, and 
#'     revision of the data package whose data entity sizes are to be 
#'     retrieved.
#'
#' @usage 
#'     api_read_data_entity_sizes(
#'       package.id, 
#'       environment = 'production'
#'     )
#'
#' @param package.id
#'     (character) Package identifier composed of scope, identifier, and
#'     revision (e.g. 'edi.101.1', 'knb-lter-ntl.303.20).
#' @param environment
#'     (character) PASTA+ environment in which to perform the operation. Can 
#'     be: 'development', 'staging', 'production'.
#'
#' @return
#'     (data frame) A data frame containing entity identifiers and entity 
#'     sizes (in bytes). Each line contains an entity identifier and its 
#'     corresponding size value. Only data entities that the user is authorized 
#'     to read are included.
#'
#' @export
#'

api_read_data_entity_sizes <- function(package.id, environment = 'production'){
  
  message(paste('Retrieving data entity sizes of', package.id))
  
  validate_arguments(x = as.list(environment()))
  
  r <- httr::GET(
    url = paste0(
      url_env(environment),
      '.lternet.edu/package/data/size/eml/',
      stringr::str_replace_all(package.id, '\\.', '/')
    )
  )
  
  r <- httr::content(
    r,
    as = 'text',
    encoding = 'UTF-8'
  )
  
  output <- read.csv(
    text = r,
    header = FALSE,
    col.names = c('id', 'size'),
    as.is = T
  )
  
  output
  
}