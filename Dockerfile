# Usar uma imagem base com JDK 11 e Maven 3.6.3
FROM maven:3.6.3-jdk-11

# Ajustar memória do Java
ENV JAVA_OPTS="-Xms512m -Xmx1g -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:9010"

# Definir o diretório de trabalho
WORKDIR /workspace

ENV PATH_PROPERTIES=/etc/confEmpresa

# Criar um usuário e grupo 'vscode'
#RUN useradd -ms /bin/bash vscode

# Copie o arquivo launch.json para o contêiner
COPY /.devcontainer/launch.json /workspace/.vscode/launch.json

# Copiar o projeto para o diretório de trabalho
COPY . /workspace

# Copie o arquivo settings.xml para o contêiner
COPY settings.xml /usr/share/maven/conf/settings.xml

# Expor a porta para o Spring Boot
EXPOSE 8080
EXPOSE 9010