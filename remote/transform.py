import pandas as pd
import xml.etree.ElementTree as ET
import time
from datetime import datetime

lib='Library.xml'

tree = ET.parse(lib)
root = tree.getroot()

main_dict=root.findall('dict')

for item in list(main_dict[0]):
    if item.tag=="dict":
        tracks_dict=item
        break

tracklist = list(tracks_dict.findall('dict'))

library=[]

for item in tracklist:
    x=list(item)
    library.append(x)

def cols(kind):
    cols=[]
    for i in range(len(kind)):
        for j in range(len(kind[i])):
            if kind[i][j].tag=="key":
                cols.append(kind[i][j].text)
    return set(cols)

library_cols = cols(library)

start_time = datetime.now()

def df_creation(kind, cols):
    df=pd.DataFrame(columns=cols)
    dict1={}
    for i in range(len(kind)):
        for j in range(len(kind[i])):
            if kind[i][j].tag=="key":
                dict1[kind[i][j].text]=kind[i][j+1].text
        list_values=[i for i in dict1.values()]   
        list_keys=[i for i in dict1.keys()]                                 
        df_temp=pd.DataFrame([list_values],columns=list_keys)                   
        df=pd.concat([df,df_temp],axis=0,ignore_index=True,sort=True)  

    df.index.names = ['ID']
    df.pop('Comments')
    df.to_csv('library_redo.csv') 

df_creation(library,library_cols)

end_time = datetime.now()

delta_time = end_time - start_time

print("Total transformation time in minutes: ", delta_time.total_seconds()/60)

