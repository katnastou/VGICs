glm(formula = supplementary_tables$Pathogenicity ~ supplementary_tables$`N-terminal` + 
      supplementary_tables$S1 + supplementary_tables$S2 + supplementary_tables$S3 + 
      supplementary_tables$S4 + supplementary_tables$S5 + supplementary_tables$S6 + 
      supplementary_tables$PoreLoop + supplementary_tables$ELs + 
      supplementary_tables$ILs + supplementary_tables$`C-terminal`, 
    family = binomial(link = "logit"))