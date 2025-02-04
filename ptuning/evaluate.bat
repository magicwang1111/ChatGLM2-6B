set PRE_SEQ_LEN=128
set CHECKPOINT=adgen-chatglm2-6b-pt-128-2e-2
set STEP=3000
set NUM_GPUS=1

python main.py^
    --do_predict^
    --validation_file dataset/dev.json^
    --test_file dataset/dev.json^
    --overwrite_cache^
    --prompt_column content^
    --response_column summary^
    --model_name_or_path THUDM/chatglm2-6b^
    --ptuning_checkpoint ./output/%CHECKPOINT%/checkpoint-%STEP%^
    --output_dir ./output/%CHECKPOINT%^
    --overwrite_output_dir^
    --max_source_length 64^
    --max_target_length 64^
    --per_device_eval_batch_size 1^
    --predict_with_generate^
    --pre_seq_len %PRE_SEQ_LEN%^
    --quantization_bit 4
