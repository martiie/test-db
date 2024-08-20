# ใช้ภาพ MySQL เป็นพื้นฐาน
FROM mysql:latest

# ตั้งค่าตัวแปรสภาพแวดล้อมสำหรับ MySQL
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=test
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=1234

# คัดลอกไฟล์ SQL (ถ้ามี) ไปยัง Docker image (ถ้ามี)
# COPY ./init.sql /docker-entrypoint-initdb.d/

# เปิดพอร์ต 3306 สำหรับการเข้าถึงจากภายนอก
EXPOSE 3306

# เริ่มต้น MySQL
CMD ["mysqld"]
