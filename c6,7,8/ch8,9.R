library(dplyr)

nrow(mtcars)
str(mtcars)
View(mtcars)

filter(mtcars, cyl ==4)

filter(mtcars, cyl >=6 & mpg >20)

head(arrange(mtcars, wt))
arrange(mtcars,wt)
arrange(mtcars,mpg,desc(wt))
head(arrange(mtcars, desc(wt)))

head(select(mtcars, am ,gear))

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

head(mutate(mtcars, years= '1974'))

head(mutate(mtcars, mpg_rank = rank(mpg)))

distinct(mtcars, cyl)
distinct(mtcars, gear)
distinct(mtcars, cyl, gear)

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))
summarise(mtcars, mean(cyl),min(cyl),max(cyl))

gr_cyl = group_by(mtcars, cyl)
summarise(gr_cyl, n())

gr_cyl = group_by(mtcars,cyl)
summarise(gr_cyl, n_distinct(gear))
View(mtcars)

sample_n(mtcars, 10)
sample_frac(mtcars, 0.1)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

group_by(mtcars, cyl) %>% summarise(n())

mp_rank = mutate(mtcars,mpg_rank = rank(mpg))
arrange(mp_rank, mpg_rank)

mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)
