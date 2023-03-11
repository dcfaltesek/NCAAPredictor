return<-function(X){
  colnames(xx23)[2]<-"School"
  O<-str_replace_all(xx23$School, "Southern California", "USC")
  O<-str_replace_all(O, "Louisiana State", "LSU")
  O<-str_replace_all(O, "North Carolina", "UNC")
  O<-str_replace_all(O, "Louisiana State", "LSU")
  O<-str_replace_all(O, "Brigham Young", "BYU")
  O<-str_replace_all(O, "Connecticut", "UConn")
  O<-str_replace_all(O, "Appalachian State", "App. St.")
  O<-str_replace_all(O, "Eastern Washington", "Eastern Wash.")
  O<-str_replace_all(O, "Mount St. Mary's", "Mt. St. Mary's")
  O<-str_replace_all(O, "UC Santa Barbara", "UCSB")
  O<-str_replace_all(O, "Abilene Christian", "Abilene Christ.")
  O<-str_replace_all(O, "Saint Peter's", "St. Peter's")
  O<-str_replace_all(O, "Saint Mary's (CA)", "Saint Mary's")
  O<-str_replace_all(O, "Jacksonville State", "Jacksonville St.")
  O<-str_replace_all(O, "South Dakota State", "S Dakota St.")
  O<-str_replace_all(O, "Texas A&M-Corpus Christi", "Tx AM-CC")
  O<-str_replace_all(O, "New Mexico State", "New Mexico St.")
  O<-str_replace_all(O, "Cal State Fullerton", "Cal St Fullerton")
  rhinox2<-data.frame(xx23, O)
  colnames(X)[3]<-"O"
  colnames(X)[4]<-"V"
  A<-inner_join(new, rhinox2)
  colnames(X)[4]<-"V"
  colnames(X)[3]<-"O"  
  B<-inner_join(new, rhinox2)  
  primal<<-bind_cols(A,B)}