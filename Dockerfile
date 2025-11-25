# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install system deps (optional, good practice)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
 && rm -rf /var/lib/apt/lists/*

# Copy dependency list first (better caching)
COPY requirements.txt .

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port
EXPOSE 5000

# Run app with gunicorn in container
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
