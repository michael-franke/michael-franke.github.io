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
 
A good solution is to be more modest and to compare just two models to each other.
How much does the observation of data $$D$$ impact our beliefs about the relative model probabilities? We can express this using Bayes rule as the ratio of our posterior beliefs about models, which eliminates the need to have the normalizing constant for the previous equation.
 
$$ \underbrace{\frac{P(M_1 \mid D)}{P(M_2 \mid D)}}_{\text{posterior odds}} =   \underbrace{\frac{P(M_1)}{P(M_2)}}_{\text{prior odds}} \ \underbrace{\frac{P(D \mid M_1)}{P(D \mid M_2)}}_{\text{Bayes factor}} $$
The fraction on the left-hand side is the posterior odds ratio: our relative beliefs about models $$M_1$$ and $$M_2$$ _after_ seeing data $$D$$. On the right-hand side we have a product of two intuitively interpretable quantities. First, there is the prior odds: our relative beliefs about models $$M_1$$ and $$M_2$$ _before_ seeing data $$D$$. Second, there is the so-called **Bayes factor**. This way of introducing Bayes factors invites to think of them as **the factor by which our prior odds change in the light of the data**.
 
