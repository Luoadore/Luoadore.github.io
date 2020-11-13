---
title: Binary Features
date: 2020-11-13 20:51:00
tags: 5 Minutes with Cyrill
---

# Binary Features

What are binary features?

Binary features are an alternative to the popular sift descriptor and they are faster to compute and more compact. Therefore attractive whenever you have mobile robots, autonomous cars that navigate throught the environment and need to solve the state estimation problems in an online fashion. So what are features? **Features are typically distinct points in image and descriptor gives me a signature** that I describes the key points that I considering. Basically that's all by extracting a local neighborhood around that point so a **local image patch** and computes the signature from this local patch. I want to dive today a little bit into the BRIEF descriptor which is a simple binary descriptor but which is quite powerful. It becomes important whenever you build visual slam systems that are supposed to run online where you want to establish stereo correspondences multiple image pairs or solve a place recognition task, then you can use those features. 

So let's have a small example where we have one image like the image here from Venice. And we want to compute the binary descriptor of a local image point like the chimney point over here and we extract a local neighborhood out of this image and turn this image into a big signature of bits of zeros and ones. So once we have such a signature for all locally distinct points of an image, we can actually take a second perform the operations on the second image as well. And establish for example correspondences between those features. It's important if you want to compute the relative orientation of the image pair. Those binary strings of the zero and one strings are computed in a very simple fashion for the brief descriptor. They are basically work by comparing excellent densities one to one. Let's sample two pixel location as s1 and s2. Then we compare the intensity values of these sample pixel locations in my local patch. And the intensity value s1 is smaller than the intensity value of s2 I return to one, otherwise I return to zero. If I do this for a set of pairs, I can use this to actually come up with a signature over here.

![patch-example](patch-example.png)

Small example, image patch of nine pixels. We compare pixels with each other. 

![signal-bits](signal-bits.png)

If we do this by sampling locations at which we want to compare our signature that we don't do the comparisons. Of course we have to **sample that order and then keep it fixed**. Otherwise we can generate different signatures for the same image patch which is obvious something we do not want. So what the BRIEF descriptor does it provides a sampling sequence and then you work yourself of the sequence perform the comparisons to get your zeros and ones. If you want to compare two bit strings A and B for example, that's could be done in a very simplistic fashion by just computing the xor operation over those two bit strings and count the numbers of ones. That gives you a larger distance the further those discriptors differ. And that's very fast to do and very handy.

ORB (Oriented FAST Rotated BRIEF) is the extension of BRIEF which combines fast key points with an optimized version of the BRIEF descriptor. It's rotations variant if you rotate your image or _ will still roughly give you the same signature where the BRIEF will not. ORB does this by just **estimating the main orientation** within the local image patch based on the gray scale values and then performs rotation of the sample points. Very easy and powerful way to compute signatures. So ORB is alternative to sift and _ which is popular to be used in several visual slam algorithms successfully. Solid performance in terms of matching performance as well as speed.