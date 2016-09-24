---
title: "Bayesian data analysis: ideas, practices & tools"
output:
  html_document:
    theme: cosmo
---

Short tutorial as part of [KogWis2016](http://kogwis2016.spatial-cognition.de), taught by [Michael Franke](http://www.sfs.uni-tuebingen.de/~mfranke/) and [Fabian Dablander](https://twitter.com/fdabl).

## motivation

Bayesian approaches to statistical inference are often portrayed as the new cool kid in town
and heralded as superior to classical techniques. Naturally, the hype is also perceived
critically. This course is meant to critically introduce the Bayesian approach in a
nutshell. Participants who are as of yet unfamiliar with it will receive enough information to
form an opinion and to know where to obtain more information that suits their needs. Those who
are familiar with the main ideas can benefit from a concise rundown of the most important
recent developments. In particular, this course will do two things: (i) on the conceptual
level, we provide an overview of the main ideas, advantages, and challenges of Bayesian data
analysis, in direct comparison to classical approaches; (ii) on a practical level, we give an
executive summary of some of the most recent and convenient tools for hands-on Bayesian data
analysis.

## prerequisites

We do not presuppose any particular knowledge or skills, but familiarity with basic statistical
concepts will help to see the bigger picture more clearly. 

## Resources

Click [here](http://michael-franke.github.io/KogWis2016_bda_tutorial/resources.html) for a list of useful resources on Bayesian data analysis: papers, books, software etc.

## schedule (tentative!!)

#### session 1: theory

- basic notions (very briefly)
    - (conditional) probability, marginal probability, etc.
    - $p$-values & null-hypothesis significance testing
- Bayes rule for data analysis
    - priors, likelihoods and posteriors
- Bayesian inference for complex models
    - statistical models as directed acyclic graphs
    - hierarchical models
- things to do with data and models:
    - parameter inference
    - model comparison 
    - model criticism
    - prediction
- key properties of Bayesian data analysis:
    - independence of sampling procedure but dependence on prior
        - leads to: built-in regularization
        - allows: sequential testing
    -  principled model comparison (Bayes factor)
        - allows: quantify evidence in favor of null hypothesis
        - potential problem: Jeffreys-Lindley paradox
    - fully general \& freely extensible
        - allows: custom made (cognitive) models of data-generating process

#### session 2: practice
- Sampling based approaches to estimation
    - Monte carlo principle & Markov Chains
    - Gibbs sampling
- introduce Stan
    - syntax, interfaces
- R package `rstanarm' (interfaces Stan)
    - regression examples
- Bayes factor model comparison in practice
    - analytical computation of evidence
    - JASP
- Q\&A and conclusions

## optional exercises

TO BE ADDED SOON  
