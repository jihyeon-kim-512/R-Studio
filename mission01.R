install.packages("treemap")

library(treemap)

us<-data.frame(state.x77, state.division)
us
us<-data.frame(us, state=rownames(us))
us
head(us)




#ex 1-1
treemap(us,
        index = c("state.division", "state"),
        vSize = "Population",
        vColor = "Income",
        type = "value",
        bg.labels = "yellow",
        title = "US")




#ex 1-2
treemap(us,
        index = c("state.division", "state"),
        vSize = "HS.Grad",
        vColor = "Murder",
        type = "value",
        bg.labels = "yellow",
        title = "US")




#ex 1-3
symbols(us$Income, us$Illiteracy,
        circles = us$Population,
        inches = 0.3,
        fg = "white",
        bg="green",
        lwd = 1.5,
        xlab = "income",
        ylab = "illuteracy",
        main = "Income and Illiteracy")
text(us$Income, us$Illiteracy,
     us$state,
     cex = 0.6,
     col = "brown")




#ex 1-4
symbols(us$Illiteracy, us$Murder,
        circles = us$Area,
        inches = 0.3,
        fg = "white",
        bg="green",
        lwd = 1.5,
        xlab = "illiteracy",
        ylab = "murder",
        main = "Illiteracy and Murder")
text(us$Illiteracy, us$Murder,
     us$state,
     cex = 0.6,
     col = "brown")




#ex 2-1
group<-c()
for(i in 1 : nrow(swiss)) {
  if(swiss$Education[i] <= 6) {
    group[i] <- "LOW"
  } else if(swiss$Education[i] >= 13) {
    group[i] <- "HIGH"
  } else {
    group[i] <- "MID"
  }
}
sw <- data.frame(swiss, state=rownames(swiss), group)
treemap(sw,
        index = c("group", "state"),
        vSize = "Fertility",
        vColor = "Agriculture",
        type = "value",
        bg.labels = "yellow",
        title = "SWISS")




#ex 2-2
group<-c()
for(i in 1 : nrow(swiss)) {
  if(swiss$Education[i] <= 6) {
    group[i] <- "LOW"
  } else if(swiss$Education[i] >= 13) {
    group[i] <- "HIGH"
  } else {
    group[i] <- "MID"
  }
}
sw <- data.frame(swiss, state=rownames(swiss), group)
treemap(sw,
        index = c("group", "state"),
        vSize = "Catholic",
        vColor = "Examination",
        type = "value",
        bg.labels = "yellow",
        title = "SWISS")




#ex 3
symbols(swiss$Fertility, swiss$Agriculture,
        circles = swiss$Education,
        inches = 0.3,
        fg = "white",
        bg="green",
        lwd = 1.5,
        xlab = "fertility",
        ylab = "agriculture",
        main = "Fertility and Agriculture")
text(swiss$Fertility, swiss$Agriculture,
     rownames(swiss),
     cex = 0.6,
     col = "brown")




#ex 4
symbols(trees$Girth, trees$Height,
        circles = trees$Volume,
        inches = 0.5,
        fg = "white",
        bg="blue",
        lwd = 1.5,
        xlab = "girth",
        ylab = "height",
        main = "Girth and Height")
text(trees$Girth, trees$Height,
     1:nrow(trees),
     cex = 0.6,
     col = "brown")
