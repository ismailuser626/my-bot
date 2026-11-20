# استعمال نسخة بايثون رسمية
FROM python:3.11-slim

# تحديد مسار العمل
WORKDIR /app

# نسخ ملف المتطلبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات
COPY . .

# فتح البورت 8080
EXPOSE 8080

# تشغيل السيرفر بـ Gunicorn (أفضل طريقة لـ Flask)
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080"]
