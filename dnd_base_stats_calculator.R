# dungeons and dragons: rolling character base stats.
# a simple calculator by finity_cardinal in 'r'
# i'm 99.9% certain a better version of this calculator exists. 
# i still wanted to see if i could create this function from scratch...
dnd_single_stat <- function(){
  dnd_roll <- sample(1:6, 4, replace=TRUE) |> sort() # roll four six-sided dice, sort outputs in order
  numbers_final <- dnd_roll[-1] # drop the lowest output 
  sum(numbers_final) # sum up the remaining outputs 
}
dnd_stats <- c(replicate(6, dnd_single_stat())) # repeat this process six times 
# now you have supplied a set of 6 base stats for your character. 
# to view the values, punch 'dnd_stats' into your r/rstudio console and hit enter after running the function.
