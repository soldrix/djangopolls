FROM python:3.9-slim
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
ENV PYTHONUNBUFFERED 1
WORKDIR /django-polls
COPY . ./
RUN pip install django
RUN pip install psycopg2
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]