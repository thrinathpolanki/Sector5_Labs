# ============================================================
# IRS LAB - EXPERIMENT 5
# Text Document Clustering Using K-Means
# Dataset: 20 Newsgroups
# ============================================================

# ------------------------------------------------------------
# 1. IMPORT LIBRARIES
# ------------------------------------------------------------
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import fetch_20newsgroups
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
from sklearn.metrics import (
    confusion_matrix,
    precision_score,
    recall_score,
    f1_score,
    classification_report,
    adjusted_rand_score,
    normalized_mutual_info_score
)
from scipy.optimize import linear_sum_assignment
import warnings
warnings.filterwarnings("ignore")

# ------------------------------------------------------------
# 2. LOAD DATASET (4 CATEGORIES)
# ------------------------------------------------------------
categories = [
    'comp.graphics',
    'rec.sport.baseball',
    'sci.space',
    'talk.politics.misc'
]

data = fetch_20newsgroups(subset='all',
                           categories=categories,
                           remove=('headers', 'footers', 'quotes'))

docs = data.data
true_labels = data.target
class_names = data.target_names
n_classes = len(class_names)

print("Number of documents:", len(docs))
print("Number of classes:", n_classes)
print("Classes:", class_names)

# ------------------------------------------------------------
# 3. TEXT PREPROCESSING USING TF-IDF
# ------------------------------------------------------------
vectorizer = TfidfVectorizer(
    lowercase=True,
    stop_words='english',
    max_df=0.95,
    min_df=2,
    ngram_range=(1, 2),
    max_features=20000
)

X = vectorizer.fit_transform(docs)
print("TF-IDF Matrix Shape:", X.shape)
print("Vocabulary Size:", len(vectorizer.vocabulary_))

# ------------------------------------------------------------
# 4. APPLY K-MEANS CLUSTERING
# ------------------------------------------------------------
k = n_classes   # K=4
kmeans = KMeans(n_clusters=k, init='k-means++',
                 n_init=20, max_iter=300, random_state=42)
cluster_labels = kmeans.fit_predict(X)

print("K-Means clustering completed.")
print("Number of clusters:", k)

# ------------------------------------------------------------
# 5. CLUSTER DISTRIBUTION
# ------------------------------------------------------------
unique, counts = np.unique(cluster_labels, return_counts=True)
print("Cluster distribution:")
for u, c in zip(unique, counts):
    print(f"Cluster {u}: {c} documents")

# ------------------------------------------------------------
# 6. CONTINGENCY MATRIX
# ------------------------------------------------------------
cm = confusion_matrix(true_labels, cluster_labels)
print("\nContingency Matrix (Actual Class vs Cluster):")
print(cm)

sns.heatmap(cm, annot=True, fmt='d', cmap='Blues')
plt.xlabel('Cluster ID')
plt.ylabel('Actual Class')
plt.title('Contingency Matrix')
plt.show()

# ------------------------------------------------------------
# 7. HUNGARIAN ALGORITHM FOR CLUSTER-LABEL MAPPING
# ------------------------------------------------------------
def best_cluster_mapping(y_true, y_pred):
    cm = confusion_matrix(y_true, y_pred)
    row_ind, col_ind = linear_sum_assignment(-cm)
    mapping = {col: row for row, col in zip(row_ind, col_ind)}
    return mapping

mapping = best_cluster_mapping(true_labels, cluster_labels)

print("\nBest Cluster to Class Mapping:")
for cluster, true_class in mapping.items():
    print(f"Cluster {cluster} -> {class_names[true_class]}")

# Map cluster labels to actual classes
mapped_labels = np.array([mapping[c] for c in cluster_labels])

# ------------------------------------------------------------
# 8. PERFORMANCE MEASURES
# ------------------------------------------------------------
# Purity
def purity_score(y_true, y_pred):
    cm = confusion_matrix(y_true, y_pred)
    return np.sum(np.max(cm, axis=0)) / np.sum(cm)

purity = purity_score(true_labels, cluster_labels)
precision = precision_score(true_labels, mapped_labels,
                             average='weighted', zero_division=0)
recall = recall_score(true_labels, mapped_labels,
                       average='weighted', zero_division=0)
fmeasure = f1_score(true_labels, mapped_labels,
                     average='weighted', zero_division=0)
ari = adjusted_rand_score(true_labels, cluster_labels)
nmi = normalized_mutual_info_score(true_labels, cluster_labels)

print("\nPerformance Measures:")
print(f"Purity     : {purity:.4f}")
print(f"Precision  : {precision:.4f}")
print(f"Recall     : {recall:.4f}")
print(f"F-Measure  : {fmeasure:.4f}")
print(f"ARI        : {ari:.4f}")
print(f"NMI        : {nmi:.4f}")

# ------------------------------------------------------------
# 9. CLASSIFICATION REPORT AFTER MAPPING
# ------------------------------------------------------------
print("\nClassification Report After Mapping:")
print(classification_report(true_labels, mapped_labels,
                             target_names=class_names,
                             zero_division=0))

# ------------------------------------------------------------
# 10. CONFUSION MATRIX AFTER MAPPING
# ------------------------------------------------------------
cm_mapped = confusion_matrix(true_labels, mapped_labels)
plt.figure(figsize=(8, 6))
sns.heatmap(cm_mapped, annot=True, fmt='d', cmap='Greens',
            xticklabels=class_names, yticklabels=class_names)
plt.xlabel('Predicted Class (Mapped)')
plt.ylabel('Actual Class')
plt.title('Confusion Matrix After Mapping')
plt.show()

# ------------------------------------------------------------
# 11. PERFORMANCE BAR CHART
# ------------------------------------------------------------
metrics = ['Purity', 'Precision', 'Recall', 'F-Measure']
scores = [purity, precision, recall, fmeasure]
plt.figure(figsize=(8, 5))
bars = plt.bar(metrics, scores, color=['skyblue', 'orange',
                                        'lightgreen', 'salmon'])
plt.ylim(0, 1)
plt.ylabel('Score')
plt.title('K-Means Clustering Performance')
for bar, score in zip(bars, scores):
    plt.text(bar.get_x() + bar.get_width() / 2, score + 0.02,
              f"{score:.4f}", ha='center')
plt.show()

# ------------------------------------------------------------
# 12. 2D VISUALIZATION USING PCA
# ------------------------------------------------------------
from sklearn.decomposition import PCA
pca = PCA(n_components=2, random_state=42)
X_pca = pca.fit_transform(X.toarray())

plt.figure(figsize=(8, 6))
scatter = plt.scatter(X_pca[:, 0], X_pca[:, 1],
                       c=cluster_labels, cmap='tab10', s=10)
plt.title('K-Means Clustering (PCA Visualization)')
plt.xlabel('PCA Component 1')
plt.ylabel('PCA Component 2')
# NOTE: The source poster shows "range(K)" here with an uppercase K, while
# the clustering step above (Section 4) defines the variable in lowercase
# as "k = n_classes". This looks like a typo in the original poster's code
# and, if run exactly as shown, would raise a NameError since K is never
# defined. It is preserved verbatim below (per source-code fidelity) rather
# than silently corrected — replace K with k to make this line runnable.
plt.legend(handles=scatter.legend_elements()[0],
           labels=[f'Cluster {i}' for i in range(K)],
           title='Cluster')
plt.show()

# ------------------------------------------------------------
# 13. SAVE RESULTS TO CSV
# ------------------------------------------------------------
results = pd.DataFrame({
    'Metric': ['Purity', 'Precision', 'Recall', 'F-Measure',
               'Adjusted Rand Index', 'Normalized Mutual Info'],
    'Score': [purity, precision, recall, fmeasure, ari, nmi]
})
results.to_csv('kmeans_clustering_results.csv', index=False)
print("\nResults saved to 'kmeans_clustering_results.csv'")
