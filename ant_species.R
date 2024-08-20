# Load necessary libraries
library(ggplot2)
library(reshape2)

install.packages("svglite")

setwd("/Users/yujirokisu/Library/CloudStorage/OneDrive-東京都公立大学法人/TMU/ClassMaterials3-1/Sado_field_study/animal_2_ant_species")

data <- read.csv("/Users/yujirokisu/Library/CloudStorage/OneDrive-東京都公立大学法人/TMU/ClassMaterials3-1/Sado_field_study/animal_2_ant_species/ant_species.csv")

# 
colnames(data) <- c("site", "species", "number")

# Replace NA values with 0 in the 'number' column
data$number[is.na(data$number)] <- 0

# Reshape the data for plotting
data_melted <- melt(data, id.vars = c("site", "species"))

# Plot the heatmap with solid black lines around each tile
p <- ggplot(data_melted, aes(x = species, y = site, fill = value)) +
  geom_tile(color = "black") +  # Add black lines around each tile
  scale_fill_gradient(low = "white", high = "blue") +
  theme_minimal() +
  labs(x = "Species", y = "Distance from the starting point (m)", fill = "The number of individuals") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(legend.position = c(0.3, 0.2),
        legend.title = element_text(size = 10))

ggsave(file = "ant_species.svg", plot = p)


