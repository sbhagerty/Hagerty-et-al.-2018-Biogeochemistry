#Calling the steady state solution file because I run the isotope addition at 1/1000 of the DOC equilibrium pool size
source('steadystatesolns.R')

# Model will simulate 150 h stepping 1 h increments
times <- seq(0, 150, by =1)

#parameter values, these are at default values to simulate the isotope over time and then this 
#script is run with variable parameter values vary when assessing parameter sensitiviy
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

#Soil Pools, for the isotopic simulation these are all at 0 except the DOC pool, simulating tracer addition
state <- c(Si=0,
           Di=Deq/1000,#Simulates a label added to D pool that is .1%change in size of D, this is unaccounted for in D dynamics so the assumption is that it doesn't matter
           Bi=0,
           Ei=0,
           CO2i=0)
#Set up of ODE model with differential equations for labelled SOC, DOC, Biomass, Enzyme, and CO2 (i.e. dSi, dDi, dBi, dEi, dCO2i)
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
# running the model and generating output as dataframe called isotope model 
out<- ode(y = state, times = times, func = isotopemodel, parms = parameters)
head(out)
imodel<-data.frame(out)



##DIFFERENT WAYS OF CALCULATING CUE (FREY et al. 2001)######
imodel$CUE.B<-(imodel$Bi/(imodel$Bi+imodel$CO2i)) #biomass based CUE 
imodel$CUE.S <- ((Deq/1000)-imodel$Di-imodel$CO2i)/ (((Deq/1000)-imodel$Di))#substrate based cue
imodel$CUE.C <- imodel$Bi/((Deq/1000)-(imodel$Di))
imodel$steadyStateCUE<- ss_CUE

#
isotopemodel<-imodel

