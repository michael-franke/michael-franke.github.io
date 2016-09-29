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

Here is a compilation of [texts on Bayesian data analysis](http://michael-franke.github.io/KogWis2016_bda_tutorial/resources.html), and here is a summary of some handy [tools and software](http://michael-franke.github.io/KogWis2016_bda_tutorial/tools.html).

## schedule (still a teeny-weeny bit tentative!!)

#### session 1: theory

- $p$-values & null-hypothesis significance testing
- Bayes rule for data analysis
- things to do with data and models:
    - parameter estimation
        - credible intervals (a.k.a. highest density intervals)
        - region of practical equivalence
    - model comparison
        - information criteria
        - Bayes factors
        - Savage-Dickey method
- comparison of methods for null-hypothesis testing

#### session 2: practice
- Bayesian inference for complex models
    - statistical models as directed acyclic graphs
    - hierarchical models
- Sampling based approaches to estimation
    - Metropolis-Hastings
    - Gibbs sampling
    - Hamiltonian MC
- tools for BDA:
    - JAGS
    - Stan & rstanarm
    - JASP
    - WebPPL
- Bayesian cognitive modeling
    - case study: task types & link functions
- Q\&A and conclusions

## optional exercises

At a certain point, the best way to learn is to do. Here are a bunch of [exercises](http://michael-franke.github.io/KogWis2016_bda_tutorial/exercises.html) that might help you out of the comfort zone. If you need help find your way out of the bottle, please do not hesitate to get in touch!
