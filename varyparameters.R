#Here I'm calling the default parameter list and then reordering them 
#in new parms so that in the for loop I can just call params 1-5 to get the ones I'm 
#interested in varying.
parameters
newparms=c(parameters[7], parameters[8], parameters[10], parameters[14], parameters[15], parameters[1:6], parameters[9], parameters[11:13])

#these lists set the parameter value ranges to be considered
ae_values=seq(.34,1,.01)
mr_values=seq(0,.00094,.00001)
re_values=seq(0.00000232, .000126,.0000001)
ze_values=seq(0,46,1)
es_values=seq(0,.0619,0.001)

#list of parameter values and the names of the new df I'm going to store the output in 
param_ranges<-list(ae_values, mr_values,re_values,ze_values, es_values)
newdf<-c("Vary_ae", "Vary_mr", "Vary_re", "Vary_ze", "Vary_es")

### So to vary the parameters I used a nested for loop, the outer loops is going to
#move through the parameters (ae, mr, re, ze, es) that we're interested in varying
#the inner loop goes through the values in associated list of values I'm going to be 
#considering for each parameter.
for(i in 1:5){ 
  source('Default_Params.R')
  parameters # just calling the defaultsparams again then reordering them in new parms 
  # just to make the for loop easier.
  newparms=c(parameters[7], parameters[8], parameters[10], parameters[14], parameters[15], parameters[1:6], parameters[9], parameters[11:13])
  X<-as.data.frame(matrix(0,1,6)) #empty dataframe that the output will be stored in
  colnames(X)=paste(c("Seq", "Beq", "Deq", "Eeq", "CUE", "param_value"))
  
  for(j in 1:length(param_ranges[[i]])){
    newparms[i]=param_ranges[[i]][j]
    
    ae=newparms[1]; mr=newparms[2]; re=newparms[3]; ze= newparms[4];es=newparms[5];
    Is= newparms[6];Id=newparms[7]; V= newparms[8];
    K=newparms[9];Vu=newparms[10]; Ku= newparms[11];
    rl=newparms[12];rb=newparms[13];abs=newparms[14];
    Vdi=newparms[15]  
    
    source('steadystatesolns.R')
    X[j,1]=S_soln
    X[j,2]=B_soln
    X[j,3]=D_soln
    X[j,4]=E_soln
    X[j,5]=ss_CUE
    X[j,6]=newparms[[i]]
    
    assign(paste(newdf[i]), X)}}
rm(X)


#for ae I want the graph to show the cost so I'm displaying it at 1-ae, and 
# creating a new column to calculate 1-ae, I name this as the param_value becasue this is what I want 
# to be on the graph, and I delete
Vary_ae[,7]<-1-Vary_ae[,6]
Vary_ae[,8]<-"(1-ae)"
Vary_ae<-Vary_ae[,-6]
colnames(Vary_ae)[6]<-"param_value"
colnames(Vary_ae)[7]<-"V7"

Vary_es[,7]<-"es"
Vary_mr[,7]<-"mr"
Vary_re[,7]<-"ep"
Vary_ze[,7]<-"ze"
fig4<-rbind(Vary_ae,Vary_mr,Vary_re,Vary_ze,Vary_es)
colnames(fig4)[7]<-"param"

figfour<-melt(fig4, id.vars=c("param", "param_value"))

