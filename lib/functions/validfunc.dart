
const String messageInputEmpty = "can't be empty";
const String messageInputMin = "can't be less than ";
const String messageInputMax = "can't be more than ";


validInput (String val , int min , int max){

 if (val.isEmpty) {
    return messageInputEmpty;
  }
 
  if (val.length>max){
    return "$messageInputMax $max";
  }
  if (val.length<min){
    return "$messageInputMin $min";
  }


}

  validemailInput (String val , int min , int max){
  String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  
  RegExp regexpemail = RegExp(patternEmail);
  bool isemail = regexpemail.hasMatch(val);
  if(!isemail){
    return "please add a correct email";
  }
  
 if (val.isEmpty) {
    return messageInputEmpty;
  }
 
  if (val.length>max){
    return "$messageInputMax $max";
  }
  if (val.length<min){
    return "$messageInputMin $min";
  }




}