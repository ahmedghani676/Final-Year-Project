# FinalYearProject
It is a software project that automates the process of taking attendance using facial recognition technology. It likely includes the source code, documentation, and other resources necessary to build and run the attendance system.
This is a Python-based project that uses facial recognition technology to automatically take attendance in a classroom setting. The project uses a camera to capture images of students and compare them to a database of pre-existing images to mark attendance.

Requirements
This project requires Python 3.6 or higher, as well as the following Python packages:

OpenCV
NumPy
Pillow
face-recognition
To install these packages, run the following command:

Copy code
pip install opencv-python numpy pillow face-recognition
Installation
To install this project, clone the repository from GitHub and install the required packages:



Create a folder called "known_faces" and place the images of the students in that folder. The images should be named with the student's name (e.g., "John Smith.jpg").
Run the script train.py to create a database of the known faces. This will create a file called faces.dat.
Run the script recognize.py to start the camera and begin taking attendance. The script will mark attendance for any known face that is detected.
Code Structure
This project is structured as follows:

train.py: Script for training the system with known faces.
recognize.py: Script for running the facial recognition system and taking attendance.
known_faces/: Folder containing images of known faces.
data/: Folder containing the faces.dat file, which is used to store the known faces database.
Examples
To see an example of how to use this project, see the example/ directory. There, you'll find a Jupyter notebook that demonstrates how to use the system to take attendance.





