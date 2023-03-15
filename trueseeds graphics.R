trueseeds23 %>% 
  filter(NET<100) %>% 
  ggplot(aes(NET, Actual, colour=Snake-Actual))+geom_text_repel(aes(label=School))


trueseeds23 %>% 
  filter(NET<100) %>% 
  ggplot(aes(NET, Actual, colour=Conference))+geom_point()+geom_abline(intercept = 0, slope = .25)


trueseeds23b<-trueseeds23 %>% 
  filter(Actual<20) %>% 
  mutate(Difference=Snake-Actual)
View(trueseeds23b)
