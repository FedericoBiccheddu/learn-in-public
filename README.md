# learn-in-public

## Local docker development with HTTPS

#### Setup
You can use `make setup` to create a default `.env` file and default certificates for `example.com` and `*.example.com`.

> **Note**
> If you receive "mkcert not installed", follow the link and install in your local machine. The tool is needed in order to create valid local certificates.

Add the following in your hosts file:
```hosts
127.0.0.1	example.localhost api.example.localhost
```

#### Usage
With the command `docker compose up`, Docker will create two services accessible respectively to [`example.com`](https://example.com) and [`api.example.com`](https://api.example.com).