#!/bin/bash

device=0
for data in 'hawkes_gaussian' 'hawkes_poly' '911calls'; do
{
        if [ $data == 'hawkes_gaussian' ]
        then
                T=15
                SEQ_NUM=2000
        elif [ $data == 'hawkes_poly' ]
        then
                T=15
                SEQ_NUM=2000
        elif [ $data == '911calls' ]
        then
                T=8.64
                SEQ_NUM=1607
        fi

	CUDA_VISIBLE_DEVICES=$device python rmtpp.py $data $SEQ_NUM $T |& tee log_rmtpp_$data
} & 

done
wait

