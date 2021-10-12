# Instalacion de CEPH

## Requerimientos
  - Vagrant 2.2.18 o superior 

Initial export before vagrant up
```sh
export VAGRANT_EXPERIMENTAL="disks"
```

## Preparacion

### Creando un usuario cephuser

```sh
sudo useradd -m -s /bin/bash cephuser
sudo passwd -d cephuser
echo 'cephuser ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/cephuser
sudo chmod 0440 /etc/sudoers.d/cephuser
```

### Instalacion de utilerias para instalador ceph-python
```sh
sudo apt-get install -y python python-pip parted
```

### Configurando hosts
```sh
vim /etc/hosts
192.168.50.9 cephclient
192.168.50.10 cephadm1
192.168.50.11 cephmon1
192.168.50.21 cephosd1
192.168.50.22 cephosd2
192.168.50.23 cephosd3
```

### Configurando el host admin
```sh
vim ~/.ssh/config
Host cephadm1
Hostname cephadm1
User cephuser

Host cephmon1
Hostname cephmon1
User cephuser

Host cephosd1
Hostname cephosd1
User cephuser

Host cephosd2
Hostname cephosd2
User cephuser

Host cephosd3
Hostname cephosd3
User cephuser

Host cephclient
Hostname cephclient
User cephuser
```

```sh
chmod 644 ~/.ssh/config
```

### Creando llaves de acceso
```sh
ssh-keygen
```

### Copiando las llaves al cluster
```sh
ssh-keyscan cephosd1 cephosd2 cephosd3 cephclient cephmon1 >> ~/.ssh/known_hosts
ssh-copy-id cephadm1
ssh-copy-id cephosd1
ssh-copy-id cephosd2
ssh-copy-id cephosd3
ssh-copy-id cephmon1
```
Si no ~/.ssh/authorized_keys copiar manualmente las llaves

### Init key agent
```sh
ssh-agent bash
ssh-add -k ~/.ssh/id_rsa
```

## Configurando los nombres en hosts
```sh
echo "
192.168.50.10 cephclient
192.168.50.10 cephadm1
192.168.50.11 cephmon1
192.168.50.12 cephmon2
192.168.50.13 cephmon3
192.168.50.21 cephosd1
192.168.50.22 cephosd2
192.168.50.33 cephosd3
" | vagrant ssh cephmon1 -c 'sudo tee -a /etc/hosts'
```

<!-- echo "Append string to file" | ssh root@my.machine.remote 'cat >> ~/.ssh/authorized_keys' -->

## Step 4 – Configure the Ceph OSD Nodes

```sh
sudo fdisk -l /dev/sdb
sudo parted -s /dev/sdb mklabel gpt mkpart primario xfs 0% 100%
sudo mkfs.xfs -f /dev/sdb
sudo fdisk -s /dev/sdb
sudo blkid -o value -s TYPE /dev/sdb
```

## Step 5 – Build the Ceph Cluster

```sh
sudo su cephuser
cd ~
```

```sh
sudo pip install ceph-deploy
```

```sh
mkdir cluster
cd cluster
```

Creando un nuevo cluster
```sh
ceph-deploy new cephmon1
```

Configurando la red
```sh
vim ceph.conf
public network = 192.168.50.0/24
osd pool default size = 2
```

```sh
ceph-deploy install cephadm1 cephosd1 cephosd2 cephosd3 cephmon1
```

## Instalando Utilidades
```sh
sudo apt install chrony python3 python3-dev
```
