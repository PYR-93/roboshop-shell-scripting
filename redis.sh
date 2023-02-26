
COMPONENT=redis 
LOG_FILE=/tmp/${COMPONENT}

source ./common.sh 

echo " Install Redis repo on CentOS-8"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y --skip-broken &>>$LOG_FILE
Statuscheck $?

echo " Install Redis on CentOS-8"
dnf module enable redis:remi-6.2 -y
yum install redis -y &>>$LOG_FILE
Statuscheck $?

echo "stopping  redis "
systemctl stop redis &>>$LOG_FILE
Statuscheck $?

echo "Update the bind from 127.0.0.1 to 0.0.0.0"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf &>>$LOG_FILE
Statuscheck $?

echo "enabling redis "
systemctl enable redis &>>$LOG_FILE
Statuscheck $?


echo "starting redis "
systemctl start redis &>>$LOG_FILE
Statuscheck $?



