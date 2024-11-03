# Use an official Python runtime as a parent image
FROM python:3.12-slim

WORKDIR /app

# Copy the local code to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Use CMD to pass arguments at runtime
CMD ["python", "main.py", "--input_path=gs://prj01-cloud-data-orch-dataset-development-asia-south1/source/Spotify_Dataset.csv", "--output_table=optimal-karma-439613-g6.analytics_spotify_playlists.playlist_data_summary", " --temp_location=gs://prj01-cloud-data-orch-dataflow-development-asia-south1/"]
