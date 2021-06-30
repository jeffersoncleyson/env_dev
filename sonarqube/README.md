# Utilização do SonarQube

SonarQube é uma ferramenta para garantir a qualidade do código fonte em desenvolvimento.

Ele realiza diversas análises durante o processo de compilação da aplicação, detectando por exemplo:

* Trechos de código fonte que possam gerar bugs
* Duplicidade de linhas de comando, prevenindo a repetição de instruções desnecessárias
* Segurança

Essas análises atendem a métricas de qualidade configuradas na própria ferramenta seguindo alguns padrões predefinidos, mas que são facilmente customizáveis.

#
## Instalação do Maven na máquina
#

É pré-requisito ter o java instalado na máquina.</br></br>

* Passo 1: Fazer download do binário do maven

```
Download apache-maven-3.8.1-bin.tar.gz 
```

* Passo 2: Abrir o terminal do linux e acessar a seguinte pasta.

```
cd /opt/
```

* Passo 3: Extrar o binário do maven

```
sudo tar -xvzf ~/Downloads/apache-maven-3.8.1-bin.tar.gz
```

* Passo 4: Editar o arquivo /etc/environment e adicionar a variável abaixo: M2_HOME.

```
sudo nano /etc/environment
```

```
M2_HOME="/opt/apache-maven-3.8.1"
```

* Passo 5: Ainda no arquivo /etc/environment, por segurança foi adicionado a variável do JAVA_HOME. </br>
*Observação: O caminho do java pode variar de uma máquina para outra*

```
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
```

* Passo 6: Em /etc/environment verificar se o arquivo ficou como apresentado abaixo. Se tudo esta como esperado salvar o arquivo. </br>
*Observação: Ignorar o PATH*

```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
M2_HOME="/opt/apache-maven-3.8.1"
```

* Passo 7: Atualizar para o sistema as variáveis.

```
source /etc/environment
```

* Passo 8: Atualizar o comando do mvn

```
sudo update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/apache-maven-3.8.1/bin/mvn" 0
```
```
sudo update-alternatives --set mvn /opt/apache-maven-3.8.1/bin/mvn
```

* Passo 9: Adicionando auto complete para comandos complexos do mvn

```
sudo wget https://raw.github.com/dimaj/maven-bash-completion/master/bash_completion.bash --output-document /etc/bash_completion.d/mvn
```

* Passo 10: Verificando se tudo ocorreu como o esperado

```
mvn --version
```

```
Apache Maven 3.8.1 (05c21c65bdfed0f71a2f2ada8b84da59348c4c5d)
Maven home: /usr/local/apache-maven-3.8.1
Java version: 11.0.11, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk-amd64
Default locale: pt_BR, platform encoding: UTF-8
OS name: "linux", version: "5.8.0-59-generic", arch: "amd64", family: "unix"
```

* Material de referência *(Install Apache Maven on Linux)[https://www.javahelps.com/2017/10/install-apache-maven-on-linux.html]*



#
## Configuração do Projeto - POM.xml
#

* Dentro da tag build inserir o código abaixo
```
    <pluginManagement>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
            </plugin>
            <plugin>
                <groupId>org.sonarsource.scanner.maven</groupId>
                <artifactId>sonar-maven-plugin</artifactId>
                <version>3.7.0.1746</version>
            </plugin>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>0.8.6</version>
            </plugin>
        </plugins>
    </pluginManagement>
```

* Dentro da tag project inserir o código abaixo
```
    <profiles>
        <profile>
            <id>coverage</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <properties>
                <sonar.host.url>http://localhost:9000</sonar.host.url>
                <sonar.projectKey>my-project</sonar.projectKey>
                <sonar.login>8e7d4a5e9229a8b71880a12ef7af7ec0a5db4150</sonar.login>
            </properties>
            <build>
                <plugins>
                    <plugin>
                        <groupId>org.jacoco</groupId>
                        <artifactId>jacoco-maven-plugin</artifactId>
                        <executions>
                            <execution>
                                <id>prepare-agent</id>
                                <goals>
                                    <goal>prepare-agent</goal>
                                </goals>
                            </execution>
                            <execution>
                                <id>report</id>
                                <goals>
                                    <goal>report</goal>
                                </goals>
                            </execution>
                        </executions>
                    </plugin>
                </plugins>
            </build>
        </profile>
    </profiles>
```


#
## Configuração do MAVEN - Settings.xml
#

* Dentro de settings.xml do maven inserir o código abaixo

```
<pluginGroups>
    <pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
</pluginGroups>
```

* Como deve ficar o settings.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

    <pluginGroups>
        <pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
    </pluginGroups>

</settings>
```

#
## Configurar o SonarQube
#

* Passo 1: Iniciar o compose do SonarQube

```
docker-compose -f docker-compose up -d
```

* Passo 2: Acessar a interface do SonarQube

```
http://localhost:9000
```

* Passo 3: Criar um projeto

```
http://localhost:9000/admin/projects_management
```

* Passo 4: Clicar em "create project"

```
http://localhost:9000/admin/projects_management
```

* Passo 5: Inserir nome e chave do projeto
```
Name: my-project
Key: my-project
```

* Passo 6: Após criar clicar no projeto e adiconar o nome do token, por exemplo "my-project"
* Passo 7: Clicar em continuar.
* Passo 8: Clicar em Java -> Maven
* Passo 9: Subistituir os valores apresentados neste passo dentro do pom.xml na tag profiles -> profile -> properties.

</br>

* Referência: (SonarQube with Postgres on docker-compose)[https://pauledenburg.com/sonarqube-postgres-docker-compose]

```
mvn sonar:sonar \
  -Dsonar.projectKey=my-project \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=8e7d4a5e9229a8b71880a12ef7af7ec0a5db4150
```

```
sonar.projectKey=my-project
sonar.login=8e7d4a5e9229a8b71880a12ef7af7ec0a5db4150
```


#
## Rodar o testes unitários e cobertura de código
#

* Dentro da pasta do projeto onde está localizado o pom.xml rodar o comando abaixo.

```
mvn clean verify sonar:sonar
```