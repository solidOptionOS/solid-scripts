#!/bin/bash
clear
#Colors

dgrey="\033[0;34m"
port="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[2;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

echo -e $BLUE"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"Setup Client and Server Certificate"$ENDCOLOR;
## Make changes to suit your needs 

echo -e $BLUE"Initializing Certifcation Authority Environment... "$ENDCOLOR;
cd && mkdir -pv ~/myCA/ 
echo -e $BLUE"Initializing Certificate Database: "$ENDCOLOR;
echo '01' > serial  && touch index.txt
echo -e $BLUE"Initializing CA Configuration"$ENDCOLOR;

echo "[ ca ]
default_ca      = local_ca
[ local_ca ]
dir             = ~/myCA
certificate     = ~/myCA/cacert.pem
database        = ~/myCA/index.txt
new_certs_dir   = ~/myCA/signedcerts
private_key     = ~/myCA/private/cakey.pem
serial          = ~/myCA/serial
default_crl_days        = 365
default_days            = 1825
default_md              = sha1
policy          = local_ca_policy
x509_extensions = local_ca_extensions
copy_extensions = copy
[ local_ca_policy ]
commonName              = supplied
stateOrProvinceName     = supplied
countryName             = supplied
emailAddress            = supplied
organizationName        = supplied
organizationalUnitName  = supplied
[ local_ca_extensions ]
basicConstraints        = CA:false
[ req ]
default_bits    = 2048
default_keyfile = ~/myCA/private/cakey.pem
default_md      = sha1
prompt                  = no
distinguished_name      = root_ca_distinguished_name
x509_extensions         = root_ca_extensions
[ root_ca_distinguished_name ]
commonName              = MyOwn Root Certificate Authority
stateOrProvinceName     = NC
countryName             = US
emailAddress            = root@mydnsdomain.com
organizationName        = My DNS Domain
organizationalUnitName  = IT Department
[ root_ca_extensions ]
basicConstraints        = CA:true" >> ~/myCA/caconfig.cnf

export OPENSSL_CONF=~/myCA/caconfig.cnf 
echo -e $BLUE"Generating CA Certificate and Key... "$ENDCOLOR;
openssl req -x509 -newkey rsa:2048 -out cacert.pem -outform PEM -days 1825
 
echo  -e $BLUE"Strip the Certificate of Text -CERTIFCATE- Generating .crt"$ENDCOLOR;
openssl x509 -in cacert.pem -out cacert.crt

echo  -e $BLUE"Generating a Self-Signed Certificate: "$ENDCOLOR;

echo " 
[ req ]
prompt                  = no
distinguished_name      = server_distinguished_name
req_extensions          = v3_req
[ server_distinguished_name ]
commonName              = mydnsdomain.com
stateOrProvinceName     = NC
countryName             = US
emailAddress            = root@mydnsdomain.com
organizationName        = My Organization Name
organizationalUnitName  = Subunit of My Large Organization
[ v3_req ]
basicConstraints        = CA:FALSE
keyUsage                = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName          = @alt_names
[ alt_names ]
DNS.0                   = mydnsdomain.com
DNS.1                   = alt.mydnsdomain.com" >> myCA/signed.cnf

export OPENSSL_CONF=~/myCA/signed.cnf 
echo -e $BLUE"Generating the Server Certificate and Key... "$ENDCOLOR;
openssl req -newkey rsa:1024 -keyout tempkey.pem -keyform PEM -out tempreq.pem -outform PEM

echo -e $BLUE"Translate Temporary Key to Unencrypted Key..."$ENDCOLOR;
openssl rsa < tempkey.pem > server_key.pem

echo -e $BLUE"Signing Server Certificate with the CA key..."$ENDCOLOR;
openssl ca -in tempreq.pem -out server_crt.pem

echo -e $BLUE "Cleaning up. Removing All Temporary Certificates and Keys... "$ENDCOLOR;
rm -f tempkey.pem && rm -f tempreq.pem

echo -e $BLUE "Prepending Unencrypted Private Key to the Server Certificate... "$ENDCOLOR;

cat server_key.pem server_crt.pem > hold.pem
mv hold.pem server_crt.pem
chmod 400 server_crt.pem

echo -e $BLUE "Converting X.509 Certificates to PKCS#12 for Client Application Certificate... "$ENDCOLOR;

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

echo -e $BLUE "Compiling Certificate and Private Key... "$ENDCOLOR;
openssl pkcs12 -export -out mycert.pfx -in mycert.pem -name "Application"

echo -e $BLUE "Generating Certificate and Private key Request... "$ENDCOLOR;
copenssl req -new -newkey rsa:1024 -nodes -keyout mykey.pem -out myreq.pem

echo -e $BLUE "Signature Verification: "$ENDCOLOR;
penssl req -in myreq.pem -noout -verify -key mykey.pem

echo -e $BLUE "Information Verification: "$ENDCOLOR;
openssl req -in myreq.pem -noout -text

echo -e $BLUE "Deploy Certificate to the System Certificate Directory "$ENDCOLOR;
sudo cp mycert.pem /usr/share/ca-certificates/mycert.crt

echo -e $BLUE "Appending CA-Certificates Configuration "$ENDCOLOR;
sudo dpkg-reconfigure ca-certificates

echo -e $BLUE "Updating CA Certificates Database"$ENDCOLOR;
sudo update-ca-certificates

echo ""
echo -e $BLUE"##########################################################################################"$ENDCOLOR
echo -e $YELLOW"# Completed Successfully. Imported Certificate into the System CA Certificates Database. #"$ENDCOLOR
echo -e $BLUE"##########################################################################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
