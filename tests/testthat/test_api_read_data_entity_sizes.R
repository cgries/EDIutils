context('Read data entity sizes')
library(EDIutils)

testthat::test_that('Test for object attributes', {
  
  r <- api_read_data_entity_sizes(
    package.id = 'edi.275.1',
    environment = 'production'
  )
  
  expect_equal(
    class(r),
    'data.frame'
  )
  
  expect_true(
    all(colnames(r) %in% c('id', 'size'))
  )
  
})
