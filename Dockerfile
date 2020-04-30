FROM mariadb:10.3.8
RUN apt-get -y update && apt-get -y install openjdk-8-jdk-headless wget && \
  mkdir -p /jooq && cd /jooq && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq-codegen/3.11.2/jooq-codegen-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq/3.11.2/jooq-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq-meta/3.11.2/jooq-meta-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.2.6/mariadb-java-client-2.2.6.jar
WORKDIR /jooq
