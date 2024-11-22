# Sử dụng Python 3.9 làm base image
FROM python:3.9-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file requirements.txt và cài đặt các thư viện
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép mã nguồn ứng dụng vào container
COPY . .

# Expose port 5000 để truy cập từ bên ngoài
EXPOSE 5000

# Lệnh khởi chạy ứng dụng Flask
CMD ["python", "main.py"]
