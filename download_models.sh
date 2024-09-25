#!/bin/bash

# Define model directories and create them if they don't exist
mkdir -p ./models/xlabs/flux
mkdir -p ./models/clip
mkdir -p ./models/vae
mkdir -p ./models/xlabs/ipadapters
mkdir -p ./models/xlabs/loras
mkdir -p ./models/xlabs/controlnets
mkdir -p ./models/clip_vision

# Download models
echo "Downloading models..."

curl -L -o ./models/xlabs/flux/flux1-dev-fp8-e4m3fn.safetensors https://huggingface.co/Kijai/flux-fp8/blob/main/flux1-dev-fp8-e4m3fn.safetensors
curl -L -o ./models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/clip_l.safetensors
curl -L -o ./models/clip/t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/t5xxl_fp8_e4m3fn.safetensors
curl -L -o ./models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors?download=true
curl -L -o ./models/xlabs/ipadapters/flux-ip-adapter.safetensors https://huggingface.co/XLabs-AI/flux-ip-adapter/blob/main/flux-ip-adapter.safetensors
curl -L -o ./models/xlabs/loras/flux-realism-lora.safetensors https://huggingface.co/XLabs-AI/flux-RealismLora/blob/main/lora.safetensors
curl -L -o ./models/xlabs/controlnets/flux-canny-controlnet-v3.safetensors https://huggingface.co/XLabs-AI/flux-controlnet-collections/blob/main/flux-canny-controlnet-v3.safetensors
curl -L -o ./models/xlabs/controlnets/flux-depth-controlnet-v3.safetensors https://huggingface.co/XLabs-AI/flux-controlnet-collections/blob/main/flux-depth-controlnet-v3.safetensors
curl -L -o ./models/clip_vision/clip-vit-large.safetensors https://huggingface.co/openai/clip-vit-large-patch14/blob/main/model.safetensors

echo "Model downloads complete!"