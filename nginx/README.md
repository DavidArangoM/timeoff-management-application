
# Timeoff-app - Nginx

This project is using a Nginx reverse proxy container when it is deployed.


## Documentation
Nginx reverse proxy is a server that sits in front of the node app and forwards clients from http:80 to http:3000.

AWS Fargate uses by default "*awsvpc*" network mode which allows communication between containers without linking them, 
that's why you see in the **default.conf** file (below) the proxy_pass pointing to localhost and not to a specific container or IP.

```bash
  ...
  proxy_pass http://localhost:3000;
  ...
```

This server is getting the request sent by the load balancer and redirect these requests to app-container