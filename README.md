# Coursera-Robotics-Perception
This repository includes all programming assignments solved while attending Coursera's Perception course.

Assignments were completed with GNU Octave, version 4.0

For more information, please refer - https://www.coursera.org/learn/robotics-perception

**Course Syllabus**

Week1 - Geometry of Image Formation

- We will begin this course with a tutorial on the standard camera models used in computer vision. These models allow us to understand, in a geometric fashion, how light from a scene enters a camera and projects onto a 2D image. 
- By defining these models mathematically, we will be able understand exactly how a point in 3D corresponds to a point in the image and how an image will change as we move a camera in a 3D environment. 
- In the later modules, we will be able to use this information to perform complex perception tasks such as reconstructing 3D scenes from video.


Week2 - Projective Transformations

- Now that we have a good camera model, we will explore the geometry of perspective projections in depth. 
- We will find that this projection is the cause of the main challenge in perception, as we lose a dimension that we can no longer directly observe. 
- In this module, we will learn about several properties of projective transformations in depth, such as vanishing points, which allow us to infer complex information beyond our basic camera model.


Week3 - Pose Estimation

- In this module we will be learning about feature extraction and pose estimation from two images. 
- We will learn how to find the most salient parts of an image and track them across multiple frames (i.e. in a video sequence). 
- We will then learn how to use features to find the position of the camera with respect to another reference frame on a plane using Homographies. 
- We will also learn about how to make these techniques more robust, using least squares to hand noisy feature points or RANSAC to remove completely erroneous feature points.


Week4 - Multi-View Geometry

- Now we will use what we learned from two view geometry and extend it to sequences of images, such as a video. We will explain the fundamental geometric constraints between point features in images, the Epipolar constraint, and learn how to use it to extract the relative poses between multiple frames. 
- We will finish by combining all this information together for the application of Structure from Motion, where we will compute the trajectory of a camera and a map throughout many frames and refine our estimates using Bundle adjustment.
