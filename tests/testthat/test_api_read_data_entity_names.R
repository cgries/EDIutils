context('Read data entity names')
library(EDIutils)

testthat::test_that('Test for object attributes', {
  
  r <- api_read_data_entity_names(
    package.id = 'edi.275.1',
    environment = 'production'
  )
  
  expect_equal(
    class(r),
    'data.frame'
  )
  
  expect_true(
    all(colnames(r) %in% c('id', 'name'))
  )
  
})
