# Mongo Cluster

Mongo cluster, deploying a ReplicaSet

### Inicializando o compose
```
sudo docker-compose -f docker-compose.ym up -d
```

### Conectando no primeiro NÓ
```
sudo docker-compose -f docker-compose.yml exec mongo-primary mongo -u "admin" -p "qwe123"

```

### Iniciando o NÓ para ReplicaSet
```
rs.initiate({"_id" : "rs0","members" : [{"_id" : 0,"host" : "mongo-primary:27017"},{"_id" : 1,"host" : "mongo-worker-1:27017"},{"_id" : 2,"host" : "mongo-worker-2:27017", arbiterOnly: true }]});
```

### Setando a prioridade do NÓ sobre os demais
```
conf = rs.config();
conf.members[0].priority = 2;
conf.members[1].priority = 0.5;
rs.reconfig(conf);
```

### Criando um usuário ADM para o Cluster
```
use admin;
db.createUser({user: "cluster_admin",pwd: "password",roles: [ { role: "userAdminAnyDatabase", db: "admin" },  { "role" : "clusterAdmin", "db" : "admin" } ]});
db.auth("cluster_admin", "password");
```

### Criando uma collection no Banco de dados
```
use my_data;
db.createUser({user: "my_user",pwd: "password",roles: [ { role: "readWrite", db: "my_data" } ]});
db.createCollection('my_collection');
```

### Verificando as credenciais criadas
```
docker-compose exec mongo-primary mongo -u "my_user" -p "password" --authenticationDatabase "my_data"
```

### Finalizando o compose
```
sudo docker-compose -f docker-compose.ym down
```