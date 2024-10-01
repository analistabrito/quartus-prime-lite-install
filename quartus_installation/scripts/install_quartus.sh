#!/bin/bash

# Atualiza o sistema
sudo apt-get update && sudo apt-get upgrade -y

# Define URLs para download
QUARTUS_URL="https://www.intel.com/content/www/us/en/software-kit/795187/intel-quartus-prime-lite-edition-design-software-version-23-1-for-linux.html"
MODELSIM_URL="https://www.intel.com/content/www/us/en/software-kit/750666/modelsim-intel-fpgas-standard-edition-software-version-20-1-1.html"

# Baixe os instaladores
echo "Baixando o Quartus Prime Lite..."
wget $QUARTUS_URL -O quartus_installer.run

echo "Baixando o ModelSim..."
wget $MODELSIM_URL -O modelsim_installer.run

# Torna os arquivos executáveis
echo "Alterando permissão dos instaladores..."
chmod +x quartus_installer.run modelsim_installer.run

# Instala o Quartus Prime Lite
echo "Instalando o Quartus Prime Lite..."
./quartus_installer.run

# Instala dependências para o ModelSim (32-bit)
echo "Adicionando arquitetura i386 e instalando dependências..."
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32ncurses6 libxft2 libxft2:i386 libxext6 libxext6:i386

# Instala o ModelSim
echo "Instalando o ModelSim..."
./modelsim_installer.run

# Instruções de configuração final
echo "Aponte o caminho do ModelSim no Quartus Prime:"
echo "Vá em Tools > Options > EDA Tool Options e defina o caminho para a pasta 'bin' do ModelSim."
