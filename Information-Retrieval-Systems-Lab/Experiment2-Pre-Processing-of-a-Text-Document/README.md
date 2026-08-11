<div align="center">

### 📄 Experiment 2 - Pre-Processing of a Text Document: Stop Word Removal and Stemming

---

**Tokenization • Stop Word Removal • Stemming • Text Normalization**

[![Python](https://img.shields.io/badge/-PYTHON-1E88E5?style=flat-square&logo=python&logoColor=white)](#) [![NLTK](https://img.shields.io/badge/-NLTK-3D2B56?style=flat-square)](#) [![IR Lab](https://img.shields.io/badge/-INFORMATION%20RETRIEVAL%20SYSTEMS-2E3440?style=flat-square)](#) [![Lab](https://img.shields.io/badge/-LAB-00E5CC?style=flat-square)](#) [![Status](https://img.shields.io/badge/✅%20STATUS-COMPLETED-2E7D32?style=flat-square)](#)

</div>

![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# Aim

To perform text preprocessing by removing stop words and applying stemming to normalize and clean a text document for better analysis in NLP and IR applications.

![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# Description

## 💡 Problem Statement

Raw text contains many common words (e.g., *"is"*, *"the"*, *"in"*) that don't add much meaning. Additionally, different forms of a word (e.g., *"connect"*, *"connected"*, *"connecting"*) refer to the same underlying meaning. This experiment uses **stop word removal** and **stemming** to clean and normalize text for better downstream processing.

## 🔄 Process Pipeline

The experiment follows five sequential steps to transform raw text into a cleaned, normalized token list:

```mermaid
flowchart LR
    A["1️⃣ Input Text Document<br/>Paragraph, sentence, or article"] --> B["2️⃣ Tokenize the Text<br/>Split text into individual words"]
    B --> C["3️⃣ Remove Stop Words<br/>Eliminate frequent, low-information words"]
    C --> D["4️⃣ Apply Stemming<br/>Reduce words to their root form"]
    D --> E["5️⃣ Display Output<br/>Show cleaned and normalized words"]
```

| Step | Description |
|------|-------------|
| **1. Input Text Document** | A paragraph, sentence, or article is taken as raw input. |
| **2. Tokenize the Text** | The text is split into individual words using `word_tokenize()`. |
| **3. Remove Stop Words** | Frequent, low-information words (e.g., "is", "in", "and") are eliminated using NLTK's English stop-word list. |
| **4. Apply Stemming** | Remaining words are reduced to their root form using the **Porter Stemmer** algorithm. |
| **5. Display Output** | The original text, the stop-word-filtered tokens, and the stemmed tokens are printed. |

## 🌍 Real-World Use Cases

| Application | Benefit |
|-------------|---------|
| 🔍 **Search Engines** | Improves matching by reducing noisy and variable terms. |
| 🧾 **Plagiarism Detection** | Helps detect similar content despite different wording. |
| 🤖 **Chatbots** | Makes it easier to match user intent with fewer keywords. |
| 🗂️ **Document Classification** | Reduces vocabulary size, improving accuracy and efficiency. |

## 🎯 Outcome of the Experiment

- ✅ Understand the need for preprocessing in NLP and IR.
- ✅ Implement basic preprocessing techniques: stop word removal and stemming.
- ✅ Apply these techniques to clean and normalize any textual input.

![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# Output

## Original Text

```text
Machine learning algorithms are widely used in data analysis and data science tasks.
```

*This is the raw input text, containing all words, including stop words and various word forms.*

## After Stop Word Removal

```text
['Machine', 'learning', 'algorithms', 'widely', 'used', 'data', 'analysis',
 'data', 'science', 'tasks']
```

*Words like "are", "in", and "and" were removed because they are stop words and do not add meaningful information.*

## After Stemming

```text
['machin', 'learn', 'algorithm', 'wide', 'use', 'data', 'analysi',
 'data', 'scienc', 'task']
```

*Words are reduced to their root (base) form — e.g., "learning" → "learn", "analysis" → "analysi".*

![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)
