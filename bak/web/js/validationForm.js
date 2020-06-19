function formValidation(){
    var name = document.form.name.value;
    var email = document.form.email.value;
    var username = document.form.username.value;
    var password = document.form.password.value;
    var confPassword = document.form.confPassword.value;
    
    if (name === null || name === "") {
        alert("Insert your name");
        return false;
    }else if (username === null || username === "") {
        alert("Insert yout username");
        return false;
} else if (email === null || email === "") {
        alert("Must insert Email");
        return false;
    }else if(password.length < 8){
        alert("Password must be at least 8 characters long");
        return false;
}else if (password !== confPassword) {
        alert("Confirm Password");
        return false;
    }
}
