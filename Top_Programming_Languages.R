#Loading the libraries
library(readr)
library(dplyr)

#Data PreProcessing
by_tag_year=read.csv('by_tag_year.csv')
head(by_tag_year)

#Calculating the fraction of each language
by_tag_year$fraction=by_tag_year$number/by_tag_year$year_total

#Subsetting the R language
r_over_time=by_tag_year[by_tag_year$tag=='r',]
r_over_time=by_tag_year[by_tag_year$tag=='dplyr',]

print(r_over_time)

#Visualisation
library(ggplot2)
ggplot(r_over_time,aes(x=year,y=fraction))+geom_line()

selected_tags_over_time=by_tag_year[by_tag_year$tag=='r' | 
                                      by_tag_year$tag=='dplyr' |
                                      by_tag_year$tag=='ggplot2',]

ggplot(selected_tags_over_time,aes(x=year,y=fraction,color=tag))+geom_line()


#Subsetting the data on basis of year and filtering highest rated languages
sorted_data <- by_tag_year %>%
  group_by(tag) %>%
  summarize(tag_total = sum(number))%>%arrange(desc(tag_total))

#Top 6 Languages
highest=head(sorted_data,6)
print(highest)

#Subsetting the data on basis of highest language
best=by_tag_year[by_tag_year$tag=='javascript' | 
                   by_tag_year$tag=='java' |
                   by_tag_year$tag=='android' |
                   by_tag_year$tag=='python' | 
                   by_tag_year$tag=='php' |
                   by_tag_year$tag=='c#',]

#Visualising the data
ggplot(best,aes(x=year,y=fraction,color=tag))+geom_line()

