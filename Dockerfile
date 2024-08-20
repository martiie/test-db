# ใช้ MySQL ภาพจาก Docker Hub
FROM mysql:latest

# ตั้งค่าตัวแปรสภาพแวดล้อมสำหรับ MySQL
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=1234

# ติดตั้ง phpMyAdmin
RUN apt-get update && apt-get install -y \
    phpmyadmin \
    supervisor

# คัดลอกไฟล์ config ของ supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# คัดลอกไฟล์ SQL สำหรับการ initial
COPY ./init.sql /docker-entrypoint-initdb.d/

# รัน supervisor ที่จะจัดการ MySQL และ phpMyAdmin
CMD ["/usr/bin/supervisord"]
