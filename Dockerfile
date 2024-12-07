FROM python:3.9-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libportaudio2 \
    libportaudiocpp0 \
    portaudio19-dev \
    libasound-dev \
    libsndfile1-dev \
    ffmpeg

WORKDIR /app

# Install Poetry
RUN pip install --no-cache-dir poetry

# Copy dependency files
COPY pyproject.toml poetry.lock ./

# Configure poetry and install dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p /app/call_transcripts
RUN mkdir -p /app/db

EXPOSE 3000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]
