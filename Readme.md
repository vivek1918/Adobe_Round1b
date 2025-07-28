# 🧠 Intelligent Document Analyst

An AI-powered system that extracts and prioritizes relevant content from multi-format PDF documents based on user persona and their job-to-be-done. Optimized for performance under strict hardware and time constraints.

---

## 🔍 Overview

This system processes and analyzes documents to extract semantically relevant sections, adapting outputs for different user personas like researchers, analysts, and students. It leverages a hybrid NLP pipeline combining structure, semantics, and formatting analysis for high-precision results.

---

## ⚙️ Key Components

### 1. 📄 Document Processing
- **Parallel PDF Extraction**: Uses PyMuPDF + thread pooling for fast multi-page extraction.
- **Structure Analysis**: Detects headers, section breaks, and formatting using font metadata.
- **Content Chunking**: Segments documents into logical units for deeper analysis.

### 2. 🧠 Content Analysis
- **Semantic Understanding**: Uses Sentence-BERT (`all-MiniLM-L6-v2`) for lightweight yet powerful embeddings.
- **Keyword Extraction**: Combines spaCy NLP pipeline with domain-aware heuristics.
- **Entity Recognition**: Identifies key entities (people, orgs, locations) to gauge importance.
- **Formatting Analysis**: Boosts prominence score using font size, boldness, and other visual cues.

### 3. 📊 Relevance Ranking
- **Multi-Feature Scoring**: Blends semantic similarity, keyword overlap, and formatting weight.
- **Persona-Adaptive Weights**: Adjusts ranking logic based on the persona type.
- **Diversity Preservation**: Ensures extracted content represents multiple sections/documents.

### 4. 🚀 Performance Optimization
- **Lightweight Models**: All NLP components are optimized to stay under 1GB RAM usage.
- **Thread Parallelism**: Efficient CPU usage via concurrent processing.
- **Memory-Efficient Structures**: Optimized data flow to reduce system load.

---

## 💡 Technical Highlights

- **Hybrid Relevance Scoring**  
  Combines BERT-based semantic similarity with traditional keyword matching for best-in-class precision.

- **Persona-Aware Adaptation**  
  Dynamically adjusts relevance weights and keyword focus based on roles like:
  - Researcher
  - Business Analyst
  - Student

- **Hard Constraint Compliance**
  - CPU-only processing
  - <1GB memory usage
  - <60 seconds processing time

---

## ✅ Evaluation Results

| Persona Type       | Test Case                  | Outcome                                    |
|--------------------|----------------------------|--------------------------------------------|
| Academic Research  | Research paper PDFs        | Correctly identified methodology sections  |
| Business Analyst   | Financial reports          | Extracted KPIs and trend highlights        |
| Student            | Exam content PDFs          | Highlighted key concepts and summaries     |

---

## 🐳 Docker Usage

### 🔧 Build the Image
```bash
docker build -t round1b .
```
## 🚀Run the Container
``` bash
docker run -v "C:\Users\Vivek Vasani\intelligent_document_analyst1\intelligent_document_analyst\input:/app/input" -v "C:\Users\Vivek Vasani\intelligent_document_analyst1\intelligent_document_analyst\output:/app/output" round1b
```

## Repository Structure
``` bash
intelligent_document_analyst/
├── app/
│   ├── models/                # ML models and embeddings
│   ├── __init__.py
│   ├── analyzer.py            # Content analysis logic
│   ├── document_processor/    # PDF processing components
│   ├── main.py               # Entry point
│   ├── ranking.py            # Relevance ranking logic
│   ├── utils.py              # Helper functions
├── input/
│   ├── job.json              # Job description input
│   ├── personal.json         # Persona characteristics
│   ├── documents.json        # Input documents to analyze
├── output/                   # Generated analysis results
├── tests/                    # Test cases
├── venv/
├── .dockerignore
├── .gitignore
├── Dockerfile
├── requirements.txt          # Python dependencies
└── run.sh                    # Convenience run script
```