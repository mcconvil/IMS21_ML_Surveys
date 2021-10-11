
## ---- eval = FALSE-----------------------------------------
## install.packages("mase")


## ---- echo = FALSE-----------------------------------------
knitr::include_graphics("img/pdxHexSticker.png")


## ---- message = FALSE, warning = FALSE---------------------
library(tidyverse)
library(pdxTrees)
pop <- get_pdxTrees_parks() %>%
  replace_na(list(Functional_Type = "Unknown")) %>%
  drop_na(DBH, Tree_Height, Condition,
          Functional_Type)
nrow(pop)


## ----------------------------------------------------------
set.seed(44)
samp_SRS <- sample_n(pop, 1000) %>%
  select(DBH, Tree_Height, Condition, Functional_Type) %>%
  mutate(pi = 1000/nrow(pop))


## ----------------------------------------------------------
ggplot(data = samp_SRS, 
       mapping = aes(x = Tree_Height, 
                     y = DBH, 
                     color = Condition,
                     size = 1/pi)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", se = FALSE)


## ----------------------------------------------------------
ggplot(data = samp_SRS, 
       mapping = aes(x = Condition, 
                     y = DBH, 
                     fill = Condition)) +
  geom_boxplot() +
  guides(fill = FALSE)


## ----------------------------------------------------------
ggplot(data = samp_SRS, 
       mapping = aes(x = Functional_Type, 
                     y = DBH, 
                     fill = Functional_Type)) +
  geom_boxplot() +
  guides(fill = FALSE)


## ----------------------------------------------------------
library(mase)

horvitzThompson(y = samp_SRS$DBH,
          pi = samp_SRS$pi, var_est = TRUE)


## ----------------------------------------------------------
xsample <- select(samp_SRS, Condition, Tree_Height) %>%
  as.data.frame()

xpop <- select(pop, names(xsample))

greg(y = samp_SRS$DBH, xsample = xsample, xpop = xpop,
          pi = samp_SRS$pi, var_est = TRUE, datatype = "raw")


## ----------------------------------------------------------
gregElasticNet(y = samp_SRS$DBH, xsample = xsample, xpop = xpop,
          pi = samp_SRS$pi, var_est = TRUE, datatype = "raw")


## ----------------------------------------------------------
xsample <- select(samp_SRS, Functional_Type, Tree_Height) %>%
  mutate(Functional_Type = factor(Functional_Type)) %>%
  as.data.frame() 

xpop <- select(pop, names(xsample)) %>%
  mutate(Functional_Type = factor(Functional_Type)) %>%
  as.data.frame()

est <- gregTree(y = samp_SRS$DBH, xsample = xsample, 
                xpop = xpop, pi = samp_SRS$pi)


## ----------------------------------------------------------
est$tree


## ---- echo = FALSE-----------------------------------------
library(recipes)

xpop <- select(pop, Condition, Tree_Height)

xpop_agg <- recipe(~ Condition + Tree_Height, data = xpop) %>%
  step_dummy(Condition) %>%
  prep(training = xpop) %>%
  bake(new_data = NULL) %>%
  summarise_all(mean)


## ----------------------------------------------------------
xpop_agg


## ----------------------------------------------------------
library(recipes)

xsample <- recipe(~ Condition + Tree_Height, data = samp_SRS) %>%
  step_dummy(Condition) %>%
  prep(training = samp_SRS) %>%
  bake(new_data = NULL) %>%
  as.data.frame()

xsample %>%
  summarise_all(mean)


## ----------------------------------------------------------
greg(y = samp_SRS$DBH, xsample = xsample, xpop = xpop_agg,
          pi = samp_SRS$pi, var_est = TRUE, datatype = "means")


## ----------------------------------------------------------
samp_SRS <- mutate(samp_SRS, B_Type = if_else(Functional_Type %in%
                                      c("BD", "BE"),  1, 0)) 

xsample <- select(samp_SRS, Condition, Tree_Height) %>%
  as.data.frame()

xpop <- select(pop, names(xsample))

greg(y = samp_SRS$B_Type, xsample = xsample, xpop = xpop,
          pi = samp_SRS$pi, var_est = TRUE, datatype = "raw",
     model = "logistic")

