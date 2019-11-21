library(paletter)
colours_vector <- create_palette(image_path = "~/Desktop/835px-Piero_della_Francesca_046.jpg",
               number_of_colors = 32,
               type_of_variable = "categorical")
              
library(ggplot2)
ggplot(data = mtcars, aes(x = rownames(mtcars),y = hp,color = rownames(mtcars),
                          fill = rownames(mtcars))) +
  geom_bar(stat = 'identity') +
  scale_color_manual(values = colours_vector) +
  scale_fill_manual(values = colours_vector)+
  theme_minimal() +
  guides(size = FALSE) +
  theme(legend.position = "bottom") +
  labs(title = "disp vs hp")+
  coord_flip()
              
              
