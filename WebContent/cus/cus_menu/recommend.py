import sys

import pandas as pd
from surprise import Dataset
from surprise import Reader

from surprise import SVD
import numpy as np
from hdfs import InsecureClient

# linux용
# client_hdfs = InsecureClient( "http://mh_master:50070" )
# with client_hdfs.read( "/input/cron-load/log-data-flumed.txt", encoding="utf-8" ) as reader :
#     raw_data = pd.read_csv(reader, header=None, names=columns, index_col=False )

fname="C:\home\encore\\flume\collect\log-data-flumed.txt"
columns = ['년','월','일','시','분','초','주문번호','아이디','나이','성별','지역','메뉴명','가격','수량']
raw_data = pd.read_csv(fname, header=None, names=columns, index_col=False)
collected = raw_data[['아이디', '메뉴명', '수량']]

grouped = dict(collected['수량'].groupby([collected['아이디'],collected['메뉴명']]).sum())

userID = []
itemID = []
rating = []
goal = {'itemID': itemID,
        'userID': userID,
        'rating': rating}
for i in grouped:
    userID.append(i[0])
    itemID.append(i[1])
    rating.append(grouped[i])
 
df = pd.DataFrame(goal)

reader = Reader(rating_scale=(0, 100))
data = Dataset.load_from_df(df[['userID', 'itemID', 'rating']], reader)

trainset = data.build_full_trainset()
algo = SVD()
algo.fit(trainset)

cus_id=sys.argv[1]
#cus_id='cus1001'

iids = df['itemID'].unique()
iids50 = df.loc[df['userID']== cus_id, 'itemID']
iids_to_pred = np.setdiff1d(iids, iids50)
testset = [[cus_id, iid, 100] for iid in iids_to_pred]
predictions = algo.test(testset)

pred_ratings = np.array([pred.est for pred in predictions])

i_max = pred_ratings.argpartition(kth=-10)[-10:]
i_max = i_max[np.argsort(pred_ratings[i_max])][::-1]

iid = iids_to_pred[i_max]
print(str(iid))