---
layout: post
title:  "First thoughts on adaptive optimality of basic-level categories"
date:   2016-12-14
categories: evolution
status: publish
published: true
---
 
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
 
When Jones owns a dog, we usually say that he owns a dog, not a poodle (even if true and known) and not a pet. "Dog" is the basic-level category. If someone says that Jones owns a pet, we might infer that it's not known or relevant what kind of pet. If that same someone says that Jones owns a dog, we are much less likely to infer that it's not known or relevant which kind of dog. And so on.
 
What is a basic-level category? Why and how do we evolve to have basic-level categories? - I am very far from competent answers to these questions. I've shunned the literature deliberately. I wanted a naive and untarnished first look at the problem. As an exercise and for future reference, I'll jot down the ideas of a first 2 hour brainstorming here.
 
The first thought that came to mind is that we preferably call a poodle "dog" and not "poodle" or "animal" because we mostly need to distinguish it from other animals, not from other dogs or inanimate objects. This is how we can give a rationalization for the existence and location of basic-level categories. They are not an arbitrary product of cognition, not an accidental property of our conceptualization, but a reasonable and efficient solution to a problem of disambiguation in context. The statistical properties of the environment, i.e., the occurrence probabilities of contexts in which one obejct needs to be distinguished from another plays an important role. In fact, it might be *the* decisive element: basic-level categories are an optimal adaptation to the statistical properties of contexts in which certain (but not other) distinctions are relevant.
 
To speak of optimality in a statistically variable context screams for precisification. Here is a first stab. A language is *discriminative* to the extent that it maximizes a measure like this one:
 
$$\sum_c P(c) \sum_o P(o \mid c) \sum_{m} P_S(m \mid o,c) \sum_{o'} P_L(o' \mid m,c) \ \log (P_L(o' \mid m,c)) $$
 
Here, $$P(c)$$ is the probability which which a context $$c$$ occurs. A context $$c$$ consists of a variable number of objects $$o$$ and $$P(o \mid c)$$ is the probability that a speaker wants to talk about object $$o$$ when it occurs in context $$c$$ (i.e., to distinguish $$c$$ from other objects). When a speaker wants to talk about $$o$$ in $$c$$ she will use message $$m$$ with probability $$P_S(m \mid o,c)$$. Finally, the listener will assign probability $$P_L(o' \mid m,c)$$ to the proposition that the object the speaker wanted to refer to with $$m$$ in $$c$$ was $$o'$$. 
 
The formula above seems to qualify a pair of production and interpretation rules $$P_S$$ and $$P_L$$ as being more or less efficient if the goal is discriminative efficiency. But if that's what it was supposed to do it would clearly do a bad job. Rather, think of it as a measure for the discriminative power of an underlying denotational language which assigns a subset of objects to each message $$m$$ (independent of context). The speaker and listener rules $$P_S$$ and $$P_L$$ are then derived from this language. E.g., $$P_L$$ is derived by Bayes rule from $$P_S$$, which in turn is a probabilistic Gricean speaker like in the Rational Speech Act model or its close cousins (Frank & Goodman 2012, "[Predicting Pragmatic Reasoning in Language Games](http://science.sciencemag.org/content/336/6084/998)").  
 
One language that maximizes disrcriminability independent of $$P(c)$$ is one that has a unique name for each object $$o$$. Such a language is not learnable if there are unboundedly many potential objects. Languages should also be optimized for learnability. I first stab at formalizing as possibly suitable notion could be to require that languages should maximize compressibility or minimize the entropy over the occurrence probability of messages:
 
$$\sum_m P(m)\log P(m)$$
 
Here $$P(m) = \sum_{o,c} P_S(m \mid o,c)$$ is the occurrence probability of message $$m$$. A language that maximizes the latter measure is one that uses only one message all of the time. A language that minimizes it uses all (conceivable) messages with the same overall probability.
 
I conjecture that languages which tend to maximize both discriminability and compressibility will have basic-level categories. (Or rather: I $$want$$ normatively justifiable formal notions of discriminability and compressibility that make this true; my first shots here may be wrong (I already have reason to doubt both independent on what they together would "predict")). This makes it necessary to say what basic-level categories should be. This is tricky. A first thought would be that a basic category of object $$o$$ is a label $$m$$ that is used predominantly for $$o$$ accross contexts $$c$$. So $$m$$ is a basic-level category for $$o$$ to the extent that $$P(m \mid o) = \sum_c P(m \mid o,c)$$ is high, relative to $$P(m'\mid o)$$ for other $$m'$$. 
 
If this is a good operationalization of the notion of "basic-level category", then it might even be possible to show a connection between discriminability, compressibility and basic-level categories analytically. If that would succeed, the main questions would relate to **empirical anchoring**: (i) as most of the work in the formal system would be played by $$P(c)$$ (and to a lesser degree $$P(o \mid c)$$), we would need a way of measuring or estimating it *independently* of intuitions/operationalizations of basic-level categorihood; (ii) we'd need a way to measre basic-level categorihood and relate it to the formal definition.
 
Presumably, (ii) should come from the literature. So, it should be reading time now. But for (i) I am not sure if the extant literature will be able to provide and/or if and how the relevant measure could be obtained. A possibility is to look at co-occurrence probabilities of words in linguistic contexts (LSA), but this might be circular. Think!
 
