# route = "P:\\2022_udes\\apoyo_docencia\\grafica_camila"
# route =  'P:\\pcloud\\2022_udes\\apoyo_docencia\\grafica_camila'
setwd(route)

# basado en etnia06_hta_version_2_discreteA_FINAL_MODELS.xlsx
getwd()
list.files()

library(readxl)
# install.packages("cowplot")


grafcami = read_xlsx("grafica_camila.xlsx",sheet="Hoja1")

library(ggplot2)

newgrafcami <- grafcami


png(filename = "grafica01.png",  width = 720, height = 720, units = "px",
    pointsize = 12)
 win.metafile(filename = "grafica.emf", width = 7, height = 7, pointsize = 12,
               restoreConsole = TRUE)
gra1 = ggplot(grafcami, aes(y=Treatment0, x=Value)) +   
    geom_bar(position="dodge", stat="identity",fill="white",colour="black")
gra1 + xlim(c(-18,2))+ theme_bw() +
    ylab("Training type") + xlab("Net change in blood pressure") + 
    facet_wrap(~BloodPressure,ncol = 1) +
    geom_errorbarh(aes(xmin=IL,xmax=UL),
                  height=.3,                    # Width of the error bars
                  position=position_dodge(.9)) +
    geom_text(aes(label=Value), hjust=1.5, vjust = 2.0,
              size=5.0,position = position_dodge(1.)) +
    geom_text(aes(x=-17 , label=pvalue),# hjust=4.5, vjust = 2.0,
              size=5.0,position = position_dodge(1.)) +
    theme(axis.text = element_text(size = 16),axis.title = element_text(size = 18),
          strip.text= element_text(size = 16))
dev.off()

help(png)
help(geom_text)
help(theme)


    theme(legend.position="top",panel.grid=element_blank()) +
    geom_text(aes(label=p), vjust=-4.5, size=4.5,position = position_dodge(1.))+
    #geom_text(aes(label=casosparentesis),hjust=0.4, vjust=-0.2, size=4,position = position_dodge(1.0))+
    theme(axis.text = element_text(size = 12),legend.title = element_blank(),
          )+
 +
    annotate(geom="text", x=1.0, y=65, label="*p-value=0.000",color="black")+
    annotate(geom="text", x=2.0, y=65, label="*p-value=0.030",color="black")+
    annotate(geom="text", x=3.0, y=65, label="*p-value=0.141",color="black") 
ggdraw(gra1) + draw_label("*Chi square test", x = 0.1, y = 0.03,size=12)

dev.off()


# Change the order of Users column of DataFrame
newgrafcami$BloodPressure1 <- factor(newgrafcami$BloodPressure, 
                      levels = c("Systolic", "Diastolic"))

newgrafcami$Treatment1 <- factor(newgrafcami$Treatment0, 
                                     levels = c("CT","ET", "DRT","IRT"))


# png(filename = "grafica01.png",  width = 720, height = 720, units = "px",
#     pointsize = 12)
win.metafile(filename = "newgrafica.emf", width = 7, height = 7, pointsize = 12,
                restoreConsole = TRUE)
gra1 = ggplot(newgrafcami, aes(y=Treatment1, x=Value)) +   
  geom_bar(position="dodge", stat="identity",fill="white",colour="black")
gra1 + xlim(c(-18,2))+ theme_bw() +
  ylab("Training type") + xlab("Net change in blood pressure") + 
  facet_wrap(~BloodPressure1,ncol = 1) +
  geom_errorbarh(aes(xmin=IL,xmax=UL),
                 height=.3,                    # Width of the error bars
                 position=position_dodge(.9)) +
  geom_text(aes(label=Value), hjust=1.5, vjust = 2.0,
            size=5.0,position = position_dodge(1.)) +
  geom_text(aes(x=-17 , label=pvalue),# hjust=4.5, vjust = 2.0,
            size=5.0,position = position_dodge(1.)) +
  theme(axis.text = element_text(size = 16),axis.title = element_text(size = 18),
        strip.text= element_text(size = 16))
dev.off()

help(png)
help(geom_text)
help(theme)


theme(legend.position="top",panel.grid=element_blank()) +
  geom_text(aes(label=p), vjust=-4.5, size=4.5,position = position_dodge(1.))+
  #geom_text(aes(label=casosparentesis),hjust=0.4, vjust=-0.2, size=4,position = position_dodge(1.0))+
  theme(axis.text = element_text(size = 12),legend.title = element_blank(),
  )+
  +
  annotate(geom="text", x=1.0, y=65, label="*p-value=0.000",color="black")+
  annotate(geom="text", x=2.0, y=65, label="*p-value=0.030",color="black")+
  annotate(geom="text", x=3.0, y=65, label="*p-value=0.141",color="black") 
ggdraw(gra1) + draw_label("*Chi square test", x = 0.1, y = 0.03,size=12)

dev.off()
