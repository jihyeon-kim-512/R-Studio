#ex1
library(ggmap)
register_google(key='')

gc<-geocode(enc2utf8("서울시청"))
gc
cen<-as.numeric(gc)
cen
map<-get_googlemap(center = cen, maptype = 'roadmap', markers = gc, size = c(600, 600), zoom = 17)
ggmap(map)




#ex2
cen<-c(127.397692, 36.337058)
cen
map<-get_googlemap(center = cen, maptype = 'roadmap', zoom = 9)
ggmap(map)




#ex3
office.name <- c('강남구청','동작구청','서초구청','송파구청','양천구청','영등포구청')
gc<-geocode(enc2native(office.name))
cen<-colMeans(as.matrix(gc))
cen
map<-get_googlemap(center = cen, size=c(640,640), markers = gc, zoom = 11, maptype = 'roadmap')
gmap<-ggmap(map)
gmap+geom_text(data = data.frame(gc),
               aes(x=lon, y=lat),
               size = 3,
               label = office.name)




#ex4
office.name <- c('대구광역시','부산광역시','대전광역시','인천광역시','광주광역시','울산광역시')
gc<-geocode(enc2native(office.name))
cen<-colMeans(as.matrix(gc))
cen
map<-get_googlemap(center = cen, size=c(640,640), markers = gc, zoom = 7, maptype = 'roadmap')
gmap<-ggmap(map)
gmap+geom_text(data = data.frame(gc),
               aes(x=lon, y=lat),
               size = 3,
               label = office.name)




#ex5
library(ggmap)
register_google(key='')

ds.tot <- read.csv("C:\\Users\\...\\2016년_시도_시군구별_월별_교통사고.csv",header=T)
ds.seoul <- subset(ds.tot, ds.tot$시도=='서울')

ds.year <- aggregate(ds.seoul[,'발생건수'], 
                     by=list(시군구=ds.seoul$시군구),FUN=sum)
ds.year

gc <- geocode(enc2utf8(as.vector(ds.year$시군구)))    
gc
cen <- colMeans(as.matrix(gc))                  
map <- get_googlemap(center=cen,
                     size=c(640,640),
                     zoom=11,
                     maptype='roadmap')      
gmap <- ggmap(map)                        
gmap+geom_point(data=data.frame(gc),                        
                aes(x=lon,y=lat,size=ds.year$x),
                alpha=0.5, 
                col="red") +
  scale_size_continuous(range = c(1, 14))     




