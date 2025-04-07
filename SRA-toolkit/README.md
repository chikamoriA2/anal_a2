mkdir -p Results

prefetch --output-directory ./Results --option-file SRR_Acc_list.txt

cat SRR_Acc_list.txt | xargs -i fasterq-dump -p -e 4 {}



