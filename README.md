# first-steps-ubuntu

to install, run:

```bash
reset; [ ! `command -v curl` ] && sudo apt-get update && sudo apt-get install --yes curl ; \
curl -L -o ~/Downloads/first-steps-ubuntu.zip https://github.com/bernardolm/first-steps-ubuntu/archive/master.zip ; \
([ -d ~/Downloads/first-steps-ubuntu ] && rm -rf ~/Downloads/first-steps-ubuntu) ; \
unzip -oq ~/Downloads/first-steps-ubuntu.zip -d ~/Downloads/first-steps-ubuntu ; \
~/Downloads/first-steps-ubuntu/first-steps-ubuntu-master/first-steps-ubuntu.sh
```
