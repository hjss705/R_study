20 %/% 7
20 %% 4
4 ^ 4
4 ** 2

4 >2
4 < 3

x <-  1:3
y <-  3:1
b <- (x>0)
c <- (y>1)
a <- (x>0) & (y>1)
n <- (x>0) | (y>1)

data1 <- data.frame(x,y,b,c,a,n)
View(data1)

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c('F','M','F','M','M','F','F','F','M','F')
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AREA <- c('서울','경기','제주','서울','서울','서울','경기','서울','인천','경기')
AMT17 <- c('1,300,000','450,000','275,000','400,000','845,000','42,900','150,000','570,000','930,000','520,000')
Y17_CNT <- c(50,25,10,8,30,1,2,10,4,17)
AMT16 <- c('100,000','700,000','50,000','125,000','760,000','300,000','130,000','400,000','250,000','550,000')
Y16_CNT <- c(40.,30,5,3,28,6,2,7,2,16)

data2 <- data.frame(ID,SEX,AGE,AREA,AMT17,Y17_CNT,AMT16,Y16_CNT)
View(data2)

write.table(data2, file = 'C:/Rproject/data2.txt')
data3 <- read.table('C:/Rproject/data2.txt', header = TRUE)
View(data3)

install.packages('writexl')
library(writexl)
install.packages('readxl')
library(readxl)
write_xlsx(data2 , path='data3.xlsx')
View(data3)
data3 <- read_excel('C:/Rproject/data3.xlsx')

View(data3)
str(data3)
dim(data3)
ls(data3)

install.packages('dplyr')
library(dplyr)
data3 <- rename(data3, Y17_AMT = AMT17, Y16_AMT = AMT16)
View(data3)

data3$AMT = data3$Y17_AMT + data3$Y16_AMT
data3$CNT <- data3$Y17_CNT + data3$Y16_CNT
View(data3)

data3$AVG_AMT = data3$AMT / data3$CNT
View(data3)

data3$AGE50_YN = ifelse(data3$AGE >=50,'Y','N')
View(data3)

data3$AGE_GR10 = ifelse(data3$AGE >= 50, 'A1.50++',
                        ifelse(data3$AGE >= 40, 'A2.4049',
                               ifelse(data3$AGE >= 30, 'A3.3039',
                                      ifelse(data3$AGE >= 20, 'A4.2029',
                                             'A5.0019'))))
View(data3)

ifelse(data3$AGE >= 1 & data3$AGE <= 18, 'A',
       ifelse(data3$AGE >=19 & data3$AGE <= 40,'B',
              ifelse(data3$AGE >= 41 & data3$AGE <= 60,'C','D')))
#선택한 변수 추출
data3 %>% select(ID)
data3 %>% select(ID, AREA, Y17_CNT)
# 선택한변수 빼기
data3 %>% select(-AREA)
data3 %>% select(-AREA,-Y17_CNT)
#조건에 만족하는 값을 추출
data3 %>% filter(AREA =='서울')
data3 %>% filter(AREA =='서울' & Y17_CNT >= 10)
#변수를 오름차순으로 정렬
data3 %>% arrange(ANE)
#변수를 내림차순으로 정렬
data3 %>% arrange(desc(AGE))
#변수 중첩 정렬
data3 %>% arrange(AGE,desc(Y17_AMT))
#합계
data3 %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))
data3 %>% summarise(TOT_Y17_CNT = sum(Y17_CNT))
View(data3)
#그룹별 합계
data3 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))
data3 %>% group_by(SEX) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))


ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

###시험###
#1
install.packages('readxl')
library(readxl)
mid_exam = read_excel('C:/Rproject/mid_exam.xlsx')
mid_exam
install.packages('dplyr')
library(dplyr)
mid_exam = rename(mid_exam, MATH_MID=MATH, ENG_MID=ENG)
View(mid_exam)
#2
final_exam = read_excel('C:/Rproject/final_exam.xlsx')
final_exam = rename(final_exam, MATH_FINAL=MATH , ENG_FINAL=ENG)
View(final_exam)
#3
total_exam <- inner_join(mid_exam , final_exam, by = 'ID')
View(total_exam)

#4
total_exam$MATH_AVG = (total_exam$MATH_MID + total_exam$MATH_FINAL)/2
total_exam$ENG_AVG = (total_exam$ENG_MID + total_exam$ENG_FINAL)/2
View(total_exam)
#5
total_exam$TOTAL_AVG = (total_exam$MATH_MID + total_exam$MATH_FINAL +
                          total_exam$ENG_MID + total_exam$ENG_FINAL)/4
View(total_exam)

#6
mean(total_exam$MATH_AVG)
mean(total_exam$ENG_AVG)

#7
total_exam %>% filter(MATH_MID >=80 & ENG_MID >=90)
filter(total_exam, MATH_MID >=80 & ENG_MID >=90)


ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

ID = c(2,4,5,9)
SEX = c('m','m','m','m')
AGE = c(40,50,27,20)
AREA = c('경기','서울','서울','인천')
AMT17 = c('450,000','400,000','840,000','930,000')
Y17_CNT = c(25,8,30,4)
AMT16 = c('700,000','125,000','760,000','250,000')
Y16_CNT = c(30,3,28,2)

Sample2_m_history = data.frame(ID,SEX,AGE,AREA,AMT17,Y17_CNT,AMT16,Y16_CNT)
View(Sample2_m_history)

ID = c(1,3,6,7,8,10)
SEX = c('f','f','f','f','f','f')
AGE = c(50,28,23,56,47,38)
AREA = c('서울','제주','서울','경기','서울','경기')
AMT17 = c('1,300,000','275,000','42,900','150,000','570,000','520,000')
Y17_CNT = c(50,10,1,2,10,17)
AMT16 = c('100,000','50,000','300,000','130,000','400,000','550,000')
Y16_CNT = c(40,5,6,2,7,16)

Sample3_f_history = data.frame(ID,SEX,AGE,AREA,AMT17,Y17_CNT,AMT16,Y16_CNT)
View(Sample3_f_history)

write_xlsx(Sample2_m_history , path ='C:/Rstudy/Sample2_m_history.xlsx')
write_xlsx(Sample3_f_history , path ='C:/Rstudy/Sample3_f_history.xlsx')

View(Sample2_m_history)
View(Sample3_f_history)

m_history = Sample2_m_history
f_history = Sample3_f_history


data3_bindjoin = bind_rows(m_history, f_history)
View(data3_bindjoin)


ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
library(readxl)
jeju_y17_history = read_excel('C:/Rstudy/Sample4_y17_history.xlsx')
jeju_y16_history = read_excel('C:/Rstudy/Sample5_y16_history.xlsx')
View(jeju_y16_history)
View(jeju_y17_history)


bind_col = left_join(jeju_y17_history, jeju_y16_history, by = 'ID')
View(bind_col)

bind_col_inner = inner_join(jeju_y17_history, jeju_y16_history, by='ID')
View(bind_col_inner)

bind_col_full = full_join(jeju_y17_history, jeju_y16_history, by = 'ID')
View(bind_col_full)

x1 = c(1,2,NA,4,5)
x1
x1 * 10
is.na(x1)
table(is.na(x1))
sum(x1)
sum(x1,na.rm=T)

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

install.packages('psych')
library(psych)

x1 = c(1,2,3,4,5,6,100)
x1
mean(x1)
median(x1)

x2 = c(1,2,3,4,5,100)
x2
median(x2)
max(x2)
min(x2)
range(x2)

quantile(x2)
quantile(x2, probs = 0.25)
quantile(x2, probs = 0.5)
quantile(x2, probs = 0.75)
quantile(x2, probs = 0.8)
quantile(x2, probs = 0.9)

var(x2)
sd(x2)
kurtosi(x2)
skew(x2)

summary(x2)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
library(readxl)
exdata1 = read_excel('C:/Rstudy/Sample.xlsx')
View(exdata1)

install.packages('descr')
library(descr)

freq_test = freq(exdata1$AREA, plot = F)
View(freq_test)

freq_test2 = freq(exdata1$AREA)

exdata1
stem(exdata1$AGE)

exdata1
hist(exdata1$AGE)
hist(exdata1$AGE, xlim = c(0, 80) , ylim = c(0,10) , main = '나이분포')

exdata1
freq(exdata1$SEX, plot = T , main ='성별')

dist_sex = table(exdata1$SEX)
dist_sex
barplot(dist_sex)
barplot(dist_sex, ylim = c(0,8))
barplot(dist_sex, ylim = c(0,8), main = 'BARPLOT', xlab ='SEX',ylab = 'FREQUENCY' , names = c('female','male'),col = c('red','navy'))


boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim= c(0,60), main = 'boxplot',names = c('17년건수','16년건수'), col = c('green','yellow'))
y1 = c(1,2,3,4,5,6,7,8,9,10,20,25)
boxplot(y1)
