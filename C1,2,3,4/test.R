x <- 10
x

x1 <- c(10,30,50)
x1

x2 <- c(20:27)
x2

x3 <- seq(15,23)
x3

x4 <- seq(1, 10, by= 4)
x4

y <- 'HI'
y

y1 <- c('hello','world')
y1

y2 <- c('open','source')
y2

ex_vector <- c(-1,0,1)
ex_vector

ex_vector2 <- c('hello','Hi~!')
ex_vector2
str(ex_vector2)

ex_vector3 <- c('2','4')
str(ex_vector3)  

ex_vector4 <- c(TRUE,FALSE,TRUE)
ex_vector4
str(ex_vector4)


x <- c(1,2,3,4,5,6)
matrix(x, nrow = 2, ncol =3)
matrix(x, nrow = 3, ncol =2)

x1 <- c(1,2,3,4,5,6,7,8)
matrix(x1, nrow = 2, ncol =4)
matrix(x1, nrow = 4, ncol =2, byrow=T)

y <- c(1,2,3,4,5,6)
array(y, dim=c(2,2,3))


list1 <- list(c(1,2,3),'hello')
list1
str(list1)

id <- c(1,2,3,4,5)
SEX <- c('F','M','F','M','M')
AGE <- c(50,40,30,20,25)
AREA <- c('서울','경기','수원','대구','부산')

dataframe_ex <- data.frame(id,SEX,AGE,AREA)
dataframe_ex
str(dataframe_ex)
View(dataframe_ex)

install.packages('readxl')
library(readxl)

excel_data_ex <- read_excel("C:/Rproject/data_ex.xls")
View(excel_data_ex)

ex_data <- read.table("C:/Rproject/data_ex.txt",  header= TRUE, nrows = 5)
View(ex_data)

ex_data1 <- read.table("C:/Rproject/data_ex1.txt",  header= TRUE, sep = ',')
View(ex_data1)

ID <- c(1,2,3,4,5)
SEX <- c('F','M','F','M','M')
data_ex <- data.frame(ID = ID, SEX = SEX)

save(data_ex, file = 'data_ex.rda')

load("C:/Rproject/data_ex.rda")
View(data_ex)

ID <- c(1,2,3,4,5)
SEX <- c('f','m','f','m','f')
data_ex <- data.frame(ID = ID, SEX = SEX)
write.csv(data_ex, file = "C:/Rproject/data_ex.csv", quote = FALSE)
View(data_ex)
