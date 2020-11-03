---
title: Particle Filter
date: 2020-11-3 23:25:00
tags: 5 Minutes with Cyrill
---

### Particle Filter

So what is a Particle filter?

Particle filter, similar to the kalman filter, is a technique for estimating the state of a dynamic system. So it is a recursive bayes filter, which takes the current belief and updates the current belief based on so-called the motion information of control commands and based on observations. And its from the idea very similar to the kalman filter, but it relaxes some of the assumptions that the kalman filter does. So the key advantages of particle filter is that it can deal with nonlinear functions and it relaxes some assumptions that we are in Gaussian world. It actually allows you to describe arbitrary probability distributions and it uses a nonparametric form in order to do this.

And so the idea is actually very easy to explain what the particle filter does.

It says I just use a number of particles or samples which are hypotheses for system being in one single state. So if we have maintained ten thousand particles, we have ten thousand gausses or ten thousand  hypotheses in which state the system will be in. So every sample or every particle refers to one gauss that the system is in that state. So if you think that your particle would represent the position of the mobile robot platform environment for example. Then ten thousand particles will be ten thousand gausses or ten thousand hypotheses where the system could be in a world. So every particle for example would be an (X, Y), that location and your pitch roll angle in case of a sixty localization system. 

And what the particle filter does very similar to a kalman filter, it has **Prediction** step and **Correction** step to estimate what how other states evolve. And it can be done in a very simplistic way or can be explained in a very simplistic way. 

So let's take we pick up one particle, the particle represents one state. (**Prediction uses controls commands**) So at a certain location looking in a certain direction if now we want to estimate how the system evolves over time given that we know we drive with ten meters per second forward for example, we can just take this particle and shift it ten meters off. This is how the system is expected to evolve given that we have been at the state where the particle was saying the platform is actually here. We additionly add some noise to this is a circle it's called **sampling from the proposal** distribution taking into account that this motion is affected by noise. And then we simply repeat this for all the particles so all the particles will be move by that distance forward together with some noise centered around. 

Second step is called correction step, takes the observation into account. And what it basically does it says given that I'm in that position what the particles tell me how likely is it actually to obtain the observation that the real vehicle has obtained. And base on how likely it is to obtain this observation this particle will get a weight or an **importance weight**. So every particle which is at a different location will get a different important weight. The higher the weight, the more likely it is that this particle did the right job. Then we have a large set of state hypotheses together with the weight and the weight tells me how likely it is that the system could explain the measurement of being in that state. 

Then the particle filter basically has the third step which is so-called **Resampling** step.  Which is especially needed if you only have a limited number of particles. It performs kind of survival of the fittest principles by saying I tend to replicate particles which have a higher importance wight , and tend to forget those particles which have a low importance weight. See it as a survival of the fittest based on this importance weight. And then the process repeats so the good particles are likely to survive and the bad products are likely to die out. And then when the next observation comes in, we again move all particles forward with sample noise and  it's associated to the motion, check again with the new observation how likely is every particle to explain the new observation that we get. We perform our resampling step and continue this process.

So in sum, every particle filter  consists of a set of weighted samples. And a weighted sample is a state, hypotheses. So if it's position is (X, Y) that your pitch roll in 3D or (X, Y) that in theta in 2D, and then we has a scalar weight, this importance weight, and this represents probability distributions actually a sum of the rack distributions or direct pulses centered in the state of particle represents and multiplied with the importance weight. 

The particle filter is a standard technique that is used today in a mobile robot localization, especially if you don't have any external global sensors like a GPS sensor, especially for indoor localization task, particle filter are today the method of choice in the standard for realizing the so-called Monte Carlo localization.