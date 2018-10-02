setwd("/Users/harishagarwal/Desktop/Harish/Data Science Courses/Coursera/Coursera_EDA")

library(tidyverse)
library(lubridate)

df = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = '?', 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

summary(df)
head(df)

# Converting date column to date type
df$Date = as.Date(df$Date, "%d/%m/%Y")

#Filtering data for the specific period
df1 = df %>% filter(Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

df1$DateTime = paste(df1$Date, df1$Time, sep= " ")
df1$DateTime = as.POSIXct(df1$DateTime)

df1$Day = wday(df1$Date, label = T)
unique(df1$Day)
#head(df1)

library(scales)
#df1 %>% ggplot(aes(x= DateTime, y= Global_active_power)) + geom_line() + scale_x_datetime(breaks = date_breaks("day"), labels = date_format(unique("%d")))

png(filename='plot2.png',width=480,height=480,units='px')
plot(x = df1$DateTime, y= df1$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")


#dev.copy(png, file="plot2.png")
dev.off()
