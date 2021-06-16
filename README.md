# Ambiente de Desenvolvimento Linux

Para utilizar as aplicações de desenvolvimento separadas abaixo é necessário seguir os tópicos 1, 2 e 3.

- LocalStack: Ambiente AWS Local
- MondoDB : Banco de dados NoSQL
- Keycloak : Authorization Server
- Redis : Armazenamento de dados na memória (key-value)
- Kafka : Mensageria Server (Streaming data)
- MongoCompass: Visualização do MongoDB


#
## 1 - Instalação do Docker
#
```
$ sudo apt-get update
```

```
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

```

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

```

```
$ echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```
$ sudo apt-get update
```

```
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

```

- Verificar se a instalação foi bem sucedida

```
$ sudo docker run hello-world
```

- Se a instalação foi bem sucedida o comando acima irá apresentar uma mensagem

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
.
.
.

```

#
## 2 - Instalação do Docker-Compose
#

```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

```

```
sudo chmod +x /usr/local/bin/docker-compose
```

```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

- Verificar se o docker-compose esta sendo reconhecido
```
docker-compose --version
```

#
## 3 - Mongo Compass
#

* Download MongoDB Compass

```
wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.1_amd64.deb
```

* Instalação
```
sudo dpkg -i mongodb-compass_1.26.1_amd64.deb
```

* Iniciar

```
mongodb-compass
```

* ou digitar na barra de pesquisa do ubuntu "Mongo Compass" </br></br>

* Referencia do **[Mongo Compass](https://docs.mongodb.com/compass/current/install/)**