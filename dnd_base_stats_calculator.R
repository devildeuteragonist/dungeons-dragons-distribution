# dungeons and dragons: rolling character stats
# a simple calculator by finity_cardinal in 'r'
# i'm 99.9% certain a better version of this calculator exists. 
# i still wanted to see if i could create this function from scratch...
dnd_single_stat <- function(){
  dnd_roll <- sample(1:6, 4, replace=TRUE) |> sort()
  numbers_final <- dnd_roll[-1]
  sum(numbers_final)
}
dnd_stats <- c(replicate(6, dnd_single_stat()))
