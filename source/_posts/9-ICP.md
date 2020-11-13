---
title: Iterative Closest Point (ICP)
date: 2020-11-9 22:40:00
tags: 5 Minutes with Cyrill
---

# Iterative Closest Point (ICP)

What is ICP?

ICP stands for **Iterative Closest Point**. It's a technique point in order to align to point out with each other. So what means point alignment? The point cloud is typically a set of points of in 3D or in 2D. What we wanna do is we compute the transformation between two point cloud and the goal is that through this transformation points that are the same point in the real world actually lie on top of each other. So that we can incrementally build a consistent model of environment and therefore that's a key building block of most slam algorithms for example those that work based on laser LiDAR or RGBD data.

How does it work? Let's dive into an example and understand how this ICP I grow the bricks. It basically has two steps. A **data association step** and then a second step computing the transformation based on the data association. 

![line](line.png)

First step we want to line the blue and red point total and we using a simple nearest neighbor approach. That means we iterate over one point dot and look for the closest point to this point in the second point dot. And then make this alignment and these are my correspondences. My data association that I have guessed based on this initial configuration. The second step takes this data association and tries to find the **transformation** so that those two points are move on top of each other so to say the **distance** of those corresponding points actually get **minimized**. This is done by using two steps, the first step computes the **center of mass** of those corresponding points and shift the point falls on top of each other. The second step computes the optimal **rotation using an SVD** based approach so that the points then are better aligned with each other. Why better is not perfect? because my intra data association may not have been perfect so we do is we repeat this process and based on the gauss that we have right now how the points cause our line. We recompute the data association and then recompute the alignment. We do this over and over again. Data association, alignment (**iterate**). Until the converge. And this is the basically the ICP algorithm. the iterative closest point algorithm in its basic form. 

![aligned](aligned.png)

In practice they are variants out there how you can optimize the ICP algorithm. One prominent example is the **point-to-plane** metric, here you assume that the point don't distinct point in the environment but actually stem from a surface. They're basically randomly sampled through the scanner from surface. By making an alignment between the point cloud and the surface we don't create an artificial point-to-point alignment which may not exist in the real world. And this point-to-plane alignment typically or put a plane metric to really gives you a better result of your ICP algorithm. But what it does it requires that you leave this SVD approach and you have to go to general least squares approach and then you would most likely use the Gauss Newton method in order to minimize the error under this point-to-plane metric. But there are also several other variants out there such as techniques **projective ICP** that means you take the model that you have project it for example into the range image you created from your scanner and then try to find the alignment. You may also take into account **robust kernels** in your error minimization of promotion or the better deal with outliers. So if you have outlier situations where some of the points are really wrongly aligned, then those outlier rejection techniques help you in order to weight those points down and ignore them in your data association or reduce their impact when computing the transformation.

So there are several variants out there and it depends a little on the problem that you are which of the variants you want to use. Point-to-plane metric is probably today the standard for aligning point outs for example those that stem from a laser range scanner. If you want to investigate the ICP algorithm further I suggest visiting the [jupiter notebook](https://nbviewer.jupyter.org/github/niousus/notebooks/blob/master/icp.ipynb) that guides you through the SVD based approach to the least squares approach telling you how you can deal with outliers and then it's a very good starting point.

ICP is a key building block for laser-based SLAM.