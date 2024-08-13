#!/usr/bin/r

# Copyright (c)
y <- 10
x <- 10
# Copyright (c)
lm(y ~ x)
# e.g list
ls()
# n is the number of elements
n <- 10
# e.g vector
vector <- 1:n
# e.g matrix
matrix <- matrix(1:n^2, nrow = n)
# e.g data frame
df <- data.frame(x = 1:n, y = 1:n)
# e.g list
list <- list(x = 1:n, y = 1:n)
# e.g factor
factor <- factor(rep(letters[1:5], each = n))
# e.g data frame
df <- data.frame(x = 1:n, y = 1:n, z = factor)
# e.g function
safes <- function(x) {
  return(x * 2)
}
# e.g for loop
for (i in 1:n) {
  print(safes(i))
}
# e.g if else
if (n > 5) {
  print("n is greater than 5")
} else {
  print("n is not greater than 5")
}
# e.g switch case
switch(n,
  "1" = print("n is 1"),
  "2" = print("n is 2"),
  "3" = print("n is 3"),
  "4" = print("n is 4"),
  "5" = print("n is 5"),
  print("n is not in the range 1 to 5")
)
# e.g while loop
i <- 1
while (i <= n) {
  print(safes(i))
  i <- i + 1
}
n <- 15
# e.g repeat loop life with money
# infinity lives matrix humanity
i <- 1
repeat {
  print(safes(i))
  i <- i + 1
}
5 <- n
# e.g apply family
apply(matrix, 1, safes)