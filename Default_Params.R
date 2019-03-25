##These are the default parameter values found in Table 1 of the publication

Is= .00015  # SOC input rate
Id=.00001  # DOC input rate
V= 1 # SOC Vmax
K=250 #SOC Km
Vu=.01 #DOC uptake Vmax
Ku=.26 #DOC uptake Km
ae=.7  #Assimilation efficiency
mr=.00028 # biomass specific respiration, in the manuscript this is just called r
rl=.001 #enzyme loss rate, in the manuscript thi is tau_L 
re=.0000056 # enzyme production rate per unit biomass,this is ep in the manuscript
rb=.00028 # microbial death rate, this is tau_B in the manuscript
abs=0.5 #Fraction of dead MBC partitioned to SOC, this is alpha_BS in the manuscript
Vdi=2 #Uptake rate of isotopic tracer
ze=10 #Respiraiton per unit enzyme-C produced
es=0 #Enzyme produciton per unit of assimilated C

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

