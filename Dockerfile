FROM drupal:11-apache

RUN apt-get update && \
    apt-get install -y git unzip && \
    rm -rf /var/lib/apt/lists/*