#!/bin/sh

# change yum repo to 163
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

yum clean all

yum makecache

yum install vim -y

# install java 11
yum install -y java-11-openjdk

# confige ENV
cat > /etc/profile.d/java11.sh <<EOF
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.18.0.10-1.el7_9.x86_64
export PATH=\$PATH:\$JAVA_HOME/bin
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF

#refresh configuration
source /etc/profile.d/java11.sh


curl -L -C - "https://d.pcs.baidu.com/file/bf8de983flc6f39873993dba72f895fb?fid=1773990534-250528-997823642273058&dstime=1678714663&rt=sh&sign=FDtAERVJouK-DCb740ccc5511e5e8fedcff06b081203-htmWO7DC%2FR%2BFB0ytBCPeDOB65hw%3D&expires=8h&chkv=1&chkbd=0&chkpc=&dp-logid=514670375172616320&dp-callid=0&shareid=30508985114&r=415163640&resvsflag=1-12-0-1-1-1&vuk=1773990534&file_type=0" -o "seata-server-1.5.1.tar.gz" -A "pan.baidu.com" -b "BDUSS=0Q1SnFlRVVEdU9nTlNYaHNKQlNqZVZ3ZEU2ZWI5SDN1SE5NOTVQNVRyc3VXOHRqRVFBQUFBJCQAAAAAAAAAAAEAAAC8aVm4X3Nub3c5NQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7Oo2MuzqNjS"

tar -xzf nacos-server-2.1.1.tar.gz

curl -o nacos/conf/application.properties https://640f34d762838303e1881836--phenomenal-parfait-fd829c.netlify.app/nacos/2.1.1/conf/application.properties

./nacos/bin/startup.sh -m standalone
