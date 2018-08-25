# Univerisdad del Valle de Guatemala
# Data Science 1 - Seccion 10
# Juan Andres Garcia - 15046
# Laboratorio 1  

#setwd("~/Sync/DATOS/DATA/LAB1")

test<-read.csv("test.csv")
train<-read.csv("train.csv")
sample<-read.csv("sample_submission.csv")

a<-vector()
ntrain<-as.data.frame(train$Id)
colnames(ntrain)<-colnames(train[1])
for(i in 2:length(train)){
  if(is.numeric(train[,i])){
    a<-train[,i]
    ntrain<-cbind(ntrain,a)
    colnames(ntrain)[length(ntrain)]<-colnames(train[i])
  }
}


a<-vector()
ftrain<-as.data.frame(train$Id)
colnames(ftrain)<-colnames(train[1])
for(i in 2:length(train)){
  if(is.factor(train[,i])){
    a<-train[,i]
    ftrain<-cbind(ftrain,a)
    colnames(ftrain)[length(ftrain)]<-colnames(train[i])
  }
}


cvars<-c("Discreta","Continua","Categórica","Discreta","Discreta","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Discreta","Discreta","Discreta","Discreta","Categórica","Categórica","Categórica","Categórica","Categórica","Discreta","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Discreta","Categórica","Discreta","Discreta","Discreta","Categórica","Categórica","Categórica","Discreta","Discreta","Discreta","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Categórica","Discreta","Categórica","Categórica","Discreta","Categórica","Discreta","Discreta","Categórica","Categórica","Categórica","Discreta","Discreta","Discreta","Discreta","Discreta","Discreta","Categórica","Categórica","Categórica","Discreta","Discreta","Discreta","Categórica","Categórica")
vars<-cbind(vars,cvars)

cors<-vector()
b1<-vector()
b2<-vector()
b3<-vector()
b4<-vector()
for(i in 1:length(a)){
  b1<-a[i]
  b2[i]<-max(b1[b1<1])
  b3[i]<-row.names(b1)[b1==b2[i]]
  b4[i]<-colnames(a)[i]
}
cors<-as.data.frame(cbind(b4,b2,b3))
colnames(cors)<-c("Variable","Correlacion","Variable Cor")

scors<-a["SalePrice",c(-1,-38)]
