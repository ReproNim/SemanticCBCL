data<-read.delim("abcd_data_sort.txt")

data<-data.frame(t(data))
names <- rownames(data)
rownames(data) <- NULL
data <- cbind(names,data)

first_1<-as.character(data[data$X1==1,1])
first_2<-as.character(data[data$X2==1,1])
first<-append(first_1, first_2)

second_1<-as.character(data[data$X1==2,1])
second_2<-as.character(data[data$X2==2,1])
second<-append(second_1, second_2)

third_1<-as.character(data[data$X1==3,1])
third_2<-as.character(data[data$X2==3,1])
third<-append(third_1, third_2)

fourth_1<-as.character(data[data$X1==4,1])
fourth_2<-as.character(data[data$X2==4,1])
fourth<-append(fourth_1, fourth_2)

fifth_1<-as.character(data[data$X1==5,1])
fifth_2<-as.character(data[data$X2==5,1])
fifth<-append(fifth_1, fifth_2)

johanna=third
satra=first
dave= second
meagan= fourth
sinkim=fifth

write.csv(johanna, file="johanna.txt", row.names = FALSE)
write.csv(satra, file="satra.txt", row.names = FALSE)
write.csv(dave, file="dave.txt", row.names = FALSE)
write.csv(meagan, file="meagan.txt", row.names = FALSE)
write.csv(sinkim, file="sinkim.txt", row.names = FALSE)