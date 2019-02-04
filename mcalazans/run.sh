#/bin/bash

cd ./dwarfs-forge/recipes/
echo "Preparando AMI"
#packer build worker.json >> /tmp/out.log
AMI=$(cat /tmp/out.log | tail -2 | head -1 | cut -d \  -f 2)
AMI="ami-013cd234204b532a1"
echo "AMI = $AMI"
echo "Criando um mundo novo... :)"
cd ../../iluvatar-soundtrack/
yes yes | terraform apply -var worker_AMI=$AMI >> /tmp/out.log
