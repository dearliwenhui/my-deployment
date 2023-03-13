#!/bin/sh

curl -L -C - "https://d.pcs.baidu.com/file/bf8de983flc6f39873993dba72f895fb?fid=1773990534-250528-997823642273058&dstime=1678715038&rt=sh&sign=FDtAERVJouK-DCb740ccc5511e5e8fedcff06b081203-RgI%2ByLoJVNaeGA7y5p0ZgpM9Fxc%3D&expires=8h&chkv=1&chkbd=0&chkpc=&dp-logid=514770862150877816&dp-callid=0&shareid=41379699986&r=961186405&resvsflag=1-12-0-1-1-1&vuk=1773990534&file_type=0" -o "seata-server-1.5.1.tar.gz" -A "pan.baidu.com" -b "BDUSS=0Q1SnFlRVVEdU9nTlNYaHNKQlNqZVZ3ZEU2ZWI5SDN1SE5NOTVQNVRyc3VXOHRqRVFBQUFBJCQAAAAAAAAAAAEAAAC8aVm4X3Nub3c5NQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7Oo2MuzqNjS"

tar -xzf seata-server-1.5.1.tar.gz

curl -o seata/conf/application.yml https://phenomenal-parfait-fd829c.netlify.app/seata/1.5.1/conf/application.yml
curl -o seata/bin/seata-server.sh https://phenomenal-parfait-fd829c.netlify.app/seata/1.5.1/seata-server.sh

./seata/bin/seata-server.sh -m db
