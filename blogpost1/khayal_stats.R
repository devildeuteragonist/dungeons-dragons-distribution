# PLAIN R SCRIPT - CODE TO INCLUDE IN DND BLOGPOST 1 

## SIMULATING OUR DATA
# DND stats calculator 
set.seed(472384) # to guarantee same output every time 
dnd_stats <- function(){
  dnd_single_stat <- function(){ # this function will create ONE of our stats. 
    dnd_roll <- sample(1:6, 4, replace=TRUE) |> sort()
    numbers_final <- dnd_roll[-1]
    sum(numbers_final)
  }
  six_stats <- replicate(6, dnd_single_stat()) # this function will run the single_stat function six times. then, it will put each new output of single_stat into a vector called six_stats - now we've created a list of six base stats.  
  six_stats # printing the vector six_stats (so we can see it)
} 
dnd_stats()

# function that checks if the output of dnd_stats() returns all values 13 or above
set.seed(472384) # to guarantee that dnd_stats() here has the same output as dnd_stats() above 
dnd_teens <- function(){
  dnd_stat_vector <- dnd_stats()
  dnd_stats_above13 <- dnd_stat_vector[dnd_stat_vector >= 13]
  if(length(dnd_stats_above13) == 6)
    return(TRUE)
  else
    return(FALSE)
}
dnd_teens()

# probability of dnd_teens() returning TRUE 
set.seed(472384)
out <- replicate(3500, dnd_teens()) # run dnd_teens() 3500 times 
mean(out) # calculating the mean of all the 1s and 0s  

# doing what we did above 600 times to create artificial data and plotting it 
set.seed(472384)
out_function <- function(){ 
  out <- replicate(1000, dnd_teens())
  mean(out)
}
p_dist <- replicate(600, out_function())


### CALCULATING A CONFIDENCE INTERVAL
# sample mean and sample standard deviation 
sample_mean <- mean(p_dist)
sample_stdev <- sd(p_dist)

# calculating the 95% confidence interval
t_score = qt(0.025, 599) # we are using a two-sided t-test. 
# im too tired. i need to sleep. 

### VISUALIZING OUR DATA
# rescaling data so it doesnt frick with the density on the histogram  
p_dist_transform <- p_dist*1000

# calculating parameters for a gaussian distribution 
mu_hat_1 <- mean(p_dist_transform) # we don't know population mean so sample mean is estimate
sigma_hat_1 <- sd(p_dist_transform) # same case here with stdev
mu_hat_1
sigma_hat_1

# plotting our estimated normal distribution curve on top of our histogram 
hist(p_dist_transform, breaks=20, freq=FALSE)
curve(dnorm(x, mean=mu_hat_1, sd=sigma_hat_1), add = TRUE, lwd = 3, col = "#110bdd")
box()
