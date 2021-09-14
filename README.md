# MINI-TOR

BUILD

```bash
docker build -t sokardys/minimal-tor . 
```

EXECUTE

```bash
docker run -d --name tor -p 127.0.0.1:9150:9150 sokardys/minimal-tor
```