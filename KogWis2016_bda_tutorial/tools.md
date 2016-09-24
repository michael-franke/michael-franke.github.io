---
title: "Tools for Bayesian data analysis"
output:
  html_document:
    theme: cosmo
---

# Literature
### Overview and Introduction
- Wagenmakers, E.-J., Morey, R. D., & Lee, M. D. ([2016](https://osf.io/3tdh9/)). Bayesian benefits for the pragmatic researcher.
   *Current Directions in Psychological Science, 25*, 169-176.

    **Short, accessible paper arguing for the benefits of Bayesian inference using examples from popular culture. This should be the first
      paper you read -- even if it's just for the fun of it.**

- Etz, A., Gronau, Q. F., Dablander, F., Edelsbrunner, P. A., & Baribault, B. ([accepted](https://www.researchgate.net/publication/301981861_How_to_become_a_Bayesian_in_eight_easy_steps_An_annotated_reading_list)).
  How to become a Bayesian in eight easy steps: An annotated reading list. *Psychological Bulletin & Review*

    **Discusses eight articles on Bayesian inference, provides an overview of the literature and controversies more broadly, and
    "offers a starting point for understanding the core tenets of Bayesian analysis, while requiring a low level of time commitment".**

### Tutorial papers
- Sorensen, T., & Vasishth, S. ([in press](https://github.com/vasishth/BayesLMMTutorial/blob/master/doc/SorensenEtAl.pdf)). Bayesian linear mixed models using Stan: A tutorial for psychologists, linguists, and cognitive scientists.
  *Quantitative Methods for Psychology.*

    **Great tutorial on how to write linear mixed models in Stan, taking away the magic that comes with tools such as lme4. The paper is also a prime
      example of reproducible research, as all materials are hosted on Github.**

- Nicenboim, B., & Vasishth, S. ([2016](http://www.ling.uni-potsdam.de/~vasishth/pdfs/StatMethLingPart2ArXiv.pdf)). Statistical methods for linguistic research: Foundational Ideas-Part II.
  *arXiv preprint arXiv:1602.00245*

    **This introduction to Bayesian inference touches on several topics that are missing standard introductions for psychology, such as the influence
      of the prior on statistical inference, and model selection using cross-validation methods. The paper provides a good overview and further
      references for in-depth treatment.**

- Wagenmakers, E.-J., Marsman, M., Jamil, T., Ly, A., Verhagen, A. J., Love, J., Selker, R., Gronau, Q. F.,
  Smira, M., Epskamp, S., Matzke, D., Rouder, J. N., Morey, R. D. ([submitted](https://osf.io/8pzkb/)).
  Bayesian inference for psychology. Part I: Theoretical advantages and practical ramifications

    **This is an interesting paper as it discusses five advantages of the Bayes factor -- the Bayesian way of testing hypothesis --, but also responds to ten common criticisms of
      the former, acknowledging that the Bayes factor is contentious among statisticians.**

- Lee, M.D. ([in press](https://osf.io/zky2v/)). Bayesian methods in cognitive modeling. The Stevens’ Handbook of Experimental Psychology and Cognitive Neuroscience, Fourth Edition.

    **This paper contextualizes Bayesian methods in cognitive psychology and introduces a worked example from psychophysics using the software JAGS.
      Especially interesting are the sections on the role of the prior, and prior predictive distributions. If you want to get a taste of
      Lee & Wagenmakers (2013; see below), we highly recommend this text.**

### Books

- Richard McElreath ([2016](http://xcelab.net/rm/statistical-rethinking/)) Statistical Rethinking: A Bayesian Course with Examples in R and Stan. Chapman & Hall/CRC Press.

    **Has been described a ["pedagogical masterpiece"](https://www.amazon.com/review/RTVBJSAQ4RKRM/ref=cm_cr_dp_title?ie=UTF8&ASIN=1482253445&channel=detail-glance&nodeID=283155&store=books),
      and indeed is a really cool book. If you are getting started with Bayesian statistics, this is the book to buy!**

- Lee, M. D., & Wagenmakers, E.-J. ([2013](https://bayesmodels.com/)). Bayesian modeling for cognitive science: A practical course.
  Cambridge University Press

    **Practical book on Bayesian cognitive modeling covering the basics of parameter estimation, model comparison, as well as several
      case studies, among other things, in signal detection theory, psychophysics, and decision making.**

- Kruschke, J. ([2014](https://sites.google.com/site/doingbayesiandataanalysis/)). Doing Bayesian data analysis: A tutorial with R, JAGS, and Stan. Academic Press.

    **This was one of the first textbooks on Bayesian statistics written for psychologists. It introduces you from the ground-up, starting with an introduction to
      R and probability theory. Because of its great pedagogical approach, the poems that start each chapter, and overall structure of the content, we can recommend this book.**

- Gelman, A., Carlin, J. B., Stern, H. S., & Rubin, D. B. ([2014](http://www.stat.columbia.edu/~gelman/book/)). Bayesian data analysis (Vol. 2). Boca Raton, FL, USA: Chapman & Hall/CRC.

    **This is the Bayesian bible, and thus must be on this list. It requires a sound background in mathematical statistics.**


### Blogs and Media
If you want to be continuously updated, we recommend creating an account on Twitter and following the authors of the papers above.
Interesting blogs are written by

- [The Etz-Files](https://alexanderetz.com/), a blog by [Alexander Etz](https://twitter.com/AlxEtz)
- [BayesFactor](https://bayesfactor.blogspot.de/), a blog by [Richard Morey](https://twitter.com/richarddmorey)
- [Invariances](https://jeffrouder.blogspot.de/), a blog by [Jeffrey Rouder](https://jeffrouder.blogspot.de/)
- [The 20% Statistician](https://twitter.com/lakens), a blog by [Daniël Lakens](https://twitter.com/lakens)
- [Publications](http://ejwagenmakers.com/papers.html), publication page of [Eric-Jan Wagenmakers](http://ejwagenmakers.com/papers.html)
- [Babies Learning Language](https://babieslearninglanguage.blogspot.de/), a blog by [Michael C. Frank](https://twitter.com/mcxfrank)
- [Doing Bayesian Data Analysis](https://doingbayesiandataanalysis.blogspot.de/), a blog by John Kruschke
- [Statistical Modeling, Causal Inference, and Social Science](https://twitter.com/StatModeling), a blog by [Andrew Gelman](https://twitter.com/StatModeling)


# Software
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
