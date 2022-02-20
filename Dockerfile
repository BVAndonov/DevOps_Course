# Choose the base image
FROM centos:centos7.9.2009

# Install updates
RUN yum -y update && yum clean all

# Install apache server
RUN yum install -y httpd
EXPOSE 80
RUN echo "<h1>Hello from my first container!</h1>" >> /var/www/html/index.html
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]