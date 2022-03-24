rm(list=ls())

library(readxl)
library(tidyverse)

setwd("~/Downloads/")
df = read_excel("tree.xlsx")

# average of each columns
m = colMeans(df)
m

# standard covariance matrix
cs = df %>%  select(-c(Tree)) %>% cov()
cs

# scatter plot
plot(df %>% select(-c(Tree)))

# 3d scatter plot
library(lattice)
cloud(N ~ E * W, data=df %>% select(-c(Tree)), main="3D scatter plot")

# parallel plot
parallel(df %>% select(-c(Tree)), main="Parallel plot")

# star plot
stars(df %>% select(-c(Tree)), labels=seq(1:28), main="Star plot")

# face plot
# install.packages("aplpack")
library("aplpack")
faces(df %>% select(-c(Tree)), main="Face plot", ncolors=0)

 
