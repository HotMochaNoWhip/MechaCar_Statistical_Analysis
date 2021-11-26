#Deliverable 1
library(dplyr)

mecha_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #import MechaCar data set
head(mecha_table)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_table) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_table)) #generate summary statistics

#Deliverable 2

suspension_table <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) #import Suspension data set
head(suspension_table)

total_summary <- suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary dataframe
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary dataframe grouped by lot

#Deliverable 3

t.test(suspension_table$PSI, mu=1500) #compare all PSI against population mean of 1500
t.test((suspension_table %>% subset(Manufacturing_Lot == 'Lot1'))$PSI,mu=1500)#compare Lot 1 PSI against population mean of 1500
t.test((suspension_table %>% subset(Manufacturing_Lot == 'Lot2'))$PSI,mu=1500)#compare Lot 2 PSI against population mean of 1500
t.test((suspension_table %>% subset(Manufacturing_Lot == 'Lot3'))$PSI,mu=1500)#compare Lot 3 PSI against population mean of 1500
