

# https://www.cyberciti.biz/faq/how-to-upgrade-from-ubuntu-22-04-lts-to-ubuntu-24-04-lts/

sudo apt install ubuntu-release-upgrader-core
grep 'lts' /etc/update-manager/release-upgrades
sudo do-release-upgrade -d