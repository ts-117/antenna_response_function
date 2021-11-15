# -*- coding: utf-8 -*-
"""
Created on Mon Nov 15 18:43:36 2021

@author: tao_s
"""

import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns',100)
df=pd.read_excel(r'D:\南科大小卫星项目\电场天线\水中电场\after_result\response_function.xlsx'\
                 ,sheet_name='quantitative_Vpp',skiprows=5)
f=df['f']


#first calculate when add 5g salt
Eback5=(((df['back5_15']-df['back5_25'])/0.1+(df['back5_25']-df['back5_35'])/0.1\
    +(df['back5_35']-df['back5_45'])/0.1)/3).dropna()
add5=(df['plate5']/0.6).dropna()
Eback5=Eback5.append(add5)
Ea5=(df['left5_a']-df['right5_a'])/0.17
k5=Ea5/Eback5

#10g
Eback10=(((df['back10_15']-df['back10_25'])/0.1+(df['back10_25']-df['back10_35'])/0.1\
    +(df['back10_35']-df['back10_45'])/0.1)/3).dropna()
add10=(df['plate10']/0.6).dropna()
Eback10=Eback10.append(add10)
Ea10=(df['left10_a']-df['right10_a'])/0.17
k10=Ea10/Eback10

#20g
Eback20=(((df['back20_15']-df['back20_25'])/0.1+(df['back20_25']-df['back20_35'])/0.1\
    +(df['back20_35']-df['back20_45'])/0.1)/3).dropna()
add20=(df['plate20']/0.6).dropna()
Eback20=Eback20.append(add20)
Ea20=(df['left20_a']-df['right20_a'])/0.17
k20=Ea20/Eback20

#plot k with f
'''
plt.semilogx(f,k5,c='r',marker='o')
plt.semilogx(f,k10,c='b',marker='o')
plt.semilogx(f,k20,c='g',marker='o')
plt.xlabel('f(Hz)')
plt.ylabel('k')
plt.xlim(20,2e6)
plt.ylim(1.2,1.8)
plt.legend(['5g_salt','10g_salt','15g_salt'])
plt.savefig('pls_salt.png')
plt.show()
'''

#plot voltage
length=[15,25,35,45]
length=pd.Series(length,index=['0','1','2','3'])
Vback5=df[['back5_15','back5_25','back5_35','back5_45']].dropna()
plt.figure(figsize=(12,6))
plt.subplot(311)
plt.ylim(0,5)
plt.xlim(0,60)
for i in range(Vback5.shape[0]):
    V=Vback5.iloc[i]
    plt.plot(length,V.transpose(),marker='o')
plt.title('5g_salt')

plt.subplot(312)
plt.ylim(0,5)
plt.xlim(0,60)
Vback10=df[['back10_15','back10_25','back10_35','back10_45']].dropna()
for i in range(Vback10.shape[0]):
    V=Vback10.iloc[i]
    plt.plot(length,V.transpose(),marker='o')
plt.title('10g_salt')

plt.subplot(313)
plt.ylim(0,5)
plt.xlim(0,60)
Vback20=df[['back20_15','back20_25','back20_35','back20_45']].dropna()
for i in range(Vback20.shape[0]):
    V=Vback20.iloc[i]
    plt.plot(length,V.transpose(),marker='o')
plt.title('20g_salt')
plt.tight_layout()
plt.savefig('salt_voltage.png')


