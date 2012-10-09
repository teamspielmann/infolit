class Teacher < ActiveRecord::Base
  attr_accessible :age, :comp_work, :formal_training, :gender, :informal_training, :other_sources_student, :personal_use, :professional_use, :subject, :training_needs, :school, :eight1, :eight2, :eight3, :eight4, :eight5, :eight6, :eight7, :eight8, :nine1, :nine2, :nine3, :nine4, :nine5, :ten1, :ten2, :ten3, :ten4, :ten5, :ten6, :eleven1, :eleven2, :eleven3, :eleven4, :eleven5, :eleven6
   SCHOOL =["Chebisaas", "Moi Girls", "South Island School"]
   GENDER = ["male","female"]
   AGE =["20-25","26-30", "31-35", "36-40", "35-40", "40+"]
   SUBJECT = ["ICT","Language", "Mathematics", "Science", "Social Science", "Other" ]

end
