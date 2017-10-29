%acclaimPlayFile('./subjects/01/01.asf', './subjects/01/01_01.amc', 0.002)
A = []
skeleton = acclaimReadSkel('./subjects/01/01.asf');
[channels, skeleton] = acclaimLoadChannels('./subjects/01/01_01.amc', skeleton);
SaveAMCAsMat('test.mat');