from ubuntu:18.04

run apt-get update && \
  apt-get -y install apache2

run echo 'Docker Container Application.' > /var/www/html/index.html

run mkdir /webapp

run echo '. /etc/apache2/envars' > /webapp/run_http.sh && \
  echo 'mkdir -p /var/run/apache2' >> /webapp/run_http.sh && \
  echo 'mkdir -p /var/lock/apache2' >> /webapp/run_http.sh && \
  ehco '/usr/sbin/apache2 -D FOREGROUND' >> /webapp/run_http.sh && \
  chmod 744 /webapp/run_http.sh


expose 80

cmd /webapp/run_http.sh
