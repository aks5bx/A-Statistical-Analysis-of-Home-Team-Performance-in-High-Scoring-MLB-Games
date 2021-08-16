# An Analysis of Home Team Performance in High-Scoring MLB Games

## Project Overview
### Introduction 
In Major League Baseball, America’s premier baseball league, the home team is
considered to have an advantage by virtue of having the support of the crowd. This is backed up
by years of statistics that show that teams, almost always, have a higher winning percentage
playing at home versus playing on the road. However, in this report, we explore a more nuanced
question: do home teams have an advantage in high scoring games compared to in normal
scoring games? 

Before running any statistical tests or analyses, we hypothesize that indeed when
games are high scoring, the home team is especially at an advantage. We claim this because high
scoring games may involve many swings in leads and bursts of offense, which the home crowd
can help sway in the favor of their home team. Additionally, as more runs are scored, the home
crowd perhaps becomes more rambunctious, energizing the home team. To test this beyond just
theory, we move on to the methodology of this analysis. 

### Methodology/Roadmap

In order to test our hypothesis, we use a dataset, that will from now on be referenced as
MLB Data. This dataset has information on almost every game in the 2016 MLB season (it does
not include unfinished games and other anomalies). It contains the number of runs scored, and
whether or not the home team one, along with other extraneous independent variables. MLB
Data contains over 2,000 games from the season and was scraped from baseballreference.com, a
reputable website for baseball information. Thus we claim that MLB Data is a trustworthy data
set. A more detailed explanation of the data set can be found in the appendix. 

Testing the aforementioned hypothesis is challenging because as noted, the home team
almost always has a built-in advantage. Thus, we conduct this analysis by first noting that all
winning percentages must be evaluated relatively. Then, we subset MLB Data on games that
were high scoring and on games that were normal scoring and check to see if the home team win
percentage is higher when games are high scoring compared to when games are normal scoring;
in other words we check to see if the home team has an added advantage when the games are
high scoring. 

Finally, if there appears to be a significant relationship, we will attempt to create a
model that will predict the likelihood of the home team winning based on the number of runs
scored to see if we can further quantify any correlation. All of these steps are elaborated upon in
the analysis section. 

### Analysis 

We begin by defining the built-in advantage that the home team has in MLB games. This
is a valuable benchmark because it tells us, across all MLB games, the proportion of games that
are won by the home team. In order to do this, we count the number of games in MLB Data, sum
the number of wins by the home team, and find the proportion of wins to total games. This value
is reported as 0.529 (rounded). 

The next step is to define a threshold for a “high scoring” game. The figure below, Figure
One, graphically shows the distribution of the runs scored in all MLB games. Based on this
graph, the 75th percentile seems like a reasonable threshold (denoted by the upper boundary of
the box) as it is clearly above the mean but not too close to the unusually high values signified by
the circles towards the top of the graph.



## Findings
The findings are presented in a PDF report that can be found in this repository. 
