The project utilizes three open source library based on Matlab, please follow the desciription below to reproduce the result.

To reproduce the results please follow the below steps:
a. Enter into the project path and run the ImageRetrievalGUI.m file.
b. Click "upload image" to choose images from path Corel_Test.
c. Choose retrieval method and click "retrieval image" to see the result.
d. Choose the color image into box"source image"
e. Click "Color image" to see the result.

NOTE: The whole project runs successfully on my own personal computer, whose operating system is WINDOWS7 and matlab version is MATLAB R2015B.
The project utilizes three thrid-party libraries, if you fail to call functions from these libraries please follow steps below to re-compile them.
You may download the library online and add them to the path, compile them. But change a few lines of code as illustrated below.
NOTE that you must have VC++ environment to compile them.

1. vlfeat
Version 0.9.18 is used. To compile it follow the following step.
a. Enter into the project path in Matlab environment.
b. Execute the code: run('vlfeat-0.9.18-bin\vlfeat-0.9.18\toolbox\vl_setup');
c. Enter "vl_version", is has been compiled successfully if "0.9.18" appears.

2. libsvm
Version 3.21 is used. To compile it follow the following step.
a. Enter File->set path ->add with subfolders in Matlab and add path "libsvm-3.21\"
b. Enter into libsvm libsvm-3.21\matlab and enter into "mex -setup", choose the c++ compiler and enter "make"
c. Change svmtrain, svmpredict under path libsvm-3.21\matlab to libsvmtrain and svmpredict.(I have changed that, but if your download the library online do follow the step)

3. matconvnet
Version 1.0-beta17 is used. To compile it follow the following step.
a. Enter into the project path in Matlab environment and execute code "mex-setup"
b. Execute "run ./matconvnet-1.0-beta17/matlab/vl_setupnn".

Note if you download your own libraries which corrsopond to your operating system, change a few lines of codes below:
1. Change the code "run('vlfeat-0.9.18-bin\vlfeat-0.9.18\toolbox\vl_setup');" in 25th line of TestRetrieval.m to corrspond to your own vl_setup file.
2. Change the code "run ./matconvnet-1.0-beta17/matlab/vl_setupnn" in 546th line of TestRetrieval.m to corrspond to your own vl_setupnn file.

IF YOU HAVE ANY QUESTIONS ABOUT THE RUNNING OF THE CODE, DO CONTACT US AT xy1994@gatech.edu OR wangchl2016@gmail.com