#!/bin/bash
sudo apt update -y && sudo upgrade -y && sudo apt install -y curl vim jq git make docker.io unzip
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
