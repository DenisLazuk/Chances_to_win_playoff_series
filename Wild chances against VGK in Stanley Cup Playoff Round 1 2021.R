# Assign a variable 'n' as the number of remaining games.
n <- 7
# Assign a variable `outcomes` as a vector of possible game outcomes, 
# where 0 indicates a loss and 1 indicates a win for the Wild
outcomes <- sample(c(0,1), n, prob=c(0.6, 0.4), replace = TRUE)
# Assign a variable `l` to a list of all possible outcomes in all remaining games. Use the `rep` function on `list(outcomes)` to create list of length `n`.
l <- rep (list(outcomes), n)
# Create a data frame named 'possibilities' 
# that contains all combinations of possible outcomes for the remaining games.
possibilities <-  expand.grid(l)
# Create a vector named 'results' that indicates whether each row in the data frame 'possibilities' 
# contains enough wins for the Wild to win the series.
results <- rowSums (possibilities) > 3
# Calculate the proportion of 'results' when the Wild wins the series. Print the outcome to the console.
mean (results)
# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000
# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)
# Create an object called `results` that replicates for `B` iterations a simulated series and determines whether that series contains at least three wins for the Wild.
results <- replicate(B, {   
  simulated_games <- sample(c(0,1), 1, prob=c(0.6, 0.4), replace = TRUE)
  sum(simulated_games) > 0
})
# Calculate the frequency out of `B` iterations that the Wild won at least three games in the remainder of the series. Print your answer to the console.
mean (results)
