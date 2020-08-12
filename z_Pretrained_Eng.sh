#!/bin/sh
set -xe
if [ ! -f DeepSpeech.py ]; then
    echo "Please make sure you run this from DeepSpeech's top level directory."
    exit 1
fi;

python3 -u DeepSpeech.py \
  --train_files ../dp-train/train.csv \
  --dev_files ../dp-dev/dev.csv \
  --test_files ../dp-test/test.csv \
  --train_batch_size 48 \
  --audio_sample_rate 48000\
  --dev_batch_size 40 \
  --test_batch_size 40 \
  --n_hidden 2048 \
  --epochs 125 \
  --dropout_rate 0.30 \
  --report_count 100 \
  --learning_rate 0.0001 \
  --drop_source_layers 4 \
  --load_checkpoint_dir ../results/0.7.4 \
  --export_dir ../vi_dp_models/ \
  --export_file_name Eng_Viet_model \
  --checkpoint_dir ../results/checkout_pretrained/ \
  --alphabet_config_path data/lm/alphabet.txt \
  --scorer_path data/lm/vi_training_scorer.scorer
  "$@"
