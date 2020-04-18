#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


df=pd.read_csv("dataset_Facebook.csv",sep=';')#Import the dataset


# In[3]:


df


# In[4]:


df[["Page total likes","Type","Category","comment","like","share"]]


# In[5]:


photo=df["Type"]=="Photo"#likes comment share of people posting photos in the month of December
month=df["Post Month"]==12
df[photo & month][["Page total likes","Type","Post Weekday","Post Hour","like","comment","share"]]


# In[6]:


df.iloc[:200]


# In[7]:


photo=df["Type"]=="Photo"
month=df["Post Month"]==12
r=df[photo & month][["Page total likes","Type","Post Weekday","Post Hour","like","comment","share"]]

r1=df[photo & month][["Page total likes","Lifetime Engaged Users","Total Interactions"]]


# In[8]:


r


# In[9]:


r1


# In[10]:


result=pd.merge(r,r1,on="Page total likes",how="inner")#merging data 


# In[11]:


result


# In[12]:


df.sort_values(["Post Month","Post Weekday","Post Hour","comment","like","share"])#sorting values according to month,day,hour,comment,like,share


# In[13]:


df.transpose()#Transpose of the dataframe


# In[14]:


pd.melt(r,id_vars=["Page total likes"],value_vars=["Post Weekday"],var_name ='Weekday', value_name ='Likes_day')

#Melting of dataframe


# In[15]:


pd.melt(r1,id_vars="Lifetime Engaged Users",value_vars="Total Interactions")


# In[16]:


melt=pd.melt(r1,id_vars="Lifetime Engaged Users",value_vars="Total Interactions")
melt.pivot(index="Lifetime Engaged Users",columns="variable",values="value")
#Casting to wide format


# In[ ]:




