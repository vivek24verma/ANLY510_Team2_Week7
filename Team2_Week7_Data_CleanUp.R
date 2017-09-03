dirty <- read.csv("/Users/mariia/Desktop/anly510/dirty_data.csv", header=TRUE, na.strings=c("","NA"))
names(dirty)
install.packages("zoo")
require(zoo)
install.packages("data.table")
library(data.table)
dirty_no_missing = as.data.table(dirty)
setDT(dirty_no_missing)[,Area := na.locf(na.locf(Area, na.rm=FALSE), fromLast=TRUE) , by = Year]
dirty_no_missing
dirty_no_missing_no_col <-dirty_no_missing
dirty_no_missing_no_col$Strange.HTML <- NULL
duplicated(dirty_no_missing_no_col)
which(duplicated(dirty_no_missing_no_col))
dirty_no_missing_no_col <- dirty_no_missing_no_col[dirty_no_missing_no_col$Street != dirty_no_missing_no_col$`Street 2`]
