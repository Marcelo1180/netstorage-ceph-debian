# Instalacion de CEPH
1. Definicion de hosts

```sh
vim /etc/hosts
192.168.50.10 cephclient
192.168.50.10 cephadm1
192.168.50.11 cephmon1
192.168.50.12 cephmon2
192.168.50.13 cephmon3
192.168.50.21 cephosd1
192.168.50.22 cephosd2
192.168.50.33 cephosd3
```

# Configurando los nombres en hosts
```sh
echo "192.168.50.10 cephclient\n192.168.50.10 cephadm1\n192.168.50.11 cephmon1\n192.168.50.12 cephmon2\n192.168.50.13 cephmon3\n192.168.50.21 cephosd1\n192.168.50.22 cephosd2\n192.168.50.33 cephosd3\n" | vagrant ssh cephmon1 -c 'sudo tee -a /etc/hosts'
```

<!-- echo "Append string to file" | ssh root@my.machine.remote 'cat >> ~/.ssh/authorized_keys' -->
