setwd("/Users/harishagarwal/Desktop/Harish/Data Science Courses/Coursera/Coursera_EDA")

library(tidyverse)

df = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = '?', 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

summary(df)
head(df)

# Converting date column to date type
df$Date = as.Date(df$Date, "%d/%m/%Y")

#Filtering data for the specific period
df1 = df %>% filter(Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

png(filename='plot1.png',width=480,height=480,units='px')

df1 %>% ggplot(aes(x = Global_active_power)) + geom_histogram(color = 'black', fill = 'red', binwidth = 0.5,  boundary = 0) +
  labs(title = "Global_active_power",
       x = "Global Active Power (kilowatts)",
       y = "frequency")


#dev.copy(png, file="plot1.png")
dev.off()

#hist(df1$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
