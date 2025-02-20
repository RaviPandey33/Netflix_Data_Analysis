library(tidyverse)
library(cluster)
library(dendextend)

# Load data
titles <- read.csv('data/titles.csv')

titles <- titles %>%
  select(runtime, imdb_score) %>%
  na.omit()  # Dropping rows with NA values and then scaling

titles_scaled <- scale(titles)
dist_matrix <- dist(titles_scaled, method = "euclidean")
# HCA
hclust_result <- hclust(dist_matrix, method = "ward.D2")

dend <- as.dendrogram(hclust_result) # Creating a Dendrogram
dend <- hang.dendrogram(dend, hang = 0.1)


clusters <- cutree(hclust_result, k = 3)  # Assuming we decide on 4 clusters
titles$cluster <- clusters

dend_cut <- cut(dend, h = 4)$upper  # Adjusting 'h' of the Dendrogram
plot(dend_cut, main = "Trimmed Dendrogram",xlab = "", ylab = "", axes = FALSE)
abline(h = 4, col = "red", lty = 2) # Creating horizontal cut line

# Ploting the clustering results
ggplot(titles, aes(x = runtime, y = imdb_score, color = cluster)) +
  geom_point(alpha = 0.6) +
  labs(title = "Cluster Analysis of Netflix data by Runtime and IMDb Score",
      x = "Runtime",
      y = "IMDb Score") +
 theme_minimal()

