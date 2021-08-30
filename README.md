# MINI-TOR

BUILD

```bash
docker build -t sokardys/minimal-tor . 
```

EXECUTE

```bash
docker run -d --name tor -p 127.0.0.1:9200:9200 sokardys/minimal-tor
```
