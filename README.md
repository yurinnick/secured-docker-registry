## Setup secured Docker Registry 2.0 with ease

Generate self-singed OpenSSL certificates in `certs` directory:

```shell
$ generate_certs.sh certs
```

Register Docker Registry host (example: localhost) with generated certificates on machine with docker client which will push images:

```shell
$ register_host.sh certs localhost
```

Build and run custom Docker Registry image:

```shell
$ docker build -t secured-registry .
$ docker run -p 5000:5000 -v $(pwd)/certs:/certs secured-registry
```

Now you have running instance of private Docker Registry secured with TLS encryption and local docker client setup for working with it. Try it out!

```shell
$ docker build -t localhost:5000/secured-registry 
$ docker push localhost:5000/secured-registry

The push refers to a repository [localhost:5000/secured-registry] (len: 1)
5cbf72491548: Image already exists
3b34ad1544ad: Image successfully pushed
...
61b3964dfa70: Image successfully pushed
```
