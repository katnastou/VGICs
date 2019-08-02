glm(formula = sypplementary_tables$Pathogenicity ~ sypplementary_tables$VSD + 
      sypplementary_tables$PoreLoop + sypplementary_tables$ELs + 
      sypplementary_tables$ILs + sypplementary_tables$other, family = binomial(link = "logit"))