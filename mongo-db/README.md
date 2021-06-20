# Mongo Cluster

Mongo cluster, deploying a ReplicaSet

![replica set status](./img/replica-set-nodes.jpg?raw=true "Replica set status")


### Inicializando o compose
```
sudo docker-compose -f docker-compose.ym up -d
```

### Verificando o estado do Cluster
```
sudo docker-compose -f docker-compose.ym ps
```

![Status](./img/status.png?raw=true "Status")

### Conectando no Cluster
```
sudo docker-compose -f docker-compose.yml exec mongo1 mongo "mongodb://mongo1:30001,mongo2:30002,mongo3:30003/test?replicaSet=rs0" -u admin -p "qwe123" --authenticationDatabase admin

```

### Finalizando o compose
```
sudo docker-compose -f docker-compose.ym down
```

### Abri no Mongo Compass </br></br>

* Antes de realizar os procedimentos abaixo é necessário adicionar a seguinte linha no arquivo hosts do sistema operacional. Para S.O Linux se encontra no caminho "/etc/hosts"
```
127.0.0.1 localhost mongo1 mongo2 mongo3
```

* Clicar em "New Connection" e colar a linha abaixo.
```
mongodb://mongo1:30001,mongo1:30002,mongo1:30003/test?replicaSet=rs0
```

* Clicar em "Fill in connection fields individually"

![Fill in connection fields individually](./img/newConnection.png?raw=true "Fill in connection fields individually")

* Veriricar se os campos estão como as imagens abaixo.

![Hostname](./img/tab1.png?raw=true "Hostname")
![More Options](./img/tab2.png?raw=true "More Options")

### Todas etapas anteriores concluídas

![Cluster Info](./img/clusterInfo.png?raw=true "Cluster Info")