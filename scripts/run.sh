#!/bin/bash

# herramientas
echo "publicando herramienta - terraform"
docker build -t terraform -f docker/Dockerfile.terraform .