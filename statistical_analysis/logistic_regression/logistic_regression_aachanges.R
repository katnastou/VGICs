glm(formula = supplementary_tables$pathogenicity ~ supplementary_tables$`polar to polar` + 
      supplementary_tables$`polar to non-polar` + supplementary_tables$`polar to charged` + 
      supplementary_tables$`non-polar to polar` + supplementary_tables$`non-polar to non-polar` + 
      supplementary_tables$`non-polar to charged` + supplementary_tables$`charged to polar` + 
      supplementary_tables$`charged to non-polar` + supplementary_tables$`charged to charged`, 
    family = binomial(link = "logit"))