# Intelligent Document Analyst - Approach Explanation

## Overview
The system is designed to extract and prioritize document sections based on a specific persona and their job-to-be-done. It combines multiple NLP techniques with efficient processing to deliver relevant results within strict constraints.

## Key Components

### 1. Document Processing
- *Parallel PDF Extraction*: Uses PyMuPDF with thread pooling for efficient text extraction
- *Structure Analysis*: Identifies sections, headers, and formatting cues through font analysis
- *Content Chunking*: Breaks documents into meaningful sections for granular analysis

### 2. Content Analysis
- *Semantic Understanding*: Uses Sentence-BERT (all-MiniLM-L6-v2) for efficient embeddings
- *Keyword Extraction*: Combines spaCy's NLP pipeline with custom heuristics
- *Entity Recognition*: Identifies named entities as importance signals
- *Formatting Analysis*: Scores text based on visual prominence (size, bold, etc.)

### 3. Relevance Ranking
- *Multi-Feature Scoring*: Combines semantic similarity, keyword overlap, and formatting
- *Persona-Adaptive Weights*: Adjusts feature importance based on persona type
- *Diversity Preservation*: Ensures representation from all input documents

### 4. Performance Optimization
- *Lightweight Models*: Carefully selected to stay under 1GB memory limit
- *Thread Parallelism*: Maximizes CPU utilization for faster processing
- *Efficient Data Structures*: Minimizes memory overhead during processing

## Technical Highlights

1. *Hybrid Relevance Scoring*:
   - Combines semantic embeddings (for conceptual understanding) with keyword matching (for precision)
   - Incorporates document structure cues as secondary signals

2. *Persona Contextualization*:
   - Different weighting schemes for researchers, analysts, students, etc.
   - Persona-specific keyword extraction from role descriptions

3. *Constraint Compliance*:
   - CPU-only execution with careful thread management
   - Model selection optimized for <1GB memory footprint
   - Processing time guaranteed under 60 seconds through efficient algorithms

## Evaluation
The system was tested on the provided sample cases:
- Academic Research: Correctly identified methodology sections in research papers
- Business Analysis: Accurately extracted financial trends from reports
- Educational Content: Properly highlighted key concepts for exam preparation

The combination of semantic understanding with persona-aware ranking proved effective across diverse domains while meeting all technical constraints.