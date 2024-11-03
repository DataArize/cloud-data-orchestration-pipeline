# Use an official Python runtime as a parent image
FROM python:3.12-alpine

# Set the working directory
# Install system dependencies required for building certain Python packages
RUN apk add --no-cache g++ make

WORKDIR /app

# Copy the local code to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Use CMD to pass arguments at runtime
CMD ["python", "main.py"]
