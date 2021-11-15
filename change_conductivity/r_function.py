# -*- coding: utf-8 -*-
"""
Created on Sun Oct 31 22:35:19 2021

@author: tao_s
"""

import pandas as pd
import matplotlib.pyplot as plt
df=pd.read_excel(r'D:\南科大小卫星项目\电场天线\水中电场\response_function.xlsx'\
                 ,sheet_name='with_salt',skiprows=1)
f=df['f']
back_E=df['plate']/0.6
delta_V=df['diff']
dV=df['left_antenna']-df['right_antenna']
E_d=delta_V/0.17
E=dV/0.17

k_d=E_d/back_E
k=E/back_E

plt.semilogx(f,k_d,color='r')
plt.semilogx(f,k,color='b')
plt.xlabel('f(Hz)')
plt.ylabel('k')
plt.xlim(20,2e6)
plt.ylim(1.2,1.8)
plt.grid()
plt.legend(['difference_by_oscilloscope','difference_by_human'])


