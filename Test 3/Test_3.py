# ---------------------------------------------------------------
# Name: Cen Liu
# Application No.: C2117860
# 
# Question: 3. Multilayer Perceptron for Regression
# Solution: Constructing and training the MLP model with PyTorch
# ---------------------------------------------------------------
import numpy as np 
import os
import glob
import re
import sys
import urllib
import tarfile
import zipfile
import os.path as osp

import torch
import torch.nn as nn
import torch.backends.cudnn as cudnn
from torch.utils.data import DataLoader
import torch.optim as optim
from torch.optim import lr_scheduler





max_epoch=10000
learning_rate=1
momentum=0





class mymodel(nn.Module):
	def __init__(self,middledim):
		super(mymodel, self).__init__()
		self.layer1=nn.Linear(3, middledim)
		self.layer2=nn.Linear(middledim, middledim)
		self.layer3=nn.Linear(middledim, 1)

	def forward(self, x):
		h1=torch.sigmoid(self.layer1(x))
		h2=torch.sigmoid(self.layer2(h1))
		y=torch.sigmoid(self.layer3(h2))
		return y




train_input 	=	np.loadtxt( 'train_data.txt' ,dtype='float')
train_output	=	np.loadtxt( 'train_truth.txt' ,dtype='float')
test_input 	=	np.loadtxt( 'test_data.txt' ,dtype='float')
train_input=torch.from_numpy(train_input).float()
train_output=torch.from_numpy(train_output).float().unsqueeze(1)
test_input=torch.from_numpy(test_input).float()


trainset=torch.utils.data.TensorDataset(train_input,train_output)
trainloader = DataLoader(trainset,
            batch_size=1000, shuffle=True,drop_last=True,
        )


myMLP = mymodel(4)
cri = nn.MSELoss()
optimizer=optim.SGD(myMLP.parameters(), lr=learning_rate, momentum=momentum)


scheduler = lr_scheduler.MultiStepLR(optimizer, milestones=[max_epoch//3,2*max_epoch//3], gamma=0.1)

# train version1
for epoch in range(max_epoch):
	preds=myMLP(train_input)
	loss=cri(preds,train_output)
	loss.backward()
	optimizer.step()

	scheduler.step()
	if epoch %300==0:
		print('epoch{} sumloss={}'.format(epoch+1,loss))


	if loss<0.001:
		print(epoch)
		break


# # train version2
# for epoch in range(5000):
# 	sumloss=0
# 	for batch_idx, (inputs, truths) in enumerate(trainloader):
# 		preds=myMLP(train_input)
# 		loss=cri(preds,train_output)
# 		loss.backward()
# 		optimizer.step()
# 		sumloss += loss.detach()
# 	if epoch %30==0:
# 		print('epoch{} sumloss={}'.format(epoch+1,sumloss/batch_idx))

test_pred=myMLP(test_input).squeeze(1).detach().numpy()

ss=test_pred.shape[0]
print(ss)
with open('test_predicted.txt', 'w') as txt:
	txt.write('y\n')
	for i in range(ss):
		txt.write(str(test_pred[i])+'\n')