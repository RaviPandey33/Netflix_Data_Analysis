# read the files
credits <- read.csv('data/credits.csv')
titles <- read.csv('data/titles.csv')

# aggregate the second feature
count <- credits %>% group_by(id) %>% 
  summarise(total_count=n(),
            .groups = 'drop')
# setup the data for clustering
columns <- titles[c('id' ,'release_year', 'runtime')]
columns <- merge(count, columns)

# extract the two features which to cluster on
toCluster <- columns[c('total_count' ,'release_year')]
minPts = 4

# uncomment the following lines to create the k-dist graph
# dists = kNNdist(toCluster,minPts) 
# barplot(sort(dists, decreasing = TRUE))  

# run the algorithm
db <- dbscan(toCluster, eps = 10, minPts = 4)

# store the class labels in the table
toCluster$clustering_dbscan <- db$cluster

#visualize the results
ggplot(toCluster, aes(x=release_year, y = total_count, color=clustering_dbscan)) + geom_point()
