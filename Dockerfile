# Use official Python slim image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy only requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the backend code
COPY . .

# Expose port 10000 (as your app runs on 10000)
EXPOSE 10000

# Run the Flask app with Gunicorn on port 10000
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]
