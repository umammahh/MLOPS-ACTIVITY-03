# Use an official Python runtime as a base image
FROM python:3.9-slim AS base

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install dependencies
FROM base AS dependencies
RUN pip install -r requirements.txt

# Expose port 5000 to the outside world
EXPOSE 5000

# Run the Flask application
FROM dependencies AS runtime
CMD ["python", "app.py"]
