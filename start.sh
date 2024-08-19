#!/bin/sh

# Start Django
cd /app/django-project
python3 manage.py runserver 0.0.0.0:8000 &

# Start Flask
cd /app/flask-project
flask run --host=0.0.0.0 --port=5000 &

# Start Next.js
cd /app
npm run dev
