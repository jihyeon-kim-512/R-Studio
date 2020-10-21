#wordCloud
#ex_10-1.txt
install.packages('wordcloud')
library(wordcloud)
library(KoNLP)
library(RColorBrewer)

setwd("C:/Users/Admin/Desktop/R/DATA")
text1<-readLines("ex_10-1.txt", encoding = "UTF-8")

buildDictionary(ext_dic = "woorimalsam")
pal2 <-brewer.pal(8,"Dark2")


#‘ex_10-1.txt’
noun <-sapply(text1, extractNoun, USE.NAMES = F)
noun1 <-unlist(noun)

# 무의미한 단어 제거
noun1 <- noun1[nchar(noun1)>1]    # 1글자 단어 제거
noun1 <- gsub("들이","", noun1)   # ‘하지’ 제거 
noun1 <- gsub("10","", noun1)  
noun1 <- gsub("이명","", noun1)   

wordcount <- table(noun1)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=5,
          random.order=F,
          rot.per=.1,
          colors=pal2)




#‘ex_10-2.txt’
text2<-readLines("ex_10-2.txt", encoding = "UTF-8")

noun <-sapply(text2, extractNoun, USE.NAMES = F)
noun2 <-unlist(noun)

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거
noun2 <- gsub("10","", noun2) 

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=5,
          random.order=F,
          rot.per=.1,
          colors=pal2)




#‘ex_10-3.txt’
text3<-readLines("ex_10-3.txt", encoding = "UTF-8")

noun <-sapply(text3, extractNoun, USE.NAMES = F)
noun3 <-unlist(noun)

# 무의미한 단어 제거
noun3 <- noun3[nchar(noun3)>1]    # 1글자 단어 제거
noun3 <- gsub("10","", noun3) 

wordcount <- table(noun3)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=5,
          random.order=F,
          rot.per=.1,
          colors=pal2)




#‘ex_10-4.txt’
text<-readLines("ex_10-4.txt", encoding = "UTF-8")

noun <-sapply(text, extractNoun, USE.NAMES = F)
noun2 <-unlist(noun)

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거
noun2 <- gsub("10","", noun2) 
wordcount <- table(noun2)         # 단어 빈도수 계산
wordcount

wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)