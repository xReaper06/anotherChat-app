
const registerBtn = document.querySelector("#registerbtn");

registerBtn.addEventListener("click", handleRegister);



function handleRegister(e){
    e.preventDefault();
    console.log('clicked')
    
    const fileInput = document.getElementById('profilePic');
    const file = fileInput.files[0];
    const username = document.querySelector("#username").value;
    
    const confirm_password = document.querySelector("#confirmpassword").value;
    
    const password = document.querySelector("#password").value;
    if(confirm_password != password){
        alert('Password is not the Same')
    }else{
        const formData = new FormData();
        formData.append('profilePicture',file);
        formData.append('username',username)
        formData.append('password',password)
        sendData(formData);
    }
}


function sendData(formData){
    try {
        const url = "http://localhost:3001/api/userRegistration";
        const options = {
            method: "POST",
            body:formData,
        }
        
        fetch(url, options)
        .then((response) =>{
            return response.json();
        })
        .then((data) =>{
           console.log(data.message);
           window.location.replace("http://localhost:3001/");
        
        });
    } catch (error) {
        console.log(error)
    }
}