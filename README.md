# coder-on-fly

https://coder.com/blog/remote-developer-environments-on-fly-io

## How to setup

### Create a database (Neon)

Create a database on [Neon Console](https://console.neon.tech/app/projects?modal=create_project).

#### Regions

| Neon Region | Fly.io Region | Comment |
|---|---|---|
| Ohio (aws-us-east-2) | Virginia (iad) | Recommended. Lowest Fly.io costs |
| Oregon (aws-us-west-2) | Seattle (sea) | |
| Singapore (aws-ap-southeast-1) | Singapore (sin) | |

### Set connection_url

```bash
fly secrets set "CODER_PG_CONNECTION_URL=<connection-string>" --app <coder-app-name>
```

- Disable connection pooling
- Remove `channel_binding` from connection string

### Set azure subscription id

```bash
fly secrets set "ARM_SUBSCRIPTION_ID=<subscription-id>" --app <coder-app-name>
```

### Deploy

```bash
fly deploy --app <coder-app-name> --ha=false
```
