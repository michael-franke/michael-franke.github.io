library(dplyr)
library(reshape2)
library(ggplot2)


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



compare_binomial_fixed_N = function(N, p_nh = 0.5, a = 0.5, b = 0.5) {
  # bprior gives prior shape; defaults to Jeffreys' priors
  x = 0:N
  pValues = sapply(1:length(x), function(i) binom.test(x[i], N, p = p_nh)$p.value)
  HDImin = sapply(1:length(x), function(i) HDIofICDF(qbeta, shape1 = x[i] + a, shape2 = N - x[i] + b)[1])
  HDImax = sapply(1:length(x), function(i) HDIofICDF(qbeta, shape1 = x[i] + a, shape2 = N - x[i] + b)[2])
  BFValues = sapply(1:length(x), function(i) dbeta(p_nh, x[i]+a, N-x[i] + b) / dbeta(p_nh, a, b))
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

compare_binomial = function(NList = c(10, 50, 100, 1000), p_true = 0.5, p_nh = 0.5, a = 0.5, b = 0.5, ROPE = 0.01){
  results = compare_binomial_fixed_N(NList[1], p_nh, a, b)
  if (length(NList) > 1) {
    for (i in 2:length(NList)) {
      results = rbind(results, compare_binomial_fixed_N(NList[i], p_nh, a, b))
    }
  }
  results = results %>% mutate(pdecision = ifelse(pValue <= 0.05, "H1", "H0"),
                               BFdecision = ifelse(BFValue >= 6, "H0",
                                                   ifelse(BFValue <= 1/6, "H1", "??")),
                               ROPEdecision = ifelse( p_nh+ROPE < HDImin | p_nh-ROPE > HDImax , "H1",
                                                      ifelse( (HDImin <= p_nh-ROPE & HDImax >= p_nh+ROPE) |
                                                                (HDImin >= p_nh-ROPE & HDImax >= p_nh+ROPE), "H0", "??"))) %>%
                      mutate(frequency = dbinom(k, N, prob = p_true))
  return(list(full_results = results,
              result_frequencies = 
           rbind(results %>% group_by(N, BFdecision) %>% rename(decision = BFdecision) %>% 
                   summarize(frequency = sum(frequency)) %>% mutate(rule = "BF") %>% melt(measure.vars = "frequency"),
                 results %>% group_by(N, pdecision) %>% rename(decision = pdecision) %>% 
                   summarize(frequency = sum(frequency)) %>% mutate(rule = "p-value") %>% melt(measure.vars = "frequency"),
                 results %>% group_by(N, ROPEdecision) %>% rename(decision = ROPEdecision) %>% 
                   summarize(frequency = sum(frequency)) %>% mutate(rule = "ROPE") %>% melt(measure.vars = "frequency"))))
}

results = compare_binomial(NList = c(10, 100, 1000, 10000, 100000))

# save(results, file = "results_binomial_comparison.Rdata")

rf = results$result_frequencies
result_freq_plot = ggplot(rf, aes(x = N, y = value)) + scale_x_log10() +
  geom_point(data = filter(rf, rule == "BF"), aes(y = value, shape = decision, color = "BF")) +
  geom_point(data = filter(rf, rule == "p-value"), aes(y = value, shape = decision, color = "p-value")) +
  geom_point(data = filter(rf, rule == "ROPE"), aes(y = value, shape = decision, color = "ROPE")) +
  geom_line(data = filter(rf, rule == "BF"), aes(y = value, group = decision, color = rule)) +
  geom_line(data = filter(rf, rule == "p-value"), aes(y = value, group = decision, color = rule)) +
  geom_line(data = filter(rf, rule == "ROPE"), aes(y = value, group = decision, color = rule)) +
  theme(legend.title=element_blank()) + theme_set(theme_grey() + theme(plot.background=element_blank()) )
show(result_freq_plot)

plot_results = filter(results$full_results, BFValue < 8 & pValue < 0.2) %>% mutate(N = factor(N))

myplot = qplot(pValue, BFValue, data = plot_results, color = N) + 
  geom_vline(xintercept = 0.05, color = "firebrick") +
  geom_hline(yintercept = 1/6, color = "firebrick") +
  geom_hline(yintercept = 6, color = "firebrick")
show(myplot)

