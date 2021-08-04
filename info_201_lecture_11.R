#https://perso.telecom-paristech.fr/eagan/class/igr204/data/cereal.csv

url <- 'https://perso.telecom-paristech.fr/eagan/class/igr204/data/cereal.csv'
cereal <- read.csv(url, sep = ';')
cereal <- cereal[-1,]


sugar_vals_piped <- cereal %>%
                    select(name, sugars) %>%
                    mutate(sugars_num = as.numeric(sugars)) %>%
                    filter(sugars_num >= 0) %>%
                    arrange(-sugars_num, name)

summary_piped <- sugar_vals_piped %>%
                 summarize(avg_sugars = mean(sugars_num),
                          min_sugars = min(sugars_num),
                          max_sugars = max(sugars_num))

max_sugars <- max(sugar_vals_piped$sugars_num)
min_sugars <- min(sugar_vals_piped$sugars_num)

max_row_name_piped <- sugar_vals_piped %>%
                      filter(sugars_num == max(sugars_num)) %>%
                      pull(name)

min_row_name_piped <- sugar_vals_piped %>%
                      filter(sugars_num == min(sugars_num)) %>%
                      pull(name)
