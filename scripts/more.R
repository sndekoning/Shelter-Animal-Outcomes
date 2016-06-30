# ===== More factors! ====

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

# Seed for randomization.
set.seed(28062016)

# Dependencies
library(randomForest)
library(dplyr)
library(tidyr)

# creating full set.
test.data$set <- as.factor("test")
train.data$set <- as.factor("train")
full.data <- bind_rows(test.data, train.data)
full.data$set <- factor(full.data$set)
full.data$Gender <- NA

gender <- unlist(strsplit(full.data$SexuponOutcome, " "))

for (i in vector) {
    
}

m <- matrix(data = gender, 
            ncol = 2,
            byrow = TRUE)



# === Stupid bullshit below ===

# for(i in 38185){
#     if(grepl("Female", x = full.data$SplitSexuponOutcome[3])){
#         full.data$Gender[3] <- "Female"
#     }
# }    
#     #else if(grepl("Male", x = full.data$SplitSexuponOutcome[i])){
#       #  full.data$Gender[i] <- "Male"
#    # }
# #}
# 
# GetSex <- function(data){
#     i <- 
#     if(grepl("Female", x = data[i])){
#         return("Female")
#     }else if(grepl("Male", x = data[i])){
#         return("Male")
#     }else{
#         return("Unknown")
#     }        
# }
# 
# full.data <- mutate(full.data, Gender = GetSex(SplitSexuponOutcome)) 
# 
# full.data$Gender <- apply(full.data$SplitSexuponOutcome, 1, FUN = )