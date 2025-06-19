#!/bin/bash

IMAGE_NAME="nerfstudio-cuda11"
CONTAINER_NAME="nerfstudio-container"

# Ruta local a tu proyecto (ajústala si es necesario)
LOCAL_DIR="/home/horte/Documents/horte/GitHub/3DSplatting"
CONTAINER_DIR="/root/3DSplatting"

# Construir imagen
echo "🛠️  Construyendo la imagen '$IMAGE_NAME'..."
docker build -t $IMAGE_NAME .

# Ejecutar contenedor con recursos asignados y entorno gráfico si se desea
echo "🚀 Iniciando contenedor '$CONTAINER_NAME'..."
docker run -it \
    --cpus=8 \
    --memory=11g \
    --memory-swap=17g \
    --shm-size=6g \
    --runtime=nvidia \
    --gpus all \
    --runtime=nvidia \
    --name $CONTAINER_NAME \
    -v "$LOCAL_DIR:$CONTAINER_DIR" \
    $IMAGE_NAME
