Local PHP dev environment with self signed certificate
=

Why?
-
Campus SSO will only return  to a https callback. This allows to use a self signed certificate and develop locally. 

To Do
-
Customize for Laravel development (`/var/www/html/public` as root)

Current to install:
- 
First, make your self-signed-cert by the following. Fill in any inputs as needed. 

```
cd cert
sh cert-setup.sh
```

Next start up the container
```
docker-compose up -build --force-recreate
```

Fire up browser with https://your-ip or url.