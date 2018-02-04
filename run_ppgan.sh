#!/bin/bash
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

	for penalty in 0.1 0.3 0.9 3; do
	{
		if [ $penalty == 0.01 ]
		then 
			device=0
		elif [ $penalty == 0.1 ]
		then
			device=0
		elif [ $penalty == 0.3 ]
		then
			device=0
		elif [ $penalty == 0.9 ]
		then
			device=1
		elif [ $penalty == 3 ]
		then
			device=1
		elif [ $penalty == 10 ]
		then
			device=1
		fi

		CUDA_VISIBLE_DEVICES=$device python ppwgan.py $data $SEQ_NUM $penalty $T  |& tee log_wgan_$data$penalty
	} &

	done
	wait

}
done



