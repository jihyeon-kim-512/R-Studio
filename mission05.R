#ex1
setwd("C:/Users/Admin/Desktop/R/DATA")

library(ggplot2)
library(ggmap)
library(readxl)

files <-c("201512","201606","201612","201706","201712")
columns <-c("상가업소번호", "상호명", "상권업종대분류명", "상권업종중분류명", 
            "상권업종소분류명", "시군구명", "행정동명", "경도", "위도")
ds.total <-NULL

for (i in 1 : length(files)) {
  filename <-paste("seoul_", files[i], ".xlsx", sep="")
  cat("read", filename, "...\n")
  
  ds <-read_excel(filename)
  ds <-data.frame(ds)
  ds <-ds[,columns]
  ds$수집연월 <-rep(1, nrow(ds))
  ds.total <-rbind(ds.total, ds)
}

ds.total




#ex2
str(ds.total)
unique(ds.total$수집연월)                 # 수집연월
unique(ds.total$상권업종대분류명)         # 상권업종 대분류
unique(ds.total$상권업종중분류명)         # 상권업종 중분류
unique(ds.total$상권업종소분류명)         # 상권업종 소분류

sum(is.na(ds.total))

ds.201712 <-subset(ds.total, ds.total$수집연월==5)   
dim(ds.201712)

store.level_1 <-aggregate(ds.201712[,1], by=list(대분류
                                                 =ds.201712$상권업종대분류명), FUN=length)
names(store.level_1)[2] <-c("count")



ggplot(store.level_1, aes(x=대분류, y=count)) +
  geom_bar(stat="identity", width=0.7, fill="steelblue") +
  ggtitle("업종별 점포수") +
  theme(plot.title = element_text(color="black", size=14, face="bold"))

store.region <- aggregate(ds.201712[,1], by=list(구이름
                                                 =ds.201712$시군구명), FUN=length)



ggplot(store.region, aes(x=구이름, y=count)) +
  geom_bar(stat="identity", width=0.7, fill="steelblue") +
  ggtitle("구이름") +
  theme(plot.title = element_text(color="black", size=14, face="bold"),
        axis.text.x = element_text(angle = 45))

store.region.loc <- aggregate(ds.201712[,c("경도","위도")],
                              by=list(구이름=ds.201712$시군구명), FUN=mean)
store.region <-data.frame(store.region, store.region.loc[,2:3])




register_google(key='')
cen <-c(mean(store.region$경도), mean(store.region$위도))

map <-get_googlemap(center = cen, 
                    maptype = "roadmap",
                    size = c(640,640),
                    zoom = 11)
gmap <-ggmap(map)

gmap+geom_point(data = store.region,
                aes(x=경도, y=위도, size = count),
                alpha = 0.5,
                col = "red") + 
  scale_size_continuous(range = c(1, 15)) + 
  geom_text(data = store.region,
            aes(x=경도,y=위도),
            size = 3,
            label = store.region$구이름)




store.dong <- aggregate(ds.201712[,1],
                        by=list(동이름=ds.201712$행정동명), FUN=length)

names(store.dong)[2] <-c("count")
store.dong

store.dong <-store.dong[order(store.dong$count, decreasing=T),]
dong.top10 <-store.dong[1:10,]





ggplot(dong.top10, aes(x=reorder(동이름, -count), y=count)) +
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue") +
  ggtitle("점포수 많은 상위 10개동") +
  theme(plot.title = element_text(color = "black",
                                  size = 12,
                                  face = "bold"),
        axis.text.x = element_text(angle = 45))

store.change <- aggregate(ds.total[,1],
                          by=list(년월=ds.total$수집연월,
                                    업종대분류=ds.total$상권업종대분류명), 
                          FUN=length)





head(store.change)
names(store.change)[3] <-c("count")

ggplot(store.change, aes(x=년월, y=count, colours = 업종대분류, 
                         group = 업종대분류)) +
  geom_line() +
  geom_point(size = 6, shape = 19, alpha = 0.5) + 
  ggtitle("엽종별 점포수 변화 (대분류)") +
  ylab("점포수") +
  scale_x_continuous(breaks = 1:5,
                     labels = files) +
  theme(plot.title = element_text(color = "black",
                                  size = 14,
                                  face = "bold"))

