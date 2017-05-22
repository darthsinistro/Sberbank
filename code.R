#read train, test and macro data sets
train_data <- read.csv("train.csv")
test_data <- read.csv("test.csv")
macro <- read.csv("macro.csv")

#merge train and macro
combined_df <- merge(train_data,macro, by=c("timestamp"))

#check for number of NAs in each column
sort(colSums(is.na(combined_df)))

#removing columns for the 2 highest number of NAs
combined_df <- subset(combined_df, select = -c(provision_retail_space_sqm,provision_retail_space_modern_sqm))

#check pairwise correlation for completed cases
corMatrix <- cor(combined_df[complete.cases(combined_df),sapply(combined_df,is.numeric)])
write.csv(corMatrix,"corm.csv")
#then check in excel

