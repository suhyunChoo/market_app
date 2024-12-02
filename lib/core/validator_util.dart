class ValidatorUtil {
  
  //static으로 선언하면 클래스 생성하지 않아도 사용 가능!
  static String? ValidatorId(String? value){
    if(value?.trim().isEmpty?? true){
      return "아이디를 입력해주세요";
    }
    if(value!.length<2){
      return "아이디는 2글자 이상이어야 합니다.";
    }
    return null;
  }
  static String? ValidatorNickname(String? value){
    if(value?.trim().isEmpty?? true){
      return "닉네임을 입력해주세요";
    }
    if(value!.length<2){
      return "닉네임은 2글자 이상이어야 합니다.";
    }
    return null;
  }
  static String? ValidatorPassword(String? value){
    if(value?.trim().isEmpty?? true){
      return "비밀번호를 입력해주세요";
    }
    if(value!.length<2){
      return "비밀번호는 2글자 이상이어야 합니다.";
    }
    return null;
  }
}