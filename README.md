Why
=
New SSO provider will only return back to URI under SSL/TLS (https). I need a local development environment that runs a self signed certificate that can be dropped into a laravel project, configured, and run. 

Benefits
=
*keys/git* - Since, this also read-only maps `~/.ssh` to `/root/.ssh` keys are availible for git operations.

*passthru* is mapped and contains a minimal bashrc that can be configured per project. 

Assumptions
=
Development only. Do not use in production
This was first designed for laravel

To use
= 
1. Clone into root level of your project
2. Edit as needed `bashrc` in `/passthru/`
3. Edit `docker-compose.yml` so that your project root matches what the container expects. There is an an index.php file for demo. 
```yaml
  volumes:
      - <proj-root>:/var/www/localhost/htdocs
 ```
4. Spin up
 ```bash
 docker-compose up --build -d --force-recreate -remove-orphans
 ```
