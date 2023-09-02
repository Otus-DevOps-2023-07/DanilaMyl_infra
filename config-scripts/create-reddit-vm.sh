#!/bin/bash
yc compute instance create \
            --name reddit-app-full \
            --hostname reddit-app \
            --zone=ru-central1-a \
            --create-boot-disk size=20GB,image-id=fd87s0kpmdh4ief69665  \
            --cores=2   --memory=8G   --core-fraction=100 \
            --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
            --ssh-key ~/.ssh/appuser.pub
