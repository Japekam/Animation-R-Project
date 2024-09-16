library(magick)

# static meme

crowded_train <- image_read("crowded_metro.png") %>% #https://images.pexels.com/photos/2706436/pexels-photo-2706436.jpeg
  image_scale(530)

empty_train <- image_read("empty_metro.png") %>% #https://images.pexels.com/photos/302428/pexels-photo-302428.jpeg
  image_scale(530)

# Creating blank boxes to write text on them

text1 <- image_blank(width = 350, height = 350, color = "#00f0FF") %>%
  image_annotate(text = "Books in\nSchool Bag", color = "#000000", size = 60)

text2 <- image_blank(width = 350, height = 350, color = "#00f0FF") %>%
  image_annotate(text = "Books in\nCollege Bag", color = "#000000", size = 60)

# creating various rows and appending the corresponding image to it's text

first_row <- c(crowded_train, text1) %>%
  image_append()

second_row <- c(empty_train, text2) %>%
  image_append()

# appending the final meme together

final_meme <- c(first_row, second_row) %>%
  image_append(stack = TRUE)

# saving it on my computer

image_write(final_meme, "my_meme.png")


# animation

old_pic <- image_scale(image_read("crowded_metro.png"))

new_pic <- image_scale(image_read("empty_metro.png"))

# animating the meme by using all 4 images together and resizing it

final_animation <- image_resize(c(text1, old_pic, text2, new_pic), '300x250!') %>%
  image_background('white') %>% # defining the background color
  image_morph() %>% # the fading effect
  image_animate(optimize = TRUE, fps = 5) # defining the speed of effect

# saving it on my computer

image_write(final_animation, "my_animation.gif")
