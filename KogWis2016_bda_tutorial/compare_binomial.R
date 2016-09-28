## helper functions

HDIofICDF = function( ICDFname , credMass=0.95 , tol=1e-8 , ... ) {
  # Arguments:
  #   ICDFname is R's name for the inverse cumulative density function
  #     of the distribution.
  #   credMass is the desired mass of the HDI region.
  #   tol is passed to R's optimize function.
  # Return value:
  #   Highest density iterval (HDI) limits in a vector.
  # Example of use: For determining HDI of a beta(30,12) distribution, type
  #   HDIofICDF( qbeta , shape1 = 30 , shape2 = 12 )
  #   Notice that the parameters of the ICDFname must be explicitly named;
  #   e.g., HDIofICDF( qbeta , 30 , 12 ) does not work.
  # Adapted and corrected from Greg Snow's TeachingDemos package.
  incredMass =  1.0 - credMass
  intervalWidth = function( lowTailPr , ICDFname , credMass , ... ) {
    ICDFname( credMass + lowTailPr , ... ) - ICDFname( lowTailPr , ... )
  }
  optInfo = optimize( intervalWidth , c( 0 , incredMass ) , ICDFname=ICDFname ,
                      credMass=credMass , tol=tol , ... )
  HDIlowTailPr = optInfo$minimum
  return( c( ICDFname( HDIlowTailPr , ... ) ,
             ICDFname( credMass + HDIlowTailPr , ... ) ) )
}



compare_binomial_fixed_N = function(N, bprior = 0.5) {
  # bprior gives prior shape; defaults to Jeffreys' priors
  x = 0:N
  pValues = sapply(1:length(x), function(i) binom.test(x[i], N)$p.value)
  HDImin = sapply(1:length(x), function(i) HDIofICDF(qbeta, shape1 = x[i] + bprior, shape2 = N - x[i] + bprior)[1])
  HDImax = sapply(1:length(x), function(i) HDIofICDF(qbeta, shape1 = x[i] + bprior, shape2 = N - x[i] + bprior)[2])
  BFValues = sapply(1:length(x), function(i) dbeta(0.5, x[i]+bprior, N-x[i] + bprior) / dbeta(0.5, bprior, bprior))
  results_binomial = data.frame(
    N = rep(N, N+1),
    k = 0:N,
    # prob_k = dbinom(0:N, size = N, prob = true_prob),
    pValue = pValues,
    HDImin = HDImin,
    HDImax = HDImax,
    BFValue = BFValues
  )  
  return(results_binomial)
}

compare_binomial = function(NList = c(10, 50, 100, 1000), bprior = 0.5){
  results = compare_binomial_fixed_N(NList[1], bprior)
  if(length(NList)>=1) {
    for (i in 2:length(NList)) {
      results = rbind(results, compare_binomial_fixed_N(NList[i], bprior))
    }
  }
  return(results)
}

results = compare_binomial(NList = c(10, 50, 100, 1000, 5000, 10000))

ROPE = 0
results = results %>% mutate(pdecision = ifelse(pValue <= 0.05, "significant", "non-significant"),
                             BFdecision = ifelse(BFValue >= 6, "H0",
                                           ifelse(BFValue <= 1/6, "H1", "??")),
                             ROPEdecision = ifelse(min(abs(HDImaxabs(HDImin - 0.5) <= ROPE, "H1",
                                                   ifelse(HDImax <= 0.5-ROPE, "H0", "??"))
                             )
                             
get_frequencies = function(results, true_prob = 0.5) {
  results = mutate(results, frequency = dbinom(k, N, prob = true_prob))
  case_probs = results %>% group_by(BFdecision, pdecision, ROPEdecision) %>%
    summarize(frequency = sum(frequency)/nlevels(factor(results$N)))
  return(case_probs)
}

frequencies = get_frequencies(results, true_prob = 0.5)
show(frequencies)

plot_results = filter(results, BFValue < 8 & pValue < 0.2)

myplot = qplot(pValue, BFValue, data = plot_results, color = factor(N)) + 
  geom_vline(xintercept = 0.05, color = "firebrick") +
  geom_hline(yintercept = 1/6, color = "firebrick")
show(myplot)

