const getuser = localStorage.getItem('user')
const user = JSON.parse(getuser);
const getToken = localStorage.getItem('accessToken')

const socket = io()

const currentURL = window.location.href;

// Split the URL by '/'
const parts = currentURL.split('/');

// Extract the parameter from the last part of the URL
const parameter = parts[parts.length - 1];
const sendButton = document.querySelector('#sendbtn');

sendButton.addEventListener('click',sendMessage)

document.addEventListener('DOMContentLoaded', function () {
    getMyRoomName();
    getConvo();
    const data ={
        room_id:parameter,
        users_id:user.id,
    }
    socket.emit('join-room',data)
    alert('You Joined')
});
socket.on('user-joined',function(data){
    console.log(data)
    userJoined(data)
})
socket.on('chat-message',function(data){
    console.log(data)
    appendMessage(data)
})

function getMyRoomName() {
    console.log(parameter)
    const formData = {
        room_id:parameter
    }
    sendgetMyRoomData(formData)
}
function sendgetMyRoomData(formData){
    const roomName = document.querySelector('#roomName')
    try {
        const url = 'http://localhost:3001/api/getMyRoom'
        const options = {
            method: "POST",
            body: JSON.stringify(formData),
            headers:{
                'Authorization': `Bearer ${getToken}`,
                'Content-Type': 'application/json'
            }
        }
        fetch(url,options)
        .then((response)=>response.json())
        .then((data)=>{
            const room = data.Myroom
            roomName.innerHTML = `<h1 style="text-alight:center;">${room.room_name}</h1><button id="exit-btn">Exit</button>`

            const exitbtn = document.querySelector('#exit-btn')
            exitbtn.addEventListener('click',exit)
        })
    } catch (error) {
        console.log(error)
    }
}
function getConvo(){
    const formData = {
        room_id:parameter
    }
    sendGetConvoMessage(formData)
}
function sendGetConvoMessage(formData){
    const messagesParent = document.querySelector('#messages');
    messagesParent.innerHTML = ''
    try {
        const url = 'http://localhost:3001/api/getRoomConvo'
        const options = {
            method: "POST",
            body: JSON.stringify(formData),
            headers:{
                'Authorization': `Bearer ${getToken}`,
                'Content-Type': 'application/json'
            }
        }
        fetch(url,options)
        .then((response)=>response.json())
        .then((data)=>{
            const convo = data.convo
            console.log(convo)
            convo.forEach(data=>{
                const messagesChild = document.createElement('li');
                const createMessageChild = document.createElement('div');
                
                if (data.users_id == user.id) {
                    createMessageChild.innerHTML = `
                    <p style="background-color:#0066ff;text-align:end;width:auto; color:white;">${data.message}</p>
                `;
                }else {
                    createMessageChild.innerHTML = `
                        <h5 class="profile">
                            <img src="http://localhost:3001/api/uploads/${data.profilepic}" style="height:50px; width:50px;" alt="Profile Picture" class="profile-image"/>
                            ${data.username}
                        </h5>
                        <p class="message-content">${data.message}</p>
                        `;
                }
            
                messagesChild.appendChild(createMessageChild);
                messagesParent.appendChild(messagesChild);
            })
        })
    } catch (error) {
        console.log(error)
    }
}
function sendMessage(){
    const messageInput = document.querySelector('#message').value;
    const formData = {
        room_id:parameter,
        users_id:parseInt(user.id),
        message:messageInput
    }
    socket.emit('send-message',formData);
    clearMessageInput();
}
function appendMessage(data) {
    const messagesParent = document.querySelector('#messages');
    const messagesChild = document.createElement('li');
    const createMessageChild = document.createElement('div');

    // Use classes for styling instead of inline styles
    createMessageChild.classList.add('message-container');
    if(data.users_id != parseInt(user.id)){
        createMessageChild.innerHTML = `
            <h5 class="profile">
                <img src="http://localhost:3001/api/uploads/${data.profilepic}" style="height:50px; width:50px;" alt="Profile Picture" class="profile-image"/>
                ${data.username}
            </h5>
            <p class="message-content">${data.message}</p>
        `;
    }else{
        createMessageChild.innerHTML = `
                    <p style="background-color:#0066ff;text-align:end;width:auto; color:white;">${data.message}</p>
                `;
    }

    messagesChild.appendChild(createMessageChild);
    messagesParent.appendChild(messagesChild);
}
function userJoined(data) {
    const messagesParent = document.querySelector('#messages');
    const messagesChild = document.createElement('li');
    const createMessageChild = document.createElement('div');
    createMessageChild.classList.add('message-container');

    const messageContent = `<p style="text-align: center;">${data.username} has joined the chat</p>`;
    createMessageChild.innerHTML = messageContent;

    messagesChild.appendChild(createMessageChild);
    messagesParent.appendChild(messagesChild);
    
    // Assuming you want to clear the input field when a user joins
    clearMessageInput();
}

function clearMessageInput() {
    const messageInput = document.querySelector('#message');
    messageInput.value = '';
}
function exit(){
    window.location.replace('http://localhost:3001/dashboard')
}



