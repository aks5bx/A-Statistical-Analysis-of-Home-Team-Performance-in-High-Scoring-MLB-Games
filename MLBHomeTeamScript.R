
install.packages("ggplot2")

## Setting Up DataFrames
## In this step, I read in the MLB Data csv into a dataframe in R
mlb = read.csv("MLB.csv", header=TRUE)
mlb[1:35,]

## Baseline Win Percentage
## In this step, I calculate the home team win percentage across all MLB games.
total_games = nrow(mlb)
home_win_pct = sum(mlb$win) / total_games
home_win_pct

## Boxplot
## In this step, I produce a boxplot of runs scored in all MLB games
boxplot(mlb$runs,main=toupper("Runs Scored in Games"), ylab="Runs Scored")

## Set Threshold
## In this step, I set the threshold of what is a high scoring MLB game
high_scoring = quantile(mlb$runs, .75)
high_scoring

## Create Subsetted Data Frames
## In this step, I create dataframes for high scoring games and normal scoring games that are subsets of my main data frame.
## Subset dataframe on high scoring games only (runs >= 12)
high_scoring_games = (mlb[which(mlb$runs >= 12),])
hs_win_pct = sum(high_scoring_games$win) / nrow(high_scoring_games)
hs_win_pct
## Subset dataframe on normal scoring games (runs < 12)
low_scoring_games = (mlb[which(mlb$runs < 12),])
ns_win_pct = sum(low_scoring_games$win) / nrow(low_scoring_games)
ns_win_pct

## Conduct Test
## In this step, I conduct my first two sample z test for proportions.
phat = c(0.5183413, 0.5332244)
n = c(627, 1836)
x = phat*n
z2.prop = prop.test(x, n, alternative="greater", correct=FALSE)
z2.prop

## Create Distribution Graphs
## In this step, I create graphs to visualize the distribution of wins in high and normal scoring games.
library(ggplot2)
## High scoring games
samp_data_hs = high_scoring_games$win
## Plot the sample
samp_df_hs <- data.frame(samp_data_hs)

ggplot(samp_df_hs, aes(x=samp_data_hs)) +
geom_histogram(binwidth=0.5,fill="white",color="black") +
ggtitle("Distribution of Wins: High Scoring Games") +
xlab("Wins (1) and Losses (0)") + ylab("Number of Games")

## Normal scoring games
samp_data_ls = low_scoring_games$win
## Plot the sample
samp_df_ls <- data.frame(samp_data_ls)

ggplot(samp_df_ls, aes(x=samp_data_ls)) +
geom_histogram(binwidth=0.5,fill="white",color="black") +
ggtitle("Distribution of Wins: Normal Scoring Games") +
xlab("Wins (1) and Losses (0)") + ylab("Number of Games")


## Bootstrap Data
## In this step, I produce bootstrapped data and re-compute the win proportions for high and normal scoring games.
## High scoring games
## Determine the number of bootstrap samples
N<-10000
## Draw the bootstrap samples
boot_samp_hs = replicate(N, sample(samp_data_hs, replace=TRUE))
boot_means_hs = apply(boot_samp_hs,2,mean)
sum(boot_means_hs) / 10000

## Normal scoring games
## Determine the number of bootstrap samples
N<-10000
## Draw the bootstrap samples
boot_samp_ls = replicate(N, sample(samp_data_ls, replace=TRUE))
boot_means_ls = apply(boot_samp_ls,2,mean)
sum(boot_means_ls) / 10000

## Conduct Test
## In this step, I conduct my second and final two sample z test for proportions.
phat = c(0.5332244, 0.5183413)
n = c(10000, 10000)
x = phat*n
z2.prop = prop.test(x, n, alternative="greater", correct=FALSE)
z2.prop



