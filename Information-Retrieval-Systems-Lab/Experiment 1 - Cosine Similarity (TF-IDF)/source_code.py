# Experiment 01 - Information Retrieval Systems Lab
# Aim: Compute Cosine Similarity between two documents using TF-IDF Vectorization

# ------------------ STEP 2: Vectorize the Documents ------------------
from sklearn.feature_extraction.text import TfidfVectorizer

# NOTE: The literal Python assignment lines for doc1 and doc2 were not visible
# in the source photograph's code blocks. Only their TEXT CONTENT was shown in
# the "STEP 1: PREPARE DOCUMENTS" boxes (DOC 1 / DOC 2). They are reconstructed
# here using that exact text so the fit_transform() call below (which is shown
# in the photograph referencing `doc1, doc2`) is runnable.
doc1 = "Machine learning is a method of data analysis."
doc2 = "Data analysis can be done using machine learning techniques."

vectorizer = TfidfVectorizer(stop_words='english')

tfidf_matrix = vectorizer.fit_transform([doc1, doc2])

# ------------------ STEP 3: Compute Cosine Similarity ------------------
from sklearn.metrics.pairwise import cosine_similarity

similarity = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])

print(f"Cosine Similarity: {similarity[0][0]:.4f}")

# ------------------ NOTE ON OUTPUT DISCREPANCY ------------------
# The source photograph's laptop screen shows: "Cosine Similarity: 0.8165"
# Running this reconstructed script (with doc1/doc2 text taken verbatim from
# the "STEP 1" boxes) produces "Cosine Similarity: 0.5803" instead.
# [UNCLEAR: The exact reason for this mismatch cannot be determined from the
# photograph alone — it may be due to a different/updated doc1-doc2 wording
# used at the time the screenshot was taken, or additional preprocessing not
# visible in the image.] The 0.8165 value is preserved as-is in Description.md
# under "# Output" because it is the actual result shown in the photograph,
# not the result of re-running this reconstructed code.
