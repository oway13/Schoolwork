Wyatt Kormick
Kormi001 - 4932481

For this project I implemented a "Letter" class with its own display, and drop
functions. I found several poems related to rain, and saved them to formatted
.txt files in the data folder. I loaded one of these, and converted all of the
characters into individual Letter objects with random starting X positions. As
the program runs, more and more characters from the poem are loaded in order and
start dropping. After being on screen for 720 iterations (the vertical size of
the window, but otherwise an arbitrary number), the letters fade away, and
reappear at the top of the screen. This way, the letters never run out, but
there doesn't get to be too many on screen. The drop method is the "physics"
part of the rain. If there is no dark pixels below, the letter will fall, if
there is, it will stop. If the darkness below rises, the letter detects this
by checking if its current pixel is dark, and will respond by jumping upward.
This is very rudimentary, and often the letters will just clip through the
dark areas anyway. I did not apply a filter to the video as that seemed to
slow it down immensely. I did implement changing what values count as dark by
pressing the arrow keys. The threshold starts at 128, and changes by a value of
8 to a max of 256 and a min of 0. Pressing spacebar should set it to debug mode,
where pixels are either completely black or white, depending on their darkness,
but it instead just turns the entire screen white.
