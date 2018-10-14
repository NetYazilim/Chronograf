# Chronograf

`
docker run -d -p 8086:8086 -p 8088:8088 netyazilim/influxdb:1.6

docker run -d -p 8888:8888 -e INFLUXDB_URL=http://192.168.1.115:8086 netyazilim/chronograf:1.6
`
