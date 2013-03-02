import numpy as np
from scipy.ndimage import label
import matplotlib.pyplot as plt
from glob import glob


subject_list = sorted(glob('data/pilot*data*'))
color = {'S':'red','T':'green','R':'black'}

chunk_size = 8
for subject_data_file in subject_list:
    time_to_target = []
    fig = plt.figure()
    ax = fig.add_subplot(111)

    data = np.genfromtxt(subject_data_file,names=True,dtype='int32,|S1,int32,int32,int32,f2,f2,f2,int32')
    data_chunks = data.reshape(data['trial'].shape[0]/12,12)
    labels = []
    for idx, chunk in enumerate(data_chunks):
        rt = chunk['rt']
        block_type = chunk['type'][0]
        labels.append(block_type)
        rt = rt[rt != 0]
        ax.plot(np.repeat(idx,len(rt)), rt,'o',color=color[block_type],alpha='0.2',linestyle='None')
        ax.plot(idx, np.median(rt),'o',color='black',linestyle='None')
        ax.bar(idx, 
         np.median(rt), 
         width=0,
         linewidth=0, 
         color = 'k',
         yerr = [np.std(rt)/np.sqrt(len(rt))],
         ecolor = 'k')
        
    ind = np.arange(len(labels))
    ax.set_xticks(ind)
    ax.set_xticklabels(labels)   
    plt.show()

"""    mean_sd = np.mean(sd_rts)
    mean_rd = np.mean(rd_rts)
    from scipy.stats import ttest_ind
    t,p = ttest_ind(sd_rts,rd_rts)
    ax.text(0,0,'Mean_sd = %.02f, Mean_rd = %.02f, T = %.02f, p = %.02f'%(mean_sd,mean_rd,t,p))
    ax.set_ylabel('Time (s)')
    ax.set_title('%s Sequence Time to Target'%(subject))
    ax.set_xticklabels(sequence_labels)
    ax.set_ylim([.25,skill_bar+1])
    #autolabel(rects)
    plt.show()
"""

