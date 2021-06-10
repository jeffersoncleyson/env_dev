# Resumo das aplicações no Docker-Compose

#
## Kafka Server
#

O Apache Kafka é um sistema de mensagens usado para criar aplicações de streaming, ou seja, aquelas com fluxo de dados contínuo.
O Kafka é adequado para soluções com grande volume de dados (big data) porque uma das suas características é a alta taxa de transferência.

O Apache Kafka tem 3 funcionalidades:

- Sistema de mensagem do tipo publish/subscribe;
- Sistema de armazenamento: as mensagens ficam armazenadas por um período de tempo pré-definido. Por padrão, as mensagens duram 7 dias, mas podem até mesmo ficar indefinidamente;
- Processamento de stream: é possível transformar a mensagem imediatamente após o seu recebimento.

Para mais detalhes consulta este artigo [**Como fazer a integração de dados com Apache Kafka**](https://blog.geekhunter.com.br/apache-kafka/)


#
## Zookeeper
#

O Apache ZooKeeper é um serviço centralizado para manter informações de configuração, nomear, fornecer sincronização distribuída e oferecer serviços de grupo. Para obter mais informações sobre o ZooKeeper, [**consulte**](http://zookeeper.apache.org).

#
## KafDrop
#

Kafdrop é um interface web para visualizar os tópicos do kafka e navegar nos grupos dos consumidores. A ferramenta mostra informações como brokers, tópicos, partições, consumidores, e deixa ver mensagens. Para consultar informações desse projeto open-source acessar [**github**](https://github.com/obsidiandynamics/kafdrop)</br>

**Para consultar os Tópicos disponíveis acessar o navegador com o endereço abaixo:**</br>

```
http://localhost:19000/
```


#
### *Docker compose foi feito com base em dois tutorias da internet [LINK1](https://medium.com/azure-na-pratica/apache-kafka-kafdrop-docker-compose-montando-rapidamente-um-ambiente-para-testes-606cc76aa66) e [LINK2](https://medium.com/trainingcenter/apache-kafka-codifica%C3%A7%C3%A3o-na-pratica-9c6a4142a08f)*
#

