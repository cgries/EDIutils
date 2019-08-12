#' Read data entity names
#'
#' @description
#'     Read Data Entity Names operation, specifying the scope, identifier, 
#'     and revision of the data package whose data entity names are to be 
#'     read in the URI.
#'
#' @usage 
#'     api_read_data_entity_names(
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
#'     (data frame) A data frame containing entity identifiers and name values. 
#'     Each line contains an entity identifier and its corresponding name 
#'     value. Only data entities that the user is authorized to read are 
#'     included.
#'     
#' @examples
#' api_read_data_entity_names('edi.101.1')
#'
#' @export
#'
api_read_data_entity_names <- function(package.id, environment = 'production'){
  
  message(paste('Retrieving data entity names of', package.id))
  
  validate_arguments(x = as.list(environment()))
  
  r <- httr::GET(
    url = paste0(
      url_env(environment),
      '.lternet.edu/package/name/eml/',
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
    col.names = c('id', 'name'),
    as.is = T
  )
  
  output
  
}