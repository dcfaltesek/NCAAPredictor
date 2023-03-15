#2023 updated method for NCAA game selection

data_split <- optimus %>%
  initial_split(prop = .8)

training_data <- training(data_split)
validation_data <- testing(data_split)


rec <- recipe(outcome ~ SOS...14 + SOS...164+X3P....34+X3P....184, data = training_data) %>%
  step_naomit() %>% 
  prep() 

train_data<-juice(rec)

#converter code
train_data<-mutate_all(train_data, function(x) as.numeric(as.character(x)))
train_data<-mutate(train_data, outcome = as.factor(outcome))

val_data <- bake(rec, new_data = validation_data)
val_data<-mutate_all(val_data, function(x) as.numeric(as.character(x)))
val_data<-mutate(val_data, outcome = as.factor(outcome))


val_data<-val_data[complete.cases(val_data),]

library(parsnip)
#run the random forest
is5<-rand_forest("classification") %>%
  set_engine("randomForest") %>%
  fit(outcome ~ ., data = train_data) %>%
  predict(new_data = val_data)%>%
  mutate(truth = val_data$outcome)

library(ggplot2)
#now plot that
ggplot(is5, aes(as.numeric(.pred_class), as.numeric(truth), colour=as.numeric(.pred_class)-as.numeric(truth)))+geom_jitter()+theme_classic()+theme(axis.text.x = element_text(angle = 45))

is5$truth == is5$.pred_class
data.frame(is5) %>% 
  mutate(x=.pred_class==truth) %>% 
  count(x)


gamez_data <- bake(rec, new_data = primal)

is6<-rand_forest("classification") %>%
  set_engine("randomForest") %>%
  fit(outcome ~ ., data = train_data) %>%
  predict(new_data = gamez_data)

is6
View(is6)


SOS...14 + SOS...8.1+SRS...163+SRS...13+TS....108+TRB....109+TS....258+TRB....259

ORtg...105+ORtg...255+Pace...254+Pace...104+ ORB...38 + ORB....115+TOV....114+TOV....264+FT.FGA...266+FT.FGA...116+
  X3PAr...107+X3PAr...257+eFG....297+eFG....147+FT.FGA...116+FT.FGA...266+ORtg...289+ORtg...139


#big model
SOS...164+SOS...14+ORB....115+ORB....265+eFG....297+eFG....147+FT.FGA...116+FT.FGA...266+ORtg...289+ORtg...139+ORtg...105+ORtg...255+Pace...254+Pace...104+ ORB...38 + ORB....115+TOV....114+TOV....264+FT.FGA...266+FT.FGA...116+
  X3PAr...107+X3PAr...257+eFG....297+eFG....147+FT.FGA...116+FT.FGA...266+ORtg...289+ORtg...139