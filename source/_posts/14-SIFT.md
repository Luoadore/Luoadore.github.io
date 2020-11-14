---
title: SIFT
date: 2020-11-14 22:01:00
tags: 5 Minutes with Cyrill
---

# SIFT

So what is SIFT?

SIFT stands for **Scale Invariant Feature Transform**, it's a way for describing a local area in image and describing it through so-called feature vector. In computer vision or photogrammetry or robotics we often interesting in reducing the image content and reducing it to a set of locally distinct points together with a description of that locally distinct point (descriptors are like a signature of such points). So the whole image is reduced to a set of points and those points we want to find again in other images if those images were picturing the same scene, maybe from the different view point. So we illustrate this with a small example consider we have this image in Venice and we have a locally distinct point for example sitting here on a chimney just as an example. We can do is we have this locally distinct point how should we actually describe it, we can do so by taking the local neighborhood so local patch around the key point into account and using the intensity values or maybe the changes in intensity values or the gradients in this local area in order to describe it and turn it into descriptor vector.

![example-sift](example-sift.png)

So it's important to distinguish the key point from the descriptor vector. The key point is a point in the image and the descriptor is  the vector that describes local surrounding around that point. If we have multiple images where we find the same key points through the feature descriptors, we can actually amke data associations between those images. This the important task whenever you want to do geometric reconstruction tasks. So whenever you solve the bundle adjustment or computing visual odometry, making stereo correspondences, running visual slam, a bag of words approach, loop closing, a large number of different algorithms require features extracted from images and that the subsequent algorithms only work with those feature in an image. And to distinguish here the computation of the key point and computation of the descriptor vector.

So how does it work? 

The locally distinct point, the **key point** is found using a difference of gaussian approach. That means you take a image and **blur** the image with gaussian blur. And at different magnitudes so of an image which is slightly blurred and an image which is more blurred and so on and so forth. And then you **substract** those images with each other, so you basically get different of images with different levels of gaussian blur. And stack those different images on top of each other, and you basically looking for extreme points, so points will all the neighbors in the XY image space as well as in the space of different level of smoothing which is local distinct which stand out. Those are your key points. You typically don't do that only for one images resolution you also preform of an image pyramid that means images which are differently scaled in size in order to find the key points that distinct respect to scale changes. So if you are closer to an object, you will still find the same key point if you are far away. So this about the key point. 

![key-point](key-point.png)

Next step is to compute the descriptor vector and you do that by looking into the local neighborhood of the key point of you find. And what you're doing is you're basically taking the local neighborhood and breaking it down in kind of into small areas and compute the gradients in this small area. Use gradient because the gradients are typically rather robust with respect to elimination changes also with certain view point changes. You basically compute those gradients and collect the gradients in local regions into histograms. So how often do certain gradients occur, what's their magnitude. You just turn this into histograms for small local regions and in the end around the key point in a 4x4 region, you compute histograms so 4x4=16 histograms. Every histograms is sidcretized in a 45 degree orientation that means has eight bins and this gives you 128 values. You basically just concatenating this 128 values and this gives you your descriptor vector.

![local-neighborhood](local-neighborhood.png)