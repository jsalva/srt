import numpy as np
import os
from scipy.ndimage import label
import matplotlib.pyplot as plt
from glob import glob


subject_list = sorted(glob('data/pilot*data*'))
color = {'S':'blue','T':'green','R':'black','error':'red'}

chunk_size = 8
for subject_data_file in subject_list:
    subject = os.path.split(subject_data_file)[-1][:os.path.split(subject_data_file)[-1].find('_data_')]
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
        responded_rt = rt[rt != 0]
        made_errors = chunk['made_errors']
        made_errors = made_errors[rt != 0]
        correct_rt = responded_rt[made_errors==0]
        error_rt = responded_rt[made_errors==1]
        ax.plot(np.repeat(idx,len(correct_rt)), correct_rt,'o',color=color[block_type],alpha='0.2',linestyle='None')
        ax.plot(np.repeat(idx,len(error_rt)), error_rt,'x',color=color['error'],linestyle='None')
        ax.plot(idx, np.median(correct_rt),'o',color='black',linestyle='None')
        """ax.bar(idx, 
         np.median(correct_rt), 
         width=0,
         linewidth=0, 
         color = 'k',
         yerr = [np.std(correct_rt)/np.sqrt(len(correct_rt))],
         ecolor = 'k')
        """
    
    ind = np.arange(len(labels))
    ax.set_xticks(ind)
    ax.set_xticklabels(labels)   
    ax.set_title(subject)

    
    errors_vec = data['made_errors']
    rt_vec = data['rt']
    cluster_medians = np.zeros(rt_vec.shape)
    clean_data = data[(errors_vec != 1)&(rt_vec != 0)]
    types = np.unique(clean_data['type'])
    cluster_map = dict()
    for block_type in types:
        labels = label(clean_data['type'] == block_type)[0]
        cluster_ids = np.unique(labels)
        cluster_ids = cluster_ids[cluster_ids != 0]
        for cluster_id in cluster_ids:
            cluster_boolean_mask = labels == cluster_id
            cluster_start_idx = np.nonzero(cluster_boolean_mask)[0][0]
            cluster_rt = clean_data['rt'][cluster_boolean_mask]
            print block_type
            cluster_map[cluster_start_idx] = (block_type,cluster_rt)
    cluster_order = sorted(cluster_map.keys())
    skill_scores = []
    for idx,cluster_idx in enumerate(cluster_order):
        (block_type,rt) = cluster_map[cluster_idx]
        if (block_type == 'S') or (block_type == 'T'):
            median = np.median(rt)
            flanking_block_median = np.median(np.hstack([
                    cluster_map[cluster_order[idx-1]][1],
                    cluster_map[cluster_order[idx+1]][1]
                    ]))
            score = (flanking_block_median - median) / flanking_block_median
            x = cluster_idx/12.
            y = median
            skill_scores.append(((x,y),score))

    for location,s_score in skill_scores:
        plt.text(*location,s='{0:.03f}'.format(s_score))

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

