#ex 5
mosaicplot(HairEyeColor,
           color = TRUE,
           main = "Hair Eye Color")




#ex 6
santa<-data.frame(belief=c('no belief', 'no belief', 'no belief', 'no belief',
                           'belief', 'belief', 'belief', 'belief',
                           'belief', 'belief', 'no belief', 'no belief',
                           'belief', 'belief', 'no belief', 'no belief'),
                  sibling=c('older brother', 'older brother',
                            'older brother', 'older sister',
                            'no older sibling', 'no older sibling',
                            'no older sibling', 'older sister',
                            'older brother', 'older sister',
                            'older brother', 'older sister',
                            'no older sibling', 'older sister',
                            'older brother', 'no older sibling')
                  
)

mosaicplot(~belief+sibling,
           data = santa,
           color = c("green", "red", "blue"),
           main = "Santa")




library(ggplot2)

#ex 7
tmp<-table(mtcars$gear)
df<-data.frame(tmp)
df

ggplot(df,aes(x=Var1, y=Freq)) + 
  geom_bar(stat="identity",
           width = 0.7,
           fill = "steelblue") +
  ggtitle("?????? ??") + 
  theme(plot.title = element_text(size=25, face="bold", colour = "steelblue")) + 
  labs(x="?????Ǽ?", y="?󵵼?")




#ex 8
tmp<-table(mtcars$cyl)
df<-data.frame(tmp)
df

ggplot(df,aes(x=Var1, y=Freq)) + 
  geom_bar(stat="identity",
           width = 0.7,
           fill = "green") +
  ggtitle("?Ǹ????? ??") + 
  theme(plot.title = element_text(size=25, face="bold")) + 
  labs(x="?Ǹ????? ??", y="?󵵼?")




#ex 9
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5.0)




#ex 10
ggplot(trees,
       aes(x=Girth)) +
  geom_histogram(binwidth = 3.0, fill = "steelblue") + 
  ggtitle("?????? ?ѷ?") +
  theme(plot.title = element_text(size = 25, face = "bold",
                                  colour = "steelblue")) +
  labs(x="?ѷ?", y="?󵵼?")




#ex 11
ggplot(data=mtcars,
       aes(x=mpg, y=wt,
           color = gear)) + 
  geom_point(size=3) + 
  ggtitle("?????? ?߷?")
theme(plot.title = element_text(size = 25, face = "bold",
                                colour = "steelblue"))




#ex 12
ggplot(data=mtcars,
       aes(y=mpg, fill=factor(mtcars$cyl))) +
  geom_boxplot() +
  guides(fill=guide_legend(title="?Ǹ??? ??"))




#ex 13
year<-2015:2026
pop<-c(51014, 52123, 51245, 52261,
       51446, 52388, 51635, 52504,
       51811, 52609, 51973, 52704)
df<-data.frame(year, pop)
ggplot(data=df, aes(x=year, y=pop)) + 
  geom_line(col="red")




#ex 14
year<-c(20144,20151,20152,20153,20154,
        20161,20162,20163,20164,20171,20172,20173)
male<-c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
female<-c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)  
df<-data.frame(year, male, female)
ggplot(data=df) + 
  geom_line(aes(x=year, y=male), col="red") +
  geom_line(aes(x=year, y=female), col="blue")
