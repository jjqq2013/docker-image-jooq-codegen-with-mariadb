FROM mariadb:10.3.8
RUN apt-get -y update && apt-get -y install openjdk-8-jdk-headless wget && \
  mkdir -p /jooq && cd /jooq && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq-codegen/3.11.2/jooq-codegen-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq/3.11.2/jooq-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/jooq/jooq-meta/3.11.2/jooq-meta-3.11.2.jar && \
  wget https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.2.6/mariadb-java-client-2.2.6.jar
WORKDIR /jooq

RUN set -x && \
  apt-get -y update && \
  # Optional: install some daily utilities. It is very inconvenient if no any editor pre-installed.
  apt-get -y install vim less && \
  # install a source beautifier to beautify both jooq-generated and original source then compare them with same standard.
  # (I can download IntelliJ IDEA and call its code formatter, but that's too big.)
  # Purposely changed jar file's extension name to .jar_ because when run jooq I specified *.jar as its classpath.
  # Do not use version 1.8 because it require java 11.
  wget -O formatter.jar_ https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar

# set LANG=*.UTF-8 so that default file encoding will be UTF-8 and you can input non-ASCII chars in bash etc.
ENV LANG=C.UTF-8
