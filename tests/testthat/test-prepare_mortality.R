test_that("prepare_mortality converts wide to long format", {

  test_data <- data.frame(
    iso = "CAN",
    X2000 = 10,
    X2001 = 20
  )

  result <- prepare_mortality(test_data, "mortality")

  expect_equal(result$year, c(2000L, 2001L))
  expect_equal(result$mortality, c(10, 20))
  expect_equal(nrow(result), 2)
})