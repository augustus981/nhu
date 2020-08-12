#!/bin/sh
set -xe
if [ ! -f DeepSpeech.py ]; then
    echo "Please make sure you run this from DeepSpeech's top level directory."
    exit 1
fi;

python3 -u DeepSpeech.py \
  --train_files ../dp-train/train_VIVOS_FULL.csv \
  --dev_files ../dp-dev/dev_VIVOS_FULL.csv \
  --test_files ../dp-test/test_VIVOS_FULL.csv \
  --train_batch_size 128 \
  --audio_sample_rate 16000\
  --dev_batch_size 128 \
  --test_batch_size 128 \
  --n_hidden 2024 \
  --epochs 80 \
  --dropout_rate 0.30 \
  --learning_rate 0.0001 \
  --report_count 100 \
  --export_dir ../vivos_dp_models/ \
  --export_file_name Viet_model \
  --checkpoint_dir ../results/checkout-vivos/ \
  --alphabet_config_path data/lm/alphabet.txt \
  --scorer_path data/lm/vivos_full.scorer
  "$@"
