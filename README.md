# coder-on-fly

https://coder.com/blog/remote-developer-environments-on-fly-io

## How to setup

### Create a database (Neon)

Create a database on [Neon Console](https://console.neon.tech/app/projects?modal=create_project).

※ Ohio is recommended. (Use IAD at fly.io)

### Set connection_url

```bash
flyctl secrets set CODER_PG_CONNECTION_URL=<connection-string> --app <coder-app-name>
```

- Disable connection pooling
- Remove `channel_binding` from connection string

### Deploy

```bash
flyctl deploy --app <coder-app-name> --ha=false
```
