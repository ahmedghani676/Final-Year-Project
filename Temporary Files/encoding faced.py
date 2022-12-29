from sklearn.preprocessing import LabelEncoder
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.datasets import fetch_lfw_people
from sklearn.metrics import classification_report
from sklearn.decomposition import PCA
from sklearn.neural_network import MLPClassifier
import numpy as np
import cv2
from sys import getsizeof
from numpy import array
import numpy as np
import pandas as pd
import cv2 as cv
from google.colab.patches import cv2_imshow
from skimage import io
from PIL import Image
# Load data
import cv2
!wget "https://cdn.pixabay.com/photo/2021/02/12/02/01/rosebud-6006985_1280.jpg"
img_color = cv2.imread('rosebud-6006985_1280.jpg',1)
img_grayscale = cv2.imread('rosebud-6006985_1280.jpg',0)
img_unchanged = cv2.imread('rosebud-6006985_1280.jpg',-1)

lfw_dataset = fetch_lfw_people(min_faces_per_person=100)
_, h, w = lfw_dataset.images.shape
X = img_grayscale
print(X.shape)
array1 = array(X)
size1 = getsizeof(X)
print(size1)
y = lfw_dataset.target
# print(y[1].shape)
target_names = lfw_dataset.target_names
# print(target_names)
pcafaces =np.array([f.flatten() for f in X[0]])

print(pcafaces.shape)
array2 = array(pcafaces)
size2 = getsizeof(pcafaces)
print(size2)

n_components = 100
pca = PCA().fit(pcafaces)
n_components = 50
eigenfaces = pca.components_[:n_components]
# apply PCA transformation
...
# Generate weights as a KxN matrix where K is the number of eigenfaces and N the number of samples
weights = eigenfaces @ (pcafaces - pca.mean_).T
print(weights)
