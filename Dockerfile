FROM php:7.4-cli


# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]


RUN apt-get update && apt-get install -y librdkafka-dev \
	&& pecl install rdkafka-6.0.1 \
	&& docker-php-ext-enable rdkafka


COPY . /usr/src/myapp
WORKDIR /usr/src/myapp


CMD [ "php", "./script.php" ]
