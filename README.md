# Brain-Waves-As-Biometric
This was a fun project I worked on which basically uses Machine Learning to recognize patterns from brain wave signals.

The Neurosky device collects and processes the brain waves using electrodes that are in contact with the user's forehead, ears, and skull. The device looks like the picture below.

<p align="center">
  <img src="https://github.com/imjunaida/Brain-Waves-As-Biometric/blob/main/neurosky.jpeg" width= 250 height= auto>
  </p>

## Reading brain wave values from the device
1. Connect and pair the headset with your device.
2. Install/Build at least the *Thinkgear.dll* file in your system to communicate with the device
3. Run the Matlab scripts **attention.m** or **Ex_attention.m**.

<br>The values will be displayed in the Matlab terminal once the script is run. We recorded the values to build a dataset of
over 50,000 values. A sample of the dataset can be seen in the *Sample_Dataset.csv* file.

## Data pre-processing: Cleaning, scaling, and sampling
Once we form the dataset, we notice that some values are missing for alpha, beta, or gamma values. Since the data is time series we fill the empty values with the rolling mean at
that instance. 
<br> We remove values from the fields that have more than 2 empty values.
<br> The cleaned data is then scaled and normalized for training and testing.
<br> We also randomly sample the data from each class into training, test, and validation set.

## Classification problem

We fit 2 classifiers here for this problem namely: KNN and Random Forest. It is observed that Random Forest outperformed KNN on both test and validation sets. (Test Accuracy 87.13%)
Fusing this problem into an authenticating system would produce a decent enough system that uses brain waves as a primary Biometric.

## Home Automation

We also used the brain waves data to control smart home appliances. We can detect blinks very easily with the script in *homeauto.m* file.
<br> The appliances connected to your device can be switched ON or OFF with blinks or varied concentration values. 
<br>It can also be registered to a person using their Biometric pattern
recorded by our classifier above which allow a personalized access to the smart appliances.
<br> The picture below shows the sample GUI of the *homeauto.m* for controlling smart appliances
<p align="center">
  <img src="https://github.com/imjunaida/Brain-Waves-As-Biometric/blob/main/homeauto3.png" width= 500 height= auto>
  </p>

