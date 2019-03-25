### Hagerty et al. 2018 Biogeochemistry
___

This directory contains code required to reproduce the analyses in the publication: 

**Hagerty, S.B., Allison, S.D. & Schimel, J.P. Evaluating soil microbial carbon use efficiency explicitly as a function of cellular processes: implications for measurements and models. Biogeochemistry (2018) 140: 269.** https://doi.org/10.1007/s10533-018-0489-z

**Abstract**
Carbon use efficiency (CUE), the proportion of carbon (C) consumed by microbes that is converted into biomass, is an important parameter for soil C models with explicit microbial controls. While often considered as a single parameter, CUE is an emergent property of multiple microbial processes, including assimilation efficiency, biomass-specific respiration, enzyme production, and respiratory costs of enzyme production. These processes occur over variable time scales and imply different fates for C, and the same emergent CUE value can result when C is allocated in fundamentally different ways (e.g. a high investment in enzyme production vs. a high assimilation cost). We developed a model that represents the individual processes underlying emergent CUE to test how shifts in microbial allocation alter equilibrium soil C pool sizes. We found that an increase in emergent CUE that results from a change in assimilation efficiency, biomass specific respiration, or respiration costs from enzyme production causes soil organic C (SOC) to decline, while the same change in emergent CUE resulting from a change in enzyme production causes SOC to increase. We also used the model to test the sensitivity of CUE from isotopic C tracer estimates to changes in microbial allocation processes. We found that these estimates do not account for the same microbial processes represented by emergent CUE in models. We propose that considering microbial processes explicitly rather than representing CUE as a single parameter can improve data-model integration. In addition, modeling microbial processes explicitly will account for a wider range of possible outcomes from shifts in microbial C allocation, such as when increased SOC results from increasing CUE.

---
**FOR DIRECTORY FILE GUIDE AND RECREATING ANALYSES/FIGURES SEE:** [EvaluatingCUE.RMD](EvaluatingCUE.RMD) 

**R Session Info** 

R version 3.5.2 (2018-12-20)
Platform: x86_64-apple-darwin15.6.0 (64-bit)
Running under: macOS High Sierra 10.13.6

Matrix products: default
BLAS: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
LAPACK: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] RColorBrewer_1.1-2 dplyr_0.7.8        ggplot2_3.1.0      reshape2_1.4.3    
[5] deSolve_1.21      

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.0       rstudioapi_0.9.0 bindr_0.1.1      knitr_1.21       magrittr_1.5    
 [6] tidyselect_0.2.5 munsell_0.5.0    colorspace_1.4-0 R6_2.3.0         rlang_0.3.1     
[11] stringr_1.3.1    plyr_1.8.4       tools_3.5.2      grid_3.5.2       gtable_0.2.0    
[16] xfun_0.4         withr_2.1.2      digest_0.6.18    yaml_2.2.0       lazyeval_0.2.1  
[21] assertthat_0.2.0 tibble_2.0.1     crayon_1.3.4     bindrcpp_0.2.2   purrr_0.3.0     
[26] glue_1.3.0       labeling_0.3     stringi_1.2.4    compiler_3.5.2   pillar_1.3.1    
[31] scales_1.0.0     pkgconfig_2.0.2