sudo yum install wget unzip -y
wget https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
tar -xf node-v16.15.1-linux-x64.tar.xz
cd node-v16.15.1-linux-x64/bin
sudo ln -s /home/centos/node-v16.15.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /home/centos/node-v16.15.1-linux-x64/bin/npm /usr/bin/npm
npm install pm2 -g
sudo ln -s /home/centos/node-v16.15.1-linux-x64/bin/pm2 /usr/bin/pm2

wget https://github.com/rustdesk/rustdesk-server/releases/download/1.1.5/rustdesk-server-linux-x64.zip
unzip -d ~/rustdesk rustdesk-server-linux-x64.zip
cd rustdesk
pm2 start hbbs
pm2 start hbbr


have web in progress relese
http://web.rustdesk.com/

cat public key and external ip
rustdesk-host=51.250.95.77,key=VAwzU96EoCLUSEbB+nrhiU5XbElLNPWeLnCdge2hT6g=.exe

