source('steadystatesolns.R')
times <- seq(0, 150, by =1)
parameters <- c(Is= Is, #parameters match with those above.
                Id=Id,
                V= V,
                K=K,
                Vu=Vu,
                Ku=Ku,
                ae=ae,
                mr=mr,
                rl=rl,
                re=re,
                rb=rb,
                abs=abs,
                Vdi=Vdi,
                ze=ze,
                es=es)

state <- c(Si=0,
           Di=Deq/1000,#Simulates a label added to D pool that is .1%change in size of D, this is unaccounted for in D dynamics so the assumption is that it doesn't matter
           Bi=0,
           Ei=0,
           CO2i=0)

isotopemodel<-function(times,state,parameters) {
  with(as.list(c(state, parameters)), {
    dSi = (rb*Bi * abs) 
    dDi = -Vdi*Di + rl*Ei+rb*Bi*(1-abs)
    dBi=(Vdi*Di*ae*(1-es-es*ze))-Bi*(re+rb+mr+re*ze)
    dEi=  (Vdi*Di*ae*es)+ re*Bi - rl*Ei
    dCO2i=(Vdi*Di*(1-ae))+(Vdi*Di*ae*es*ze)+ re*Bi*ze+Bi*mr
    list(c(dSi, dDi, dBi, dEi, dCO2i))
  })
}
out<- ode(y = state, times = times, func = isotopemodel, parms = parameters)
head(out)
imodel<-data.frame(out)
isotopemodel<-imodel


##DIFFERENT WAYS OF CALCULATING CUE (FREY et al. 2001)######
imodel$CUE.B<-(imodel$Bi/(imodel$Bi+imodel$CO2i)) #biomass based CUE 
imodel$CUE.S <- ((Deq/1000)-imodel$Di-imodel$CO2i)/ (((Deq/1000)-imodel$Di))#substrate based cue
imodel$CUE.C <- imodel$Bi/((Deq/1000)-(imodel$Di))
imodel$steadyStateCUE<- ss_CUE

#
isotopemodel<-imodel

