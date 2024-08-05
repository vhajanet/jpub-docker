from ubuntu:18.04

run apt-get update && \
apt-get -y install apache2

run echo 'Docker Container Application 1.' > /var/www/html/index.html

run mkdir /webapp

run echo '. /etc/apache2/envvars' > /webapp/run_http.sh && \
echo 'mkdir -p /var/run/apache2' >> /webapp/run_http.sh && \
echo 'mkdir -p /var/lock/apache2' >> /webapp/run_http.sh && \
echo '/usr/sbin/apache2 -D FOREGROUND' >> /webapp/run_http.sh && \
chmod 744 /webapp/run_http.sh

expose 80

cmd /webapp/run_http.sh

# FROM ubuntu:18.04
# RUN apt-get update && \
# apt-get -y install apache2

# RUN echo 'Docker Container Application  2.' > /var/www/html/index.html

# RUN mkdir /webapp

# RUN echo '. /etc/apache2/envvars' > /webapp/run_http.sh && \
# echo 'mkdir -p /var/run/apache2' >> /webapp/run_http.sh && \
# echo 'mkdir -p /var/lock/apache2' >> /webapp/run_http.sh && \
# echo '/usr/sbin/apache2 -D FOREGROUND' >> /webapp/run_http.sh && \
# chmod 744 /webapp/run_http.sh

# EXPOSE 80

# CMD /webapp/run_http.sh

