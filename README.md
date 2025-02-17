# Signal, Image and Video Project

## Table of Contents

- [Introduction]()
- [Installation]()
- [References]()

## Introduction

This project focuses on the analysis of indoor climbing images. Initially, we conducted an analysis of climbing holds, aiming to identify and segment them while reducing noise in the images.

Next, we expanded our work to analyze climbing routes, continuing to refine noise reduction techniques while also incorporating hold color analysis.

To compare our work in computer vision and image analysis, we trained two machine learning models: one to detect climbing holds and another to classify their colors.

For the best understanding of our workflow, we recommend viewing the notebooks in the following sequence:

1. [Hold Analysis](./hold_analysis.ipynb)
2. [Route Analysis](./route_analysis.ipynb)
3. [Machine Learning Analysis](./ml_analysis.ipynb)


## Installation 

We recommend using Python version 3.12.9.

```bash
# Clone the repository
git clone https://github.com/LeonardoBottonaUniTn/siv_project.git


# Install dependencies
pip install -r requirements.txt
```

## References  

- Our work was inspired by the blog post [Bouldering Holds Segmentation](https://blog.tjtl.io/bouldering-and-computer-vision/#bouldering-holds-segmentation).  
  - In particular, we referred to [this paper](./papers/01_Computer%20Vision%20Based%20Indoor%20Rock%20Climbing%20Analysis.pdf).
  - Additionally, we also referred to other papers available in the [papers folder](./papers).
- We utilized Roboflow for model training.  
