# Checking versions of hadoop and pig
pig -version
hadoop version
# We use elinks to look at the job tracker and screen to collaboratively debug stuff
sudo apt-get install elinks
sudo apt-get install screen
# some dependencies require maven3. will install
sudo mkdir -p /opt/tools
sudo chown hadoop /opt/tools
cd /opt/tools
wget ftp://mirror.csclub.uwaterloo.ca/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz
tar -xzvf apache-maven-3.0.4-bin.tar.gz
export MAVEN_HOME=/opt/tools/apache-maven-3.0.4
export M2_HOME=/opt/tools/apache-maven-3.0.4
export M2=/opt/tools/apache-maven-3.0.4/bin
export PATH=/opt/tools/apache-maven-3.0.4/bin:$PATH
mvn --version
echo -e "export MAVEN_HOME=/opt/tools/apache-maven-3.0.4 \n export M2_HOME=/opt/tools/apache-maven-3.0.4 \n export M2=/opt/tools/apache-maven-3.0.4/bin \n export PATH=/opt/tools/apache-maven-3.0.4/bin:$PATH" >> ~/.bashrc
