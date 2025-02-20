# Netflix Dataset Analysis Project

## Introduction
This project utilizes unsupervised learning and evolutionary optimization techniques to perform comprehensive data analysis and outlier detection on the Netflix dataset. The main goal is to identify and understand key patterns, trends, and anomalies in Netflix content and ratings.

## Team
- Matheus Cruz
- Kasi Venkata Sai Kiran Vattem
- Katherin Jose
- Finn Pieprzyk
- Ravi Pandey
- Levi Kletetzka

### Affiliation
University of Paderborn, Germany

## Project Structure

### Data Analysis
- **Action Shows Analysis:** Identified top-rated action shows with IMDb ratings above 8.9.
- **Top Movies by Country:** Focused on the top movies from Japan and France, excluding co-productions.
- **Top Sci-Fi Actors:** Ranked actors in the sci-fi genre using a combination of IMDb score and appearance frequency.
- **Best and Worst Actors:** Calculated and ranked actors based on average IMDb scores.

### Outlier Detection
- **Outlier Detection:** Employed statistical tests to analyze the distribution and detect outliers in IMDb and TMDB ratings.
- **Comparative Analysis:** Analyzed and compared the distribution of IMDb and TMDB ratings using non-parametric tests.

### Clustering
- **Hierarchical Clustering (HCA):** Analyzed shows based on IMDb ratings and runtime.
- **K-Means Clustering:** Identified optimal clusters based on the cardinality of the movie cast.
- **DBScan:** Explored trends in the cardinality of the cast over the years.

## Tools and Technologies
- **R and Tidyverse:** For data manipulation and analysis.
- **Clustlearn Package:** For clustering algorithms.

## Key Findings
- Significant insights into the distribution of ratings and the impact of factors like vote count and age on ratings.
- Identified regional content trends, particularly in Bollywood and anime.
- Clustering algorithms highlighted distinct groupings in the data based on various features.

## Visualizations
- Various plots including histograms, box plots, scatter plots, and dendrograms to illustrate findings and support the analyses.

## References
- IMDb and TMDB rating systems and user base differences were crucial for understanding the variations in data.

## Repository Navigation
- `/data`: Contains the dataset files used in the analyses.
- `/Clustering`: Includes R scripts used for Clustering. Methods used : HCA, DbScan, K-Mean clustering.
- `/Data_Analysis`: Includes R scripts used for Data Analysis.
- `/Outlier_Detection`: Includes R scripts used for Outlier Detection.
- `/report`: Contains the final report describing the results.

## How to Use
- Clone the repository, and run the R scripts to reproduce the analyses and visualizations.

## Contact
- For more information, feel free to contact me via : ravipandey0706@gmail.com 


Feel free to explore the repository and reach out with any questions or contributions!
