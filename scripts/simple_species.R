# ===== Simple Species randomForest Model === 

# Getting data.
if(!file.exists("./data/train.csv.gz")){
    print("not all files present, please refer to the kaggle site for the data.")
    browseURL("https://www.kaggle.com/c/integer-sequence-learning/data")
    
} else {
    print("reading in data...")
    test.data <- read.csv(gzfile("./data/test.csv.gz"))
    train.data <- read.csv(gzfile("./data/train.csv.gz"))
    sample.submission <- read.csv(gzfile("./data/sample_submission.csv.gz"))
} 

# Seed
set.seed(27062016)

# Dependencies
library(rpart)
library(tidyr)

# Running the model.

species.model <- rpart(formula = OutcomeType ~ AnimalType + SexuponOutcome,
                      data = train.data,
                       method = "class")

# Creating the prediction.
prediction <- predict(species.model, test.data)

# Save the solution to a dataframe
solution <- data.frame(ID = test.data$ID,
                       "Prediction" = prediction)

# Setting the proper heading names
name <- c("ID", "Adoption", "Died", "Euthanasia", "Return_to_owner", "Transfer")
names(solution) <- name

# Write it to file
if(!dir.exists("./solutions")){
    dir.create("./solutions")
}
write.csv(solution, "./solutions/simple_solution.csv", row.names = F)