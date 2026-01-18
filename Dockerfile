FROM python:3.12-slim

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
    libmagic1 \
    file \
    libpq-dev \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /requirements.txt

RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r /requirements.txt

COPY ./ /

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
