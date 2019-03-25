#I'm setting up a dataframe of parameters lists, each column represents a parameter set, rows are
#the individual parameter values
change_ae = 0.35
change_mr = 0.0028
change_re = .000056
change_ze = 20
change_eslow=0.0001
change_eshigh=0.001

#set up dataframe with parameter value sets as columns
params_sens<-as.data.frame(matrix(0,15,7))
row.names(params_sens)<-c('Is', 'Id', 'V', 'K', 'Vu', 'Ku', 'ae', 'mr', 'rl', 're', 'rb', 'abs', 'Vdi', 'ze', 'es')
colnames(params_sens)<-c('Default', 'low_ae', 'high_mr', 'high_re', 'high_ze', 'low_es', 'high_es')
source('Default_Params.R')
params_sens[,1:7]=parameters #Since each scenario will only have one parameter change, I initally fill the data frame with the defaul parameter set 
params_sens[7,2]=change_ae # ae value for the low ae param set  
params_sens[8,3]=change_mr # mr value for high mr param set
params_sens[10,4]=change_re #high re value for high re param set
params_sens[14,5] =change_ze # high ze value for high ze param set
params_sens[15,6] = change_eslow# low es value for low es param set
params_sens[15,7]=change_eshigh # high es value for high es param set

Sens_output<-as.data.frame(matrix(0,8,7))
#This for loop takes each column of the params_sens data frame and runs the isotope model 
#and steady state solutions for each set of parameters, the CUE_B, CUE_S CUE_C, and steady state CUE 
# for hr 1 and hr 150 are stored in dataframe Sens_output.  
for(i in 1:7){
  parameters=params_sens[,i]
  Is= parameters[1];Id=parameters[2]; V= parameters[3];
  K=parameters[4];Vu=parameters[5]; Ku= parameters[6];
  ae=parameters[7]; mr=parameters[8]; rl=parameters[9];
  re=parameters[10]; rb=parameters[11];abs=parameters[12];
  Vdi=parameters[13]; ze= parameters[14]; es=parameters[15]
  source('isotopemodel.R')
  colnames(Sens_output)[i]=paste(colnames(params_sens)[i])
  assign(paste(colnames(params_sens)[i]), imodel)
}
## output here is a dataframe called 
lowdf<- list(Default, Default, Default, Default, low_es)
highdf<-list(low_ae, high_mr, high_re, high_ze, high_es)
newdf<-c('ae_sens', 'mr_sens','re_sens','ze_sens','es_sens')
paramlow<-c(ae, mr, re, ze, change_eslow)
paramhigh<-c(change_ae, change_mr,change_re,change_ze,change_eshigh)
paramname<-c('ae', 'r', 'ep', 'ze', 'es')
for(i in 1:5){
  X<-as.data.frame(Default$time)
  colnames(X)[1]<-"time"
  X$steadyStateCUE <-abs(log10(lowdf[[i]]$steadyStateCUE)-log10(highdf[[i]]$steadyStateCUE))/abs(log10(paramlow[i])-log10(paramhigh[i]))
  X$CUE.B <-abs(log10(lowdf[[i]]$CUE.B)-log10(highdf[[i]]$CUE.B))/abs(log10(paramlow[i])-log10(paramhigh[i]))
  X$CUE.C <-abs(log10(lowdf[[i]]$CUE.C)-log10(highdf[[i]]$CUE.C))/abs(log10(paramlow[i])-log10(paramhigh[i]))
  X$CUE.S <-abs(log10(lowdf[[i]]$CUE.S)-log10(highdf[[i]]$CUE.S))/abs(log10(paramlow[i])-log10(paramhigh[i]))
  X$param <-paramname[i]
  assign(paste(newdf[i]), X)
}

sens_over_time<-rbind(ae_sens, ze_sens,mr_sens,es_sens,re_sens)


