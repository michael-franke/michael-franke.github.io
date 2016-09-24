---
title: "Tools for Bayesian data analysis"
output:
  html_document:
    theme: cosmo
---

### JASP
[JASP](https://jasp-stats.org/) offers an intuitive, slick graphical user interface and provides both
both classical and Bayesian methods. It allows you to save reproducible .jasp files, paste tables in APA
format into Word, and makes georgeous plots. Some tutorials can be found [here](https://alexanderetz.com/jasp-tutorials/).

### JAGS
[JAGS](http://mcmc-jags.sourceforge.net/) stands for Just Another Gibbs Sampler and allows specification of
models in a domain specific language. It is maintained by [Martyn Plummer](https://martynplummer.wordpress.com/).

**Interfaces:**

- [rjags](http://www.johnmyleswhite.com/notebook/2010/08/20/using-jags-in-r-with-the-rjags-package/)
- [PyJags](https://github.com/tmiasko/pyjags)
- [matjags](https://github.com/msteyvers/matjags)

### Stan
[Stan](http://mc-stan.org/) is named after Stanislav Ulam, who invented the of Monte Carlo method of computation.
Stan is similar in spirit to JAGS, but has a different syntax, works differently under the hood, and has a
much bigger team of developers; head of the project is [Andrew Gelman](http://andrewgelman.com/).

**Interfaces:**

- [RStan](http://mc-stan.org/interfaces/rstan.html)
- [PyStan](http://mc-stan.org/interfaces/pystan.html)
- [MatlabStan](http://mc-stan.org/interfaces/matlab-stan.html)

### rstanarm
[rstanarm](http://mc-stan.org/interfaces/rstanarm.html) is an R package that allows you to bypass writing Stan code.
It comes packaged with a few pre-compiled models that can be called with functions that mimick general R functions
such as stan_lm() and stan_glm().
