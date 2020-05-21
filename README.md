Why
=
Our new SSO provider will only return back to URI under SSL/TLS (https -- a good thing). I need a local development environment that runs a self signed certificate that can be dropped into a laravel project, configured, run, and then discarded. 

Benefits
=
*keys/git* - Since, this also read-only maps `~/.ssh` to `/root/.ssh` keys are availible for git operations.

*passthru* is mapped and contains a minimal bashrc and httpd.conf that can be configured per project. 

Assumptions
=
Development only. Do not use in production
This was first designed for laravel

Drawbacks/To Do
=
- There is no database server
- Still need to add composer
- Local .ssh folder is mapped for easy git operation. You can disable this by in volumes.

To use
= 
1. Clone into root level of your project
2. Edit `httpd.conf` as needed `bashrc` in `/passthru/`
3. Edit `docker-compose.yml` so that your project root matches what the container expects. 
```yaml
  volumes:
      - <proj-root>:/var/www/localhost/htdocs
 ```
4. Spin up
 ```bash
chmod +x dcup.sh
./dcup.sh
 ```


