function checkForm() {
    var username = document.getElementById("UserID");//获取username那个div
    var username_feedback = document.getElementById("username-feedback");
    var nickname = document.getElementById("UserName");//获取username那个div
    var nickname_feedback = document.getElementById("nickname-feedback");
    var userpswd1 = document.getElementById("UserPassword");//获取username那个div
    var userpswd1_feedback = document.getElementById("userpswd1-feedback");
    var userpswd2 = document.getElementById("UserPasswordCon");//获取username那个div
    var userpswd2_feedback = document.getElementById("userpswd2-feedback");
    var userphone = document.getElementById("UserPhone");//获取username那个div
    var userphone_feedback = document.getElementById("userphone-feedback");
    var useremail = document.getElementById("UserEmail");//获取username那个div
    var useremail_feedback = document.getElementById("useremail-feedback");

    //不能为空
    if(username.value==""){
        username_feedback.innerHTML = "User ID is empty！";//修改username-feedback div中的内容
        username.classList.remove("is-valid");//清除合法状态
        username.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    else {
        if (verify()){
            username_feedback.innerHTML = "User ID is already exist！";//修改username-feedback div中的内容
            username.classList.remove("is-valid");//清除合法状态
            username.classList.add("is-invalid");//添加非法状态
            return false;//onsubmit  return false阻止表单提交
        }
    }
    username.classList.remove("is-invalid");
    username.classList.add("is-valid");
    username_feedback.innerHTML="";
    if(nickname.value==""){
        nickname_feedback.innerHTML = "User Name is empty！";//修改username-feedback div中的内容
        nickname.classList.remove("is-valid");//清除合法状态
        nickname.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    nickname.classList.remove("is-invalid");
    nickname.classList.add("is-valid");
    nickname_feedback.innerHTML="";
    if(userpswd1.value==""){
        userpswd1_feedback.innerHTML = "Password is empty！";//修改username-feedback div中的内容
        userpswd1.classList.remove("is-valid");//清除合法状态
        userpswd1.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    userpswd1.classList.remove("is-invalid");
    userpswd1.classList.add("is-valid");
    userpswd1_feedback.innerHTML="";
    if(userpswd1.value!=userpswd2.value){
        userpswd2_feedback.innerHTML = "The password is not confirmed!";//修改username-feedback div中的内容
        userpswd2.classList.remove("is-valid");//清除合法状态
        userpswd2.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    //清除错误提示，改成成功提示

    userpswd2.classList.remove("is-invalid");
    userpswd2.classList.add("is-valid");
    userpswd2_feedback.innerHTML="";

    if (userphone.value==""){
        userphone_feedback.innerHTML = "Phone number is empty！";//修改username-feedback div中的内容
        userphone.classList.remove("is-valid");//清除合法状态
        userphone.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    userphone.classList.remove("is-invalid");
    userphone.classList.add("is-valid");
    userphone_feedback.innerHTML="";

    if (useremail.value==""){
        useremail_feedback.innerHTML = "Email address is empty！";//修改username-feedback div中的内容
        useremail.classList.remove("is-valid");//清除合法状态
        useremail.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    useremail.classList.remove("is-invalid");
    useremail.classList.add("is-valid");
    useremail_feedback.innerHTML="";
    return true;
}
function verify(){
    //get the content of userID
    var rs;
    $.ajax({
        type : "get",
        url : "./checkSUID",
        async : false,
        data:{'SignUpID':$("#UserID").val()},
        success : function(result){

            if(result.toString()=="OK"){
                rs = false;
            }else {
                rs = true;
            }
        }
    });
    return rs;
}
function checkFormofLogin() {
    var username = document.getElementById("UserID");//获取username那个div
    var username_feedback = document.getElementById("username-feedback");
    var userpswd1 = document.getElementById("UserPassword");//获取username那个div
    var userpswd1_feedback = document.getElementById("userpswd1-feedback");


    //不能为空
    if(username.value==""){
        username_feedback.innerHTML = "User ID is empty！";//修改username-feedback div中的内容
        username.classList.remove("is-valid");//清除合法状态
        username.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }

    username.classList.remove("is-invalid");
    username.classList.add("is-valid");
    username_feedback.innerHTML="";
    if(userpswd1.value==""){
        userpswd1_feedback.innerHTML = "Password is empty！";//修改username-feedback div中的内容
        userpswd1.classList.remove("is-valid");//清除合法状态
        userpswd1.classList.add("is-invalid");//添加非法状态
        return false;//onsubmit  return false阻止表单提交
    }
    else {
        if (verifyPass()){
            userpswd1_feedback.innerHTML = "Wrong password";//修改username-feedback div中的内容
            userpswd1.classList.remove("is-valid");//清除合法状态
            userpswd1.classList.add("is-invalid");//添加非法状态
            return false;//onsubmit  return false阻止表单提交
        }
    }
    userpswd1.classList.remove("is-invalid");
    userpswd1.classList.add("is-valid");
    userpswd1_feedback.innerHTML="";



    return true;
}
function verifyPass(){
    //get the content of userID
    var rs;
    $.ajax({
        type : "post",
        url : "./verifyPass",
        async : false,
        data:{'UserID':$("#UserID").val(),'UserPassword':$("#UserPassword").val()},
        success : function(result){

            if(result.toString()=="OK"){
                rs = false;
            }else {
                rs = true;
            }
        }
    });
    return rs;
}
