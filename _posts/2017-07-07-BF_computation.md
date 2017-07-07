---
layout: post
title: "Computing Bayes Factors"
date:   2017-07-07
categories: statistics, modeling
status: publish
published: true
---
 
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
 
### Model comparison by Bayes factors
 
A model $$M_i$$, in the Bayesian sense, is a pair consisting of a conditional likelihood function $$P(D \mid \theta, M_i)$$ for observable data $$D$$ together with a prior $$P(\theta \mid M_i)$$ over parameter vector $$\theta$$. Ideally, we might like to assess the absolute probability of model $$M_i$$ after seeing data $$D$$. We can express this quantity using Bayes rule:
 
$$ P(M_i \mid D) = \frac{P(M_i) \ P(D \mid M_i)}{\int P(M_j) \ P(D \mid M_j) \  \text{d} M_j}$$ 
 
Quantifying over the whole class of possible models is dauntingly complex. This likely remains true even for a fixed data set and within a confined sub-genre of models (e.g., all regression models with combinations of a finite set of explanatory factors).
 
A good solution is to be more modest and to compare just two models to each other. The question to ask is then: How much does the observation of data $$D$$ impact our beliefs about the relative model probabilities? We can express this using Bayes rule as the ratio of our posterior beliefs about models, which eliminates the need to have the normalizing constant for the previous equation.
 
$$ \underbrace{\frac{P(M_1 \mid D)}{P(M_2 \mid D)}}_{\text{posterior odds}} =   \underbrace{\frac{P(M_1)}{P(M_2)}}_{\text{prior odds}} \ \underbrace{\frac{P(D \mid M_1)}{P(D \mid M_2)}}_{\text{Bayes factor}} $$
 
The fraction on the left-hand side is the posterior odds ratio: our relative beliefs about models $$M_1$$ and $$M_2$$ _after_ seeing data $$D$$. On the right-hand side we have a product of two intuitively interpretable quantities. First, there is the prior odds: our relative beliefs about models $$M_1$$ and $$M_2$$ _before_ seeing data $$D$$. Second, there is the so-called **Bayes factor**. This way of introducing Bayes factors invites to think of them as **the factor by which our prior odds change in the light of the data**.
 
If the Bayes factor is close to 1, then data $$D$$ does little to change our relative beliefs. If the Bayes factor is large, say 100, then $$D$$ provides substantial evidence in favor of $$M_1$$. Likewise, if it is small, say 0.01, then $$D$$ is relative evidence in favor of $$M_2$$. 
 
### Marginal likelihoods
 
While Bayes factors are conceptually appealing, their computation can still be very complex. The quantity $$P(D \mid M_i)$$ is often called the **marginal likelihood**. (It is also sometimes called the _evidence_ but this usage of the term may be misleading because in natural language we usually refer to observational data as 'evidence'.) This term looks inoccuous but it is not. It can be a viciously complicated integral, because the likelihood of observation $$D$$ under the model $$M_i$$ must quantify over all possible parameters of that model, weighed as usual by their priors:
 
$$ P(D \mid M_i) = \int P(\theta) \ P(D \mid \theta, M_i) \ \text{d}\theta$$ 
 
You may recognize in this integral the normalizing constant needed for parameter inference if we drop explicit reference to the specific model currently in focus:
 
$$ P(\theta \mid D) = \frac{P(\theta) \ P(D \mid \theta)}{\int P(\theta') \ P(D \mid \theta') \ \text{d} \theta'} $$ 
 
Normally, we would like to avoid having to calculate the marginal likelihood, which is exactly why MCMC methods are so great: they approximate the posterior distribution over paramters $$P(\theta \mid D)$$ _without_ knowledge or computation of the marginal likelihood. This makes clear why computing Bayes factors, in general, can be quite difficult or a substantial computational burden. 
 
### Methods for Bayes factor computation
 
Two general approaches for computing or approximating Bayes factors can be distinguished. We can either target the marginal likelihood of each model in separation. Or, we can target the Bayes factor directly. Both approaches have advantages and disadvantages, as we will see presently.
 
The following will spell out XXX ways of computing a Bayes factor for the same models. In this way we can compare directly the results from each method and its results. The methods covere here are:
 
1. Savage-Dickey density ratio (only applicable for _nested models_; see below)
2. naive Monte Carlo sampling
3. transdimensional MCMC
4. supermodels
 
And, once we are at it, we will also have a look at posterior predictive $$p$$-values, just to make sure that model criticism is not confused with model comparison.
 
### The running-example model(s): Generalized Context Model
 
Chapter 17 of Lee & Wagenmakers' ([2014](https://bayesmodels.com)) textbook on _Bayesian Cognitive Modeling_ features a concise implementation of the classic Generalized Context Model (GCM) of categorization. The model aims to predict the likelihood of correctly categorizing items after an initial learning period. Items differ along a number of numeric feature dimensions. (In the present case there will just be two.) The GCM resolves around three assumptions: (i) the probability of classifying item $$i$$ as belonging to category $$A$$ is derived from a measure of relative similarity of $$i$$ to all those items $$j$$ which were presented as belonging to category $$A$$ during training; (ii) similarity of any two items is a function of relative weighing of feature dimensions; (iii) there is room for general category preference (category $$A$$ is more likely to be chosen accross the board). (See chapter 17 of Lee & Wagenmakers and the papers cited therein for further details.)
 
In the implementation of Lee & Wagenmakers, the GCM has three meaningful free parameters:
 
- **bias** $$b \in [0;1]$$: overal bias in favor of one category over the other (there are only two categories in this case)
- **attention weight** $$w \in [0;1]$$: bias for weighing one feature dimension more strongly than the other (there are only two in this case)
- **generalization strength** $$c$$: how much training items $$j$$ that are further away from the to-be-categorized item $$i$$ affect the current choice
 

{% highlight r %}
# JAGS code for the Generalized Context Model
model{
  # Decision Data
  for (i in 1:nstim){
    y[i] ~ dbin(r[i],t)
  }  
  # Decision Probabilities
  for (i in 1:nstim){
    r[i] <- sum(numerator[i,])/sum(denominator[i,])
    for (j in 1:nstim){
      tmp1[i,j,1] <- b*s[i,j]
      tmp1[i,j,2] <- 0
      tmp2[i,j,1] <- 0
      tmp2[i,j,2] <- (1-b)*s[i,j]
      numerator[i,j] <- tmp1[i,j,a[j]]
      denominator[i,j] <- tmp1[i,j,a[j]] + tmp2[i,j,a[j]]
    }
  }  
  # Similarities
  for (i in 1:nstim){
    for (j in 1:nstim){
      s[i,j] <- exp(-c*(w*d1[i,j]+(1-w)*d2[i,j]))
    }
  }
  # Priors
  c  ~ dunif(0,5)
  w  ~ dbeta(1,1)
  b <- 0.5 
}
{% endhighlight %}
 
 
 
... **to be continued** ..
