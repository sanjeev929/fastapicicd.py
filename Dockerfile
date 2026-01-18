# Use the Python 3.12 slim image
FROM python:3.12-slim

# Set the working directory
WORKDIR /

# Install system dependencies (including PostgreSQL dev libs)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libmagic1 \
    file \
    libpq-dev \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY ./requirements.txt /requirements.txt

# Upgrade pip & install dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r /requirements.txt

# Copy the entire application
COPY ./ /

# Run the app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
