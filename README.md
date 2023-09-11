# DanilaMyl_infra
DanilaMyl Infra repository

Подключение к someinternalhost 

ssh -i ~/.ssh/appuser -A -J appuser@<bastion_publicIP> appuser@someinternalhost

Чтобы была возможность подключиться по alias сохраняем в ~/.ssh/config 

### bastion
Host bastion
  HostName <bastion_publickIP>
  User appuser
  IdentityFile ~/.ssh/appuser
  ForwardAgent yes

### someinternalhost
Host someinternalhost
  HostName 10.128.0.12
  User appuser
  ProxyJump bastion

Проверяем подключение:

ssh bastion
ssh someinternalhost

VPN сервер bastion

 bastion_IP = 158.160.56.130
 someinternalhost_IP = 10.128.0.12

Администраитивная консоль доступна с валидным сертификатом https://vpn.158-160-56-130.sslip.io

Выполнено ДЗ №4

testapp_IP = 51.250.90.73
testapp_port = 9292

yc compute instance create \  
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=startup-script.yaml


Выполлнено ДЗ №5

запустить из директории packer: packer build -only '*ubuntu16' .
запустить из директории packer: packer build -only 'ubuntu16v2' .
config-scripts/create-reddit-vm.sh

http://51.250.72.214:9292/

Выполнено ДЗ №6

Запуститить проект: terraform apply

Проверить работоспособность: http://62.84.124.19:9292
