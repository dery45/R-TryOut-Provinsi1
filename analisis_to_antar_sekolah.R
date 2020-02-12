library(ggplot2)

stemsa <- func_to_sekolah(1:10, datastemsa, "SMK NEGERI 2 YOGYAKARTA")
str(stemsa)
stembayo <- func_to_sekolah(321:330, datastembayo, "SMK NEGERI 2 DEPOK")
str(stembayo)
smk3yk <-func_to_sekolah(59:67, datasmk3yk, "SMK NEGERI 3 YOGYAKARTA")
smk1yk <-func_to_sekolah(13:15, datasmk1yk, "SMK NEGERI 1 YOGYAKARTA")
smk7yk <-func_to_sekolah(23:28, datasmk7yk, "SMK NEGERI 7 YOGYAKARTA")
smk6yk <-func_to_sekolah(30:36, datasmk6yk, "SMK NEGERI 6 YOGYAKARTA")
smk1depok <-func_to_sekolah(272:276, datasmk1depok, "SMK NEGERI 1 DEPOK")

total <- Reduce(function(x=siswa, y) merge(x, y, all=TRUE), list(stemsa, stembayo, smk3yk, smk1yk, smk6yk, smk7yk))
total

summary(total)


m <-ggplot(data = total, aes(y=Mtk,
                         x=PeringkatProv,
                         color= Sekolah), size=4)

n <-ggplot(data = total, aes(x=Mtk,
                             fill= Sekolah))

n + geom_bar(colour="black")

m + geom_point() + scale_x_reverse() + geom_smooth() + ggtitle("Statistik hubungan nilai matematika dengan peringkat SMK Provinsi DIY") +
  theme(axis.title.x = element_text(color = "Dark Green", size = 16),
        axis.title.y = element_text(color = "Red", size = 16),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), 
        
        plot.title = element_text(size=19, 
                                  colour = "blue", 
                                  family = "Courier")) + facet_grid(Sekolah~.)