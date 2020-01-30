=========== Installed Plugins =========
Ansible plugin 	
Ansible Tower Plugin
AnsiColor
Crowd 2 Integration
Schedule Build Plugin
Maintenance Jobs Scheduler Plugin
Parameterized Scheduler
Run Condition Extras Plugin
azure-app-service
envinject


===========API Token ========
https://lxapatchprd01:8443/job/DTQ/job/Postcheck/buildWithParameters?token=postcheck&hostname=lxapatchprd03

===========ALL Details==========
https://lxapatchprd01:8443/api/xml
https://lxapatchprd01:8443/job/HadoopPackageInstall/api/xml

Filters : -

https://lxapatchprd01:8443/job/DTQ/job/Postcheck/api/xml?tree=nextBuildNumber

https://lxapatchprd01:8443/job/HadoopPackageInstall/api/xml?tree=builds[id,number]
https://lxvcorpeng1:8443/job/HadoopPackageInstall/api/json?tree=builds[id,queueId,url]

curl -s -k "https://lxapatchprd01:8443/job/DTQ/job/Postcheck/697/api/xml?tree=result"
curl -s -k "https://lxapatchprd01:8443/job/DTQ/job/Postcheck/api/xml?tree=nextBuildNumber"
curl -s -k "https://lxapatchprd01:8443/job/DTQ/job/Postcheck/697/api/xml?tree=result"|xmllint --format -|grep -i result|cut -d">" -f2|cut -d"<" -f1
curl -s -k "https://lxapatchprd01:8443/job/DTQ/job/Postcheck/api/xml?tree=nextBuildNumber"|xmllint --format -|grep -i nextBuildNumber |cut -d">" -f2|cut -d"<" -f1
sed -n -e '/----STARTED----/,/----END----/ p'

======= queue============
https://lxapatchprd01:8443/queue/api/xml
https://lxapatchprd01:8443/queue/api/json
https://lxapatchprd01:8443/queue/api/json?pretty=true

https://lxapatchprd01:8443/queue/cancelItem?id=125

curl --request POST httpss://lxappdpudtq001.lowes.com:8443/queue/cancelItem?id=$QueueID

=================delay===============
https://lxapatchprd01:8443/job/HadoopPackageInstall/buildWithParameters?token=HadoopPkgInstall&delay=100000sec&hostname=lxhdpmasttst003&yumaction=pkginfo&pkg=ambari-server

$scheduleddate = "2019-03-05 11:30";
$output = shell_exec('
presentDate=$(date +%s);
futureDate=$(date +%s -d "'.$scheduleddate.'");
variance=$(( $futureDate - $presentDate ));
diff=$(($variance))sec;
if [[ "$variance" -lt "0" ]] ; then
echo "Expired";
else
echo "Scheduled";
curl "https://lxapatchprd01:8443/job/HadoopPackageInstall/buildWithParameters?token=HadoopPkgInstall&delay=$diff&hostname=lxhdpmasttst003&yumaction=pkginfo&pkg=ambari-server";
fi
')


==============API lastBuild ===========
https://lxapatchprd01:8443/job/DTQ/job/Postcheck/lastBuild/buildNumber
https://lxapatchprd01:8443/DTQ/job/Postcheck/lastBuild/api/json
https://lxapatchprd01:8443/DTQ/job/Postcheck/lastBuild/api/xml

/lastStableBuild/
/lastSuccessfulBuild/
/lastFailedBuild/

/lastBuild/consoleText



=== Jenkins-Crumb ==========
https://lxapatchprd01:8443/crumbIssuer/api/xml?

5413474503baf37cfb130927637a776c
c7e0be8c74511b49786a6f843cbfef5b
db6d0f738de1391907e3bd683a188d4f - nono
819294c5ce37ade4b2c70c25063cd708 - chbs
11f433116f79ed33b1dd0ac9400d8e8edc - trigger(eng3)

curl -X POST -u "trigger:Password@123" -H Jenkins-Crumb:5413474503baf37cfb130927637a776c "https://lxapatchprd01:8443/job/HadoopPackageInstall/buildWithParameters?token=HadoopPkgInstall&delay=100000sec&hostname=lxhdpmasttst003&yumaction=pkginfo&pkg=ambari-server" 
curl -k -H"Authorization: Basic $(echo -n admin:admin@1234|base64)" "http://lxnwkremcqas02:8080/job/Demo/buildWithParameters?token=avamar&hostname=lxapatchprd01.lowes.com&uuid=ssssss"
echo -n admin:admin@1234|base64
curl -k -H"Authorization: Basic YWRtaW46YWRtaW5AMTIzNA==" "http://lxnwkremcqas02:8080/job/Demo/buildWithParameters?token=avamar&hostname=lxapatchprd01.lowes.com&uuid=ssssss"
trigger:
curl -k -H"Authorization: Basic dHJpZ2dlcjpQYXNzd29yZEAxMjM=" "https://lxapatchprd01:8443/job/DTQ/job/aix_patching/buildWithParameters?token=patch&hostname=lxvcorpeng2"

API - Token:
1187f0624c7f63535117f0058ee72f98e7 - chbs
11b6b76f7e433931692f3cf11f409fa6a1 - trigger
curl -X POST "https://username:api-token@JENKINS_URL/job/Example/build"

echo -n "trigger:11b6b76f7e433931692f3cf11f409fa6a1"|base64

curl -H"Authorization: Basic dHJpZ2dlcjoxMWY0MzMxMTZmNzllZDMzYjFkZDBhYzk0MDBkOGU4ZWRj" https://lxvcorpeng3.lowes.com:8443/job/Linux/job/aixtest/build?token=test
curl -k -H"Authorization: Basic dHJpZ2dlcjoxMWI2Yjc2ZjdlNDMzOTMxNjkyZjNjZjExZjQwOWZhNmEx" "https://lxapatchprd01:8443/job/LINUX/job/DCOM/buildWithParameters?token=5dcc08fa8b225&svrlist=host1&crqnumber=crq12345"

curl -k -X POST https://lxapatchprd01:8443/job/LINUX/job/DCOM/buildWithParameters  \
 -H "Authorization: Basic dHJpZ2dlcjoxMWI2Yjc2ZjdlNDMzOTMxNjkyZjNjZjExZjQwOWZhNmEx"   \
 --data token="5dcc08fa8b225" \  
 --data-urlencode svrlist="host1 host2 host3"  \
 --data-urlencode crqnumber="crq12345" 
 
curl -v -k -X POST https://lxapatchprd01:8443/job/LINUX/job/DCOM/buildWithParameters   -H "Jenkins-Crumb:52fa8fac1da6c0254c95b0119d5a81417b998a898d17a3f491c831a043d2c2b0"   -H"Authorization: Basic dHJpZ2dlcjoxMWI2Yjc2ZjdlNDMzOTMxNjkyZjNjZjExZjQwOWZhNmEx"   --data token="5dcc08fa8b225" --data-urlencode svrlist="123" --data-urlencode crqnumber="crq12345 dsf wa &dsa "

curl -k -X POST https://lxvcorpeng3:8443/job/LINUX/job/DCOM/build \
  --user trigger:11f433116f79ed33b1dd0ac9400d8e8edc \
  --data token=701a2a63ddd3 \
  --data-urlencode json='{"parameter": [{"name":"svrlist","value":"host1 host2 host3"}, {"name":"crqnumber", "value":"crq12345"}]}'

curl -k -X POST https://lxvcorpeng3:8443/job/LINUX/job/DCOM/build   --user trigger:11f433116f79ed33b1dd0ac9400d8e8edc   --data token=701a2a63ddd3   --data-urlencode json='{"parameter": [{"name":"Cust_CHG_Type01","value":"val1"},  {"name":"Cust_CHG_Type02", "value":"val2"}, {"name":"Cust_CHG_Type03", "value":"val3"}, {"name":"Cust_CHG_Type04", "value":"val4"}, {"name":"Cust_CHG_Type05", "value":"val5"}, {"name":"Infrastructure_Change_ID", "value":"val6"}]}'  
  
====================Update jenkins ===========
java -jar jenkins.war --> new install

---- upgrade existing -----
sudo systemctl stop jenkins
sudo mv /usr/lib/jenkins/jenkins.war /usr/lib/jenkins/jenkins.war.old
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war
sudo systemctl start jenkins

================== SSL https =======================
yum install mod_ssl openssl
Generate private key
#sudo openssl genrsa -out ca.key 2048
Generate CSR
#sudo openssl req -new -key ca.key -out ca.csr
Generate Self Signed Key
#sudo openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
openssl x509 -in ca.csr -out ca.cert -req -signkey ca.key -days 365

Now we need to copy the newly generated files to the correct locations with the following commands:
sudo cp ca.crt /etc/pki/tls/certs
sudo cp ca.key /etc/pki/tls/private/ca.key
sudo cp ca.csr /etc/pki/tls/private/ca.csr
vi /etc/httpd/conf.d/ssl.conf
 
SSLCertificateFile /etc/pki/tls/certs/localhost.crt
changes to:
SSLCertificateFile /etc/pki/tls/certs/ca.crt

SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
changes to:
SSLCertificateKeyFile /etc/pki/tls/private/ca.key


sudo apachectl configtest
sudo systemctl restart httpd

openssl x509 -inform PEM -in certificate.cer -out certificate.crt --> convert cer to csr


openssl pkcs12 -export -out jenkins_keystore.p12 \
  -passout 'pass:password' -inkey ca.key \
  -in ServerCertificate.crt -certfile ChainBundle2.crt -name lxapatchprd01.lowes.com
  
keytool -importkeystore -srckeystore jenkins_keystore.p12 \
  -srcstorepass 'password' -srcstoretype PKCS12 \
  -srcalias lxapatchprd01.lowes.com -deststoretype JKS \
  -destkeystore jenkins_keystore.jks -deststorepass 'password' \
  -destalias lxapatchprd01.lowes.com

#configure permissions to secure your keystore
chown -R jenkins:jenkins /jenkins/jenkinshome/keystore/
chmod 700 /jenkins/jenkinshome/keystore/
chmod 600 /jenkins/jenkinshome/keystore/jenkins_keystore.jks  
  
https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-apache-for-centos-7
https://www.techrepublic.com/article/how-to-enable-httpss-on-apache-centos/

https://gist.github.com/goyalmohit/1ed10093c3f40835bf2dcf38972a0449
https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777
https://sam.gleske.net/blog/engineering/2016/05/04/jenkins-with-ssl.html
https://mohitgoyal.co/2017/02/08/securing-your-jenkins-environment-and-configure-for-auditing/

================== LDAP ============================
	
Crowd 2 Integration -> plugins

https://tools.lowes.com/crowd 
jenkinsitengineering 
Password@123

qaisd.lowes.com:389 -< SA
prdisd.lowes.com:636 -< WS

cn=b2b-dpadmin,ou=applications,o=isd  


LDAP server URI : ldap://ad.lowes.com:389
BIND DN : CN=lxesxapi,OU=Services,OU=Administration,DC=lowes,DC=com
BIN password : $encrypted$
LDAP group type: ActiveDirectoryGroupType
LDAP require Group : CN=TOWER__USERS_WEBENG,OU=CommSVCS,OU=Groups,OU=Corporate,DC=lowes,DC=com

ldapsearch -LLL -h ad.lowes.com -p 389 -D "CN=bs1\, chethan - chethan,OU=1499,OU=Remote Sites,DC=lowes,DC=com" -W -b "DC=lowes,DC=com" -s sub "(SamAccountName=chbs)" dn memberof
ldapsearch -LLL -h ad.lowes.com -p 389 -D "CN=lxesxapi,OU=Services,OU=Administration,DC=lowes,DC=com" -W -b "DC=lowes,DC=com" -s sub "(SamAccountName=chbs)" dn memberof
lxesxapi $encrypted$

User name : SSCBITNOW
Password:    04gA#siNE2Qr$SK


==================================================
env config plugin for mails

perl -MLWP::Simple -e 'getprint "https://lxapatchprd01:8443/queue/api/json"' |grep -Po '"id":.*?[^\\]",'|grep -i lxhdpmasttst003|cut -d ":" -f2|cut -d "," -f1


===================jenkins setup/install============
https://www.linuxtechi.com/install-configure-jenkins-on-centos-7-rhel-7/



=================== jenkins slave AIX =============
https://www.ibm.com/support/knowledgecenter/en/SS6T76_1.0.2/jenkinsintegration.html

===================
--- Pending ---
https
LDAP

bitbucket repo permissions

[dpadmin@lxappdpudtq005 SecureBackupFiles]$ ls -ltr
total 20920
-rw-r--r-- 1 dpadmin dpsu 18293059 Mar 13 12:00 SecureBackup_esbltc1a.lowes.com.xml
-rw-r--r-- 1 dpadmin dpsu        0 Mar 13 12:11 test.xml
-rw-r--r-- 1 dpadmin dpsu  3124451 Mar 14 07:50 SecureBackup_esbdev2a.lowes.com.xml
[dpadmin@lxappdpudtq005 SecureBackupFiles]$ xmllint --format SecureBackup_esbltc1a.lowes.com.xml
SecureBackup_esbltc1a.lowes.com.xml:2: parser error : xmlSAX2Characters: huge text node
HMVtgYu610Zh+/170aMFe55K6Nse3+xYQIergKujEjEEZls8gNemMtudpHurZLGYQ+vadVn19D3q1RSt
                                                                               ^
SecureBackup_esbltc1a.lowes.com.xml:2: parser error : Extra content at the end of the document
HMVtgYu610Zh+/170aMFe55K6Nse3+xYQIergKujEjEEZls8gNemMtudpHurZLGYQ+vadVn19D3q1RSt
                                                                               ^
[dpadmin@lxappdpudtq005 SecureBackupFiles]$ pwd
/datapowerlogs/ReplacementXI52toIDG/SecureBackupFiles 

curl -X GET "https://savamar3/api/v1/clients?domain=%2FNDMP&recursive=false" -H "accept: application/json" -H "authorization: Bearer  <keys>"
