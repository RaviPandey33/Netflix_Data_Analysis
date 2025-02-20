# Function to use the lloyd initialization for the kmeans algorthm
initialize_lloyd <- function(points, num_clusters){
  dimPoints = dim(points)[2]
  clusters <-  matrix(0, nrow = num_clusters, ncol = dimPoints + 1)
  for(row in 1:nrow(points)) {
    clusterAssign <- sample(1:num_clusters,1, replace=F)[1] 
    clusters[clusterAssign, dimPoints + 1] <- clusters[clusterAssign, dimPoints + 1] + 1
    clusters[clusterAssign, 1:dimPoints] <- clusters[clusterAssign,1:dimPoints] + as.matrix(points[row,])
  }
  for(row in 1:nrow(clusters)) {
    clusters[row,] <- clusters[row,] / clusters[row,dimPoints + 1]
  }
  
  return(clusters[,1:dimPoints])
}

# Load Data
credits <- read.csv('data/credits.csv')
titles <- read.csv('data/titles.csv')

# aggregate the second features used for clusering
count <- credits %>% group_by(id) %>% 
  summarise(total_count=n(),
            .groups = 'drop')
# setup the data for clustering
columns <- titles[c('id' ,'release_year', 'runtime')]
columns <- merge(count, columns)

# extract the two features used for clustering
toCluster <- columns[c('total_count' ,'release_year')]

# comment out to display the elbow and gap statistic graph
# fviz_nbclust(toCluster, kmeans, method = "wss")
# gap.stat <- clusGap(toCluster, FUNcluster = kmeans, K.max = 50)
# fviz_gap_stat(gap.stat)

# setup the parameters for the algorithm
numClusters = 2

# uncomment the following lines to use lloyd initialization
# startCenters <- initialize_lloyd(toCluster, numClusters)
# km <- kmeans(toCluster, startCenters, max_iterations = 25)
# uncomment the following for the forgy initialization
# km <- kmeans(toCluster, numClusters, max_iterations = 25, initialization = "random")

# run the algorithm and store the class labels
km <- kmeans(toCluster, numClusters, max_iterations = 25, initialization = "kmeans++")
toCluster$cluster <- km$cluster

# visualize the clusters
ggplot(toCluster, aes(x=release_year, y = total_count, color=cluster)) + geom_point()
