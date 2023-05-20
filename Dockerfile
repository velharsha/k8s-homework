# Python image as runtime base image
FROM python:3.9

# working directory in the container
WORKDIR /app

# Copy the requirements file.
COPY requirements.txt .

# Installing the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Expose the port on which the Flask app will run
EXPOSE 5000


# Define the command to run the Flask application
CMD ["python", "/app/userapi.py"]
