FROM --platform=linux/amd64 python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    poppler-utils \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
# Install requirements in separate step to leverage caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Then install spacy and nltk data
RUN python -m spacy download en_core_web_sm && \
    python -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"

# Copy application code
COPY . .

# Create directories
RUN mkdir -p /app/input /app/output

CMD ["python", "-u", "app/main.py"]