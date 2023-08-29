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


