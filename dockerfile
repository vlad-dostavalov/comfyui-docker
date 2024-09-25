# Base image with Python
FROM python:3.10-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y git curl

# Install ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

# Set working directory
WORKDIR /ComfyUI

# Install required Python dependencies
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
RUN pip install -r requirements.txt

# Custom node installation
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /custom_nodes
RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git /custom_nodes
RUN git clone https://github.com/rgthree/rgthree-comfy.git /custom_nodes
RUN git clone https://github.com/city96/ComfyUI-GGUF /custom_nodes
RUN git clone https://github.com/XLabs-AI/x-flux-comfyui.git /custom_nodes
RUN git clone https://github.com/comfyanonymous/flux_text_encoders.git /custom_nodes

# Expose port for ComfyUI
EXPOSE 8188

# Create a script to download models at runtime
RUN chmod +x /scripts/download_models.sh

# Run the model download script at container start, then launch ComfyUI
CMD /scripts/download_models.sh && python main.py