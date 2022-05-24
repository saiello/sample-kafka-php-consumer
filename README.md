# Kafka PHP Consumer

A simple example of a PHP script consuming from a kafka topic


- Strimzi 0.27.0
- Kafka 3.0.0
- Php 7.4
- RdKafka 6.0.1


## Usage

### Start all

```
docker-compose up
```

After a while you should see the success message from the php script

```
consumer_1   | Assign: array(1) {
consumer_1   |   [0]=>
consumer_1   |   object(RdKafka\TopicPartition)#6 (4) {
consumer_1   |     ["topic"]=>
consumer_1   |     string(10) "test-topic"
consumer_1   |     ["partition"]=>
consumer_1   |     int(0)
consumer_1   |     ["offset"]=>
consumer_1   |     int(-1001)
consumer_1   |     ["err"]=>
consumer_1   |     int(0)
consumer_1   |   }
consumer_1   | }
```


### Produce some messages

```
docker run --rm -it --network kafka-php-consumer_default quay.io/strimzi/kafka:0.27.0-kafka-3.0.0 /opt/kafka/bin/kafka-console-producer.sh --bootstrap-server kafka:9092 --topic test-topic
```

Each time the consumer receive a message it will print to the stdout

```
consumer_1   | object(RdKafka\Message)#7 (10) {
consumer_1   |   ["err"]=>
consumer_1   |   int(0)
consumer_1   |   ["topic_name"]=>
consumer_1   |   string(10) "test-topic"
consumer_1   |   ["timestamp"]=>
consumer_1   |   int(1653378521177)
consumer_1   |   ["partition"]=>
consumer_1   |   int(0)
consumer_1   |   ["payload"]=>
consumer_1   |   string(4) "foobar"
consumer_1   |   ["len"]=>
consumer_1   |   int(4)
consumer_1   |   ["key"]=>
consumer_1   |   NULL
consumer_1   |   ["offset"]=>
consumer_1   |   int(3)
consumer_1   |   ["headers"]=>
consumer_1   |   array(0) {
consumer_1   |   }
consumer_1   |   ["opaque"]=>
consumer_1   |   NULL
consumer_1   | }
```

## Links

- https://github.com/edenhill/librdkafka
- https://github.com/edenhill/librdkafka/blob/master/CONFIGURATION.md
- https://github.com/arnaud-lb/php-rdkafka
- https://arnaud.le-blanc.net/php-rdkafka-doc/phpdoc/rdkafka.examples-high-level-consumer.html
