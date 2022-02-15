## SE370 AY22-2
## Lesson 15 - De-Bugging in R!


#---First things first...let's get out of RStudio Cloud.
# RStudio Cloud is a GREAT tool but you won't be working on it 100% of the time!
# So, you need to know a few things about working with your local RStudio. 

# Check on ALL the files that are included with this lesson and export, then
# save to your desktop. Unzip the .zip file, open your local RStudio, and open
# this script.

#---The Working Directory
# R Working Directory is the directory of R workspace. Any files in the R
# workspace could be referenced in R commands without specifying any relative
# path. While working with external input files or output files, knowing the R
# workspace helps in easing the efforts.

# You haven't had to worry about this yet...because in RStudio Cloud, the 
# working directory is set to your project folder!

# We use the command `getwd()` to learn what our working directory is
getwd()

# When you are working with an R script, the "default" working directory is 
# usually your Documents folder. When you are working in RMarkdown (.RMD)
# the default is whatever folder that .RMD file is saved to.

#--- Now...let's set our working directory using `setwd()`!
# The easiest way to do this is to open the folder you want to set as 
# your working directory, right click the folder name on the top, and 
# choose "copy address as text." Paste it inside the parenthesis.

setwd("C:\Users\james.macgibbon\West Point\SE 370 Instructors - AY 22-2 Files\Lesson Files\Lesson_15 - R - Debugging in R")

# But when you run this, we get an error...

# Copy and paste the error code into Google and let's find out 
# how to fix it...





#---Since it's a string, we need to
# put it in quotes. The backslashes need to be forward slashes. 

setwd()

# Now it works!
# Let's read in the csv file...

df <- read.csv("students_sample.csv")

# ERROR. Why can't we read in the "students_sample.csv" file?
# It's in the working directory...in another folder, "data"...
# Make the correction...

df <- read.csv("data/students_sample.csv")

#--- Biggest Tools for Debugging:

# 1. READ THE ERROR CODE. Does it tell you what line it occurred? What function? 
# What object? What does it say about the error?

# 2. CHECK INPUT TYPE/CLASS, DIMENSIONS, ETC. Most errors are actually fairly
# simple...it can be an incompatible input, calling a column that doesn't exist,
# iterating through the length of a data frame (aka the # of columns) v. the length
# of a column (aka the # of rows), forgetting quotes on a string, etc.
 
# 3. READ THE DOCUMENTATION. Use the "Help" section of RStudio or the ? capability 
# to search for the function. Did you use it correctly? Did you use the correct
# arguments? Do you have all the arguments? Was something formatted incorrectly?
# look at examples!!!!

# 4. GOOGLE IS YOUR FRIEND. Just copy & paste the error code into Google. 
# 9/10, someone has made the same error and asked about it on StackOverflow. 
# A word of caution -- forums like StackOverflow allow anyone to answer questions.
# You won't always find a perfect answer...but you often find some good
# insights to your question.

#---Below is code that needs debugging. When you run these lines...there should 
# be errors. Make the necessary corrections!

# 1.
df_2 <- data.frame(row_1 = 1:8, row_2 = 9:15, row_3 = 16:24)





# 2.
df_2[ , col_9]


#col_9 doesn't exist!!
df_2[, 3]



# 3. 
x <- "yes"

if("yes"){
  print("correct")
}


## Need the if statement to be a Logical somehow!!

if(x =="yes"){
  print("correct")
}


# 4.
vec <- c("yes", "no", "no", "yes")
for(i in vec){
  if(vec = "yes"){
    print("correct")
  }
}

### need to set i == to "yes"

for (i in vec) {
  if (i =="yes") {
      print ("correct")
  }
  
}


# 5. 
vec <- c("yes" "no" "no" "yes")


## need comma's!

vec <- c("yes", "no", "no", "yes")


# 6. There won't be an error code here...but check out if our
# output vector populates. Can you fix it?
output <- c()

for(i in vec){
  if(i == "yes"){
    output <- "true"
  }else{
    output <- "false"
  }
}

####  Create a dummy variable "input" and append that to our blank "output" vector

output <- c()

for(i in vec){
  if(i == "yes"){
    input <- "true"
    output <- append(output, input)
  }else{
    input <- "false"
    output <- append(output, input)
  }
}

output



# 7. 
vec <- c("1,000", "2,000", "3,000")

for(i in 1:3){
  tmp <- vec[i] / 10
  output <- paste0("The answer is ", tmp)
  print(out)
} 

### We put the vec numbers in quotes; they are listed as a string. We can't 
## divide a string by a number. Watch out for commas!! 
## Also need to print "output" not just "out"

vec <- c(1000, 2000, 3000)
for(i in 1:3){
  tmp <- vec[i] / 10
  output <- paste0("The answer is ", tmp)
  print(output)
}




#8. 

for(i in length(df)){
  df$full_name[i] <- paste0(df$last_name, ", ", df$first_name)
}

## need to replace length with nrow and then index last_name and first_name!!
## use str(df) to determine it is a data frame. length doesn't work as well


for(i in 1:nrow(df)){
  df$full_name[i] <- paste0(df$last_name[i], ", ", df$first_name[i])
}



# 9. 

avg(df$year)


## use mean

mean(df$year)







