---		
layout: post		
title:  "Comparing null-hypothesis tests for binominal data"		
date:   2016-09-30 14:48:32 +0100		
categories: statistics		
status: publish
published: true
---
 
In the painful absence of the fabulous [Fabian Dablander](https://twitter.com/fdabl), I had to carry the flag alone today in our [tutorial on Bayesian data analysis](http://michael-franke.github.io/KogWis2016_bda_tutorial/index.html) at [KogWis-2016](http://kogwis2016.spatial-cognition.de) today. The tutorial had a running example of simple binomical coin flip scenario, by means of which I tried to highlight the conceptual differences between three ways of doing (something that may be called) "null-hypothesis testing":
 
1. $p$-values (our good-old pals),
2. Bayes factors, and
3. Kruschke's ROPE-based parameter estimation approach.
 
While preparing this material, it occurred to me that, if I would sit in my tutorial, what I'd really want to ask is: "Okay, these are conceptually different, fine. But how often do they make different predictions?" To partly address this question, I wrote a simple R script. It's result are illuminating. So, let me share this.
 
 
 
