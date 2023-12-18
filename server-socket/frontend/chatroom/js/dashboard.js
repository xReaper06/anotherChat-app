const getuser = localStorage.getItem('user')
const user = JSON.parse(getuser);
const getToken = localStorage.getItem('accessToken')
const search = document.querySelector('#search')

const profilepic = document.querySelector('#profile-info')
const createRoom = document.querySelector('#createRoom-btn')

createRoom.addEventListener('click',createroom)


document.addEventListener('DOMContentLoaded', function() {
    profilepic.innerHTML = `<img src="http://localhost:3001/api/uploads/${user.profilepic}" style="height:100px; width:100px;"/> 
    <p>${user.username}</p><br>
    <button type="button" id="logout-btn">Logout</button>`
    const logoutbtn = document.querySelector('#logout-btn')
    logoutbtn.addEventListener('click',sendlogoutData)
    
    search.addEventListener('input', function(){
        const searchValue = this.value.toLowerCase();
        
    
        const url = "http://localhost:3001/api/getAllRooms";
        const options = {
            method: "GET",
            headers:{
                'Authorization': `Bearer ${getToken}`,
                'Content-Type': 'application/json',
            }
        }
    
        fetch(url,options)
        .then((response) => 
            response.json()
            )
        .then((data) => {
            console.log(data)
            const rooms = data.Allrooms;
    
            // Filter rooms based on the search value
            const filteredRooms = rooms.filter(room =>
                room.room_name.toLowerCase().includes(searchValue)
            );
    
            // Update the UI with the filtered rooms
            displayRooms(filteredRooms);
        })
        .catch(error => console.error('Error:', error));
    
    })
    getMyRoom();
});
function getMyRoom(){
    const formData = {
        users_id:parseInt(user.id)
    }
    sendRoomData(formData)
}
function displayRooms(rooms) {
    const itemsContainer = document.querySelector('#room-list');
    
    // Clear the existing items in the container
    itemsContainer.innerHTML = '';

    // Create and append new list items for each room
    rooms.forEach(room => {
        const listItem = document.createElement('li');
        listItem.classList.add('room-item');
        
        const button = document.createElement('button');
        button.type = 'button';
        button.textContent = 'Join';
        button.classList.add('join-btn');
        
        listItem.textContent = room.room_name;
        listItem.appendChild(button);
        
        itemsContainer.appendChild(listItem);

        // Use querySelector on listItem to find the join button within this specific room
        const joinbtn = listItem.querySelector('.join-btn');

        joinbtn.addEventListener('click', function() {
            joinRoom(room);
        });
    });
}
async function sendRoomData(formData){
    const myRoom = document.querySelector('#myRooms')
    myRoom.innerHTML = '';
    try {
        const url = 'http://localhost:3001/api/getRoom'
        const options = {
            method: "POST",
            body: JSON.stringify(formData),
            headers:{
                'Authorization': `Bearer ${getToken}`,
                'Content-Type': 'application/json'
            }
        }
        await fetch(url,options)
        .then((response)=>response.json())
        .then((data)=>{
            const rooms = data.rooms
            rooms.forEach(room =>{
                console.log(room)
                const myRoomLI = document.createElement('li')
                myRoomLI.classList.add('room-item');
                const button = document.createElement('button');
                button.type = 'button';
                button.textContent = 'Join';
                button.classList.add('join-btn');
                myRoomLI.textContent = room.room_name
                myRoomLI.appendChild(button)
                myRoom.appendChild(myRoomLI)

                const joinbtn = myRoomLI.querySelector('.join-btn');

                joinbtn.addEventListener('click', function() {
                    joinRoom(room);
                });
            })
        })
    } catch (error) {
        console.log(error)
    }
}
async function sendlogoutData(formData){
    localStorage.removeItem('user');
    localStorage.removeItem('accessToken');
    window.location.replace('http://localhost:3001/')
}

async function sendCreateroomData(formData){
    const myRoom = document.querySelector('#myRooms')
    myRoom.innerHTML = '';
    try {
        const url = 'http://localhost:3001/api/create-room'
        const options = {
            method: "POST",
            body: JSON.stringify(formData),
            headers:{
                'Authorization': `Bearer ${getToken}`,
                'Content-Type': 'application/json'
            }
        }
        await fetch(url,options)
        .then((response)=>response.json())
        .then((data)=>{
            const room = data.room
                console.log(room)
                const myRoomLI = document.createElement('li')
                myRoomLI.classList.add('room-item');
                const button = document.createElement('button');
                button.type = 'button';
                button.textContent = 'Join';
                button.classList.add('join-btn');
                myRoomLI.textContent = room.room_name
                myRoomLI.appendChild(button)
                myRoom.appendChild(myRoomLI)

                const joinbtn = myRoomLI.querySelector('.join-btn');

                joinbtn.addEventListener('click', function() {
                    joinRoom(room);
                });
        })
    } catch (error) {
        console.log(error)
    }
}



function joinRoom(room){
    window.location.replace(`http://localhost:3001/chatRoom/${room.room_id}`);

}
function createroom(e){
    e.preventDefault
    const inputRoom = document.querySelector('#new-room').value

    const formData = {
        users_id:parseInt(user.id),
        room_name:inputRoom
    }
    sendCreateroomData(formData)
}