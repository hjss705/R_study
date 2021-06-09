install.packages('reshape2')
library(reshape2)
library()

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

head(airquality)

names(airquality) = tolower(names(airquality))
head(airquality)

melt_test = melt(airquality)
head(melt_test)
View(melt_test)

tail(melt_test)

melt_test2 = melt(airquality, id.var = c('month','wind'), measure.vars = 'ozone')
head(melt_test2)
View(melt_test2)


ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

head(airquality)

aq_melt = melt(airquality, id = c('month','day'), na.rm = TRUE)
head(aq_melt)

aq_dcast = dcast(aq_melt, month + day ~ variable)
head(aq_dcast)
View(airquality)
View(aq_melt)
View(aq_dcast)

acast(aq_melt, day~month~variable)

acast(aq_melt, month~ variable, mean)
