const registerBtn = document.querySelector("#loginbtn");

registerBtn.addEventListener("click", handleLogin);



function handleLogin(e){

    e.preventDefault();

    const username = document.querySelector("#username").value;

    const password = document.querySelector("#password").value;

    const userObj = {
       
        username: username,
        password: password
    };

    sendData(userObj);
}

function sendData(userObj){
    try {
        
        const url = "http://localhost:3001/api/login";
        const options = {
            method: "POST",
            body: JSON.stringify(userObj),
            headers: {
                "Content-Type": "application/json"
            }
        }
        
        fetch(url, options)
        .then((response) =>{
            return response.json();
        })
        .then((data) =>{
                console.log(data.msg);
    
                localStorage.setItem("user",JSON.stringify(data.user));
                localStorage.setItem("accessToken",data.accessToken);
    
                window.location.replace("http://localhost:3001/dashboard");
           
                alert(data.msg)
        
        });
    } catch (error) {
        console.log(error)
    }

}