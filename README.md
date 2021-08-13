# Part1 Mocap-data-collected-from-4-subjects

MoCap data are measured on four subjects, including one female (165 cm) and three male (170 ∼180 cm). 
The MoCap data is collected by an IMU MoCap equipment of model Perception Neuron Pro by the Noitom Inc..
The motion capture data is presented in the form of data.bvh file.
The BVH file contains two parts:

1) Human skeleton joints name and offset

2) Frame by frame motion sequence of each skeleton joints


# Part2 Human motion sequence segmentation based on ARMA
The content of folder 'Human motion sequence segmentation based on ARMA' is the whole algorithm project of article 'ARMA Based Segmentation of Human Limb Motion Sequences '.

The whole is divided into two parts:

1. For the calculation of motion sequence data and the calculation of the included angle of each limb bone segment of the human body, see the folder ‘Mocap data reading and limb bone partition angles calculation’.

1) Import the BVH file into script 'DATA_catching.m' and run it. With 'fivemotion'_ 1char00. bvh'as an example.

2) The output results include: BMP format file of motion sequence frame by frame, and the included angle data of bone segment of the motion sequence 'huQq. Mat'

2. For the establishment of ARMA model and the calculation of segmentation accuracy, see the folder 'ARMA model determination and segmentation accuracy solution'.

1) Import the 'huQq. Mat' file saved in step 1 into the script ’main.m’ in the folder ’ARMA model determination and segmentation accuracy solution’.

2) The output results include: ARMA model fitting result graph of motion sequence, segmentation point position and segmentation accuracy.

