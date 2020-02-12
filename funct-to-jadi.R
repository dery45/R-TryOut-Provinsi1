library(dplyr)
library(tidyr)
library(tabulizer)

location <- 'NilaiSiswa-2.pdf'

func_to <- function(dataawal, df2){
  result <- list()
  for (i in dataawal){
    out <- as.data.frame(extract_tables(location, page = i))
    result[[i]] <- out
  }
  df <-bind_rows(result)
  df <- df[-which(df$X2 == ""), ]
  df <- df[-which(df$X2 == "USERNAME"), ]
  str(df)
  df2  <- as.data.frame(df)
  df2$X5 <- as.numeric(df2$X5)
  df2$X6 <- as.numeric(df2$X6)
  df2$X7 <- as.numeric(df2$X7)
  df2$X8 <- as.numeric(df2$X8)
  df2$X9 <- as.numeric(df2$X9)
  df2$X10<- as.numeric(df2$X10)
  df2$X11<- as.numeric(df2$X11)
  df2 <- as.data.frame(df2)
  colnames(df2) <- c("No","Username","Siswa","Sekolah",
                     "Indo","Mtk","Ing",
                     "Kejuruan","Jumlah","PeringkatKab",
                     "PeringkatProv")
  df2 <- as.data.frame(df2)
}

func_to_sekolah <- function(dataawal, df2, putnamasekolah){
  result <- list()
  for (i in dataawal){
    out <- as.data.frame(extract_tables(location, page = i))
    result[[i]] <- out
  }
  df <-bind_rows(result)
  df <- df[-which(df$X2 == ""), ]
  df <- df[-which(df$X2 == "USERNAME"), ]
  str(df)
  df2  <- as.data.frame(df)
  df2$X5 <- as.numeric(df2$X5)
  df2$X6 <- as.numeric(df2$X6)
  df2$X7 <- as.numeric(df2$X7)
  df2$X8 <- as.numeric(df2$X8)
  df2$X9 <- as.numeric(df2$X9)
  df2$X10<- as.numeric(df2$X10)
  df2$X11<- as.numeric(df2$X11)
  df2$X12<- NULL
  colnames(df2) <- c("No","Username","Siswa","Sekolah",
                     "Indo","Mtk","Ing",
                     "Kejuruan","Jumlah","PeringkatKab",
                     "PeringkatProv")
  df2 <- as.data.frame(df2)
  df2 <- as.data.frame(df2)
  df2 <- subset(df2,Sekolah==putnamasekolah, drop = FALSE)
}


#where e gyan
newdata <- subset(x,Sekolah=="SMK NEGERI 2 DEPOK", drop = FALSE)





