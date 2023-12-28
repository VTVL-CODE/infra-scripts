# Infra-Scripts

A repository of infrastructure automation scripts.

## Local Work-Station Set Up

To configure local work-station:

`bash local-setup.sh`

## Deploying Webpage through VM (Virtual Machine)

1) Create VM: `multipass launch --name <name>`

2) Enter VM: `multipass shell <name>` 

recommended) OODA: `whoami; pwd; hostname; ls; ip a` 

3) Go to Github.com > VTVL-CODE/infra-scripts > Code > HTTPS > Grab <URL>

2) `git clone <URL>`

3) `cd infra-scripts`

4) `bash web-deploy.sh`

5) Get IP `ip a` 

7) `curl http://<ip>:80` or go to Web Browser and insert http://<ip>:80
