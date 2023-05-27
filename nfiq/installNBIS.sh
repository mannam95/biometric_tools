#RUN='docker exec -it stimmer_pix2pix_test1_0 '
#RUN=''

apt update -y	#RUN
apt install -y wget unzip nano cmake libx11-dev vim less git imagemagick imagemagick-doc apt-utils man #RUN
apt install -y libssl-dev libdb-dev libdb++-dev libopenjp2-tools libopenjp2-7-dev libhwloc-dev libsqlite3-dev libtiff5-dev #RUN
mkdir /usr/local/man/man1	#RUN
#WORKDIR /root
mkdir ./NBIS/
cd ./NBIS/
wget https://nigos.nist.gov/nist/nbis/nbis_v5_0_0.zip
unzip nbis_v5_0_0.zip
#WORKDIR /root/Rel_5.0.0
cd ./Rel_5.0.0
chmod +x setup.sh
mkdir /opt/nbis-5.0.0	#RUN
./setup.sh /opt/nbis-5.0.0/	#RUN
#ENTRYPOINT ["/root/setup.sh"]

make config	#RUN
make it	#RUN
make install LIBNBIS=yes	#RUN

#/etc/bash.bashrc: PATH=$PATH:/opt/nbis-5.0.0/bin
#alias nbisBin='ls /opt/nbis-5.0.0/bin --ignore='"*.*"''         # listet alle nbis-Befehle auf
#alias nbisCommand='less /opt/nbis-5.0.0/bin/nbisCommands.txt | grep ' # beschreibt die Funktionsweise des angegebenen Befehls
#alias nbisCommands='less /opt/nbis-5.0.0/bin/nbisCommands.txt'        # beschreibt die Funktionsweise aller nbis-Commands

cd ../../

cp nbisCommands.txt /opt/nbis-5.0.0/bin/nbisCommands.txt

echo "#!/bin/bash" > /opt/nbis-5.0.0/nbis-env.sh
echo "NBIS_HOME=\"/opt/nbis-5.0.0\"" >> /opt/nbis-5.0.0/nbis-env.sh
echo "export PATH=\$PATH:\$NBIS_HOME/bin/" >> /opt/nbis-5.0.0/nbis-env.sh
echo "export MANPATH=\$NBIS_HOME/man/" >> /opt/nbis-5.0.0/nbis-env.sh

echo "source /opt/nbis-5.0.0/nbis-env.sh       # include the nbis files lokated in the bin directory automaticaly to the global bashrc file" >> /etc/bash.bashrc
echo "alias nbisBin='ls /opt/nbis-5.0.0/bin --ignore='\"'\"'*.*'\"'\"''         # it will create a list of all nbis commands" >> /etc/bash.bashrc
echo "alias nbisCommand='less /opt/nbis-5.0.0/bin/nbisCommands.txt | grep ' # discription of the functionality of the given nbis command" >> /etc/bash.bashrc
echo "alias nbisCommands='less /opt/nbis-5.0.0/bin/nbisCommands.txt'        # discription of the functionality of all nbis Commands" >> /etc/bash.bashrc
