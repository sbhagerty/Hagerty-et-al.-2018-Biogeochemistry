ss_model<-function(times,state,parameters) {
  with(as.list(c(state, parameters)), {
    dS = Is - ((V*E*S)/(K+S)) + (rb * B * abs)
    dD = Id + ((V*E*S)/(K+S)) - ((Vu*B*D)/(Ku+D)) + (rl * E)+(rb*B)*(1-abs)
    dB =( ((Vu*B*D)/(Ku+D))*ae*(1-es-es*ze))-B*(re+rb+mr+re*ze)
    dE=( ((Vu*B*D)/(Ku+D))*ae*es)+ re*B - rl*E #modified to include enzyme production associated with substrate uptake
    list(c(dS, dD, dB, dE))
  })
}

source('steadystatesolns.R')
Seq=S_soln
Beq=B_soln
Deq=D_soln
Eeq=E_soln


parameters <- c(Is= Is, 
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
                ze=ze,
                es=es)
state <- c(S=Seq,
           D=Deq,
           B=Beq,
           E=Eeq)
times <- seq(0, 24000, by =1)
out<- ode(y = state, times = times, func = ss_model, parms = parameters)
model<-data.frame(out)