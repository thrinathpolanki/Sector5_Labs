import os
import re
from collections import defaultdict

# Function to preprocess a document
def preprocess(text):
    text = text.lower()
    text = re.sub(r'[^a-z0-9\s]', ' ', text)
    words = text.split()
    return words

# Function to construct inverted index
def build_inverted_index(document_folder):
    inverted_index = defaultdict(set)
    vocabulary = set()
    documents = sorted(os.listdir(document_folder))
    document_count = 0

    for filename in documents:
        filepath = os.path.join(document_folder, filename)
        if not os.path.isfile(filepath):
            continue

        if not filename.endswith(".txt"):
            continue

        document_count += 1
        document_id = filename

        with open(filepath, "r", encoding="utf-8") as file:
            text = file.read()

        words = preprocess(text)

        for word in words:
            vocabulary.add(word)
            inverted_index[word].add(document_id)

    return inverted_index, vocabulary, document_count


# Main Program
document_folder = "documents"
index, vocabulary, document_count = build_inverted_index(document_folder)

print("=" * 60)
print("           INVERTED INDEX CONSTRUCTION")
print("=" * 60)
print("Number of Documents :", document_count)
print("Vocabulary Size     :", len(vocabulary))
print("Number of Terms     :", len(index))
print("=" * 60)

# Display Inverted Index
print("\nINVERTED INDEX")
print("-" * 60)

for term in sorted(index):
    print(f"{term:20} -> {sorted(index[term])}")

# Query Processing
while True:
    query = input("\nEnter search term (or 'exit'): ").lower()

    if query == "exit":
        break

    if query in index:
        documents = sorted(index[query])
        print("\nTerm :", query)
        print("Documents containing the term:")
        print(documents)
        print("Document Frequency :", len(documents))
    else:
        print("\nTerm not found in the collection.")
