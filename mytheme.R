theme_set(theme_bw())
mytheme<-theme(text=element_text(size=12),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
               panel.border=element_blank(), axis.line=element_line(colour = "black"), 
               legend.title=element_blank(),plot.margin = unit(c(0,0.25,0,1), "cm")
)

myfacettheme<-theme(text=element_text(size=12),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                    axis.line=element_line(colour = "black"), 
                    legend.title=element_blank(),plot.margin = unit(c(0,0.25,0,1), "cm")
)