# استخدام نسخة بايثون رسمية ومستقرة
FROM python:3.11-slim

# تحديد مسار العمل داخل السيرفر
WORKDIR /app

# نسخ ملف المتطلبات أولاً وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي ملفات المشروع
COPY . .

# فتح البورت اللي غادي يخدم عليه البوت (Railway كيعطي بورت ديناميكي فـ PORT)
ENV PORT=8080
EXPOSE 8080

# الأمر اللي كيشغل البوت (استعمل gunicorn إلا كان Flask)
CMD gunicorn app:app --bind 0.0.0.0:$PORT
