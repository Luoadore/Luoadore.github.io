---
title: Kalman Filter
date: 2020-11-2 23:25:00
tags: 5 Minutes with Cyrill
---

### Kalman Filter

So what is the kalman filter?

The kalman filter is the probabilistic states estimating technique and it's used to estimate the state of a dynamic system. What is a dynamic system? You can consider dynamic system a mobile robot moving through the environment and you want to estimate the position or rotation of that platform based on motion commands that you sent or based on observations sensor data that you get or it can be an autonomous car and then you are steering commands maybe how is your steering angle and how much you are actually push your gas petal and maybe you have a laser range scanner installed on your car in order to observe the environment. This will serve as sends observations in order to correct your post.

So the Kalman Filter is basically has two steps. A so-called **Prediction** step and a so-called **Correction** step. 

The prediction step stay takes the steering information into account or the motion commands into account in order to estimate in order to predict where the system will be at the next point in time. So basically this says if I go with one meter per second forward in one second of the one meter in front of me, that's what the prediction step does. 

The correction step takes into account the sensor observation in order to correct for potential mistakes that  we have done. So it takes the observation into account, and compute the so-called predicted observation so what should I observe it or actually be in the state and compares those two observations with each other in order to preform a correction. So for every new command and every new measurement, we do a prediction step, correction step. Then a new command and a new observation comes in, so a new prediction step, a new correction step. So we have these procedure, these recursive procedure which always updates the previously belief and turns it into next belief. 

The kalman filter remains two important assumptions.  The first important assumption is that everything is Gaussian. So we're live in a Gaussian world that means my belief about the position of platform is Gaussian and also the uncertainty that I have for example in my motion or in my observation. And the second important thing is all models are linear, that means they are the model that is involved the prediction step that estimates where will be at the next point in time. And my observation model are about linear models.  And these are actually very strong assumptions.

If we are however in a Gaussian linear world the kalman filter is the optimal estimator. So you can't do better in oder to estimate the state of a dynamic system. If you are however living in a nonlinear world, which is the actually case for most real-world applications, then kalman filter can't be use anymore.  What you ever can do use a so-called extended kalman filter which is a variant of the kalman filter that tries to deal with these nonlinearities and what it does basically performs a local linearization, so it performs a taylor approximation of your nonlinear models and turned them into linear models given your current linearization point. So you need to recompute these linearization at every step because you will have a new initial guess to a new linearrization point.  But then it actually works in the same way as the kalman filter does,  just it adds this local linearrization to that. 

And the kalman filter as well as the extend kalman filter is a very popular state estimation techniques, it is one of the really basic probabilistic recursive based filters and is used in large number of different applications. For example, localizing a vehicle in the environment or tracking the position of the camera as well as local features in the environment. All those state estimation techniques which update the belief of a system giving new data uses those probabilistic state estimation techniques and the kalman filter is one of the basic approaches in order to do that. So how by give you a small idea on what that kalman filter is, what key properties are and one can be used for that you can start diving deeper.