# Checking for data.

if(!file.exists("./data/train.csv.gz")){
    print("not all files present, please refer to the kaggle site for the data.")
    browseURL("https://www.kaggle.com/c/integer-sequence-learning/data")
    
} else {
    print("reading in data...")
    test.data <- read.csv(gzfile("./data/test.csv.gz"))
    train.data <- read.csv(gzfile("./data/train.csv.gz"))
    sample.submission <- read.csv(gzfile("./data/sample_submission.csv.gz"))
} 

# Dependencies
library(ggplot2)
library(tidyr)
library(dplyr)
library(stringr)

# Creating full dataset for complete descriptives.
test.data$group <- "test"
train.data$group <- "train"
full.data <- bind_rows(test.data, train.data)
full.data$group <- as.factor(full.data$group)

# Checking for difference in AnimalType for outcome.

outcomes.train <- train.data %>%
            group_by(AnimalType, OutcomeType) %>%
            summarise(NumberOfAnimals = n())

g <- ggplot(data = outcomes.train,
            aes(x = AnimalType,
                y = NumberOfAnimals,
                fill = OutcomeType)) +
    geom_bar(stat = "identity",
             position = "fill",
             color = "black") + 
    labs(x = "Cat or Dog",
         y = "Proportion of Animals",
         title = "Difference in outcome between species.")
g


