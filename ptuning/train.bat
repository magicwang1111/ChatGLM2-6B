set PRE_SEQ_LEN=128
set LR=2e-2
set NUM_GPUS=1

python main.py^
    --do_train^
    --train_file dataset/train.json^
    --validation_file dataset/dev.json^
    --preprocessing_num_workers 10^
    --prompt_column content^
    --response_column summary^
    --overwrite_cache^
    --model_name_or_path THUDM/chatglm2-6b^
    --output_dir output/adgen-chatglm2-6b-pt-%PRE_SEQ_LEN%-%LR%^
    --overwrite_output_dir^
    --max_source_length 64^
    --max_target_length 128^
    --per_device_train_batch_size 2^
    --per_device_eval_batch_size 2^
    --gradient_accumulation_steps 16^
    --predict_with_generate^
    --max_steps 3000^
    --logging_steps 10^
    --save_steps 1000^
    --learning_rate %LR%^
    --pre_seq_len %PRE_SEQ_LEN%^
    --quantization_bit 4