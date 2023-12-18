require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const db = require('./config/dbConnection.js');
const userRoute = require('./router/userRoute.js');
const app = express();
const http = require('http').createServer(app)
const io = require('socket.io')(http); // Add this line
const cors = require('cors');

app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));
app.use(cors());

app.use(express.static("frontend"));

// Define a route to handle the root URL

app.get('/', (req, res) => {
    res.sendFile(__dirname + "/frontend/index.html");
});

app.get('/register', (req, res) => {
    // Send the "index.html" file as the response
    res.sendFile(__dirname + "/frontend/registration.html");
});

app.use(express.static("frontend/chatroom"));

app.get('/dashboard', (req, res) => {
    // Send the "index.html" file as the response
    res.sendFile(__dirname + "/frontend/chatroom/dashboard.html");
});
app.use(express.static("frontend/chatroom"));

app.get('/chatRoom/:room_id', (req, res) => {
    // Send the "index.html" file as the response
    res.sendFile(__dirname + "/frontend/chatroom/chatRoom.html");
});

app.use('/api', userRoute);
app.use('/api/uploads', express.static('public'));

app.use((err, req, res, next) => {
    err.statusCode = err.statusCode || 500;
    err.message = err.message || 'Internal Server Error';
    res.status(err.statusCode).json({
        message: err.message,
    });
});




io.on('connection', async(socket) => {
    let conn;
    conn = await db.getConnection();
    socket.on('join-room',async(data)=>{
        socket.join(data.room_id);
        const [myrooms] = await conn.query('SELECT * FROM rooms WHERE room_id =?',[data.room_id]);
        console.log(`You joined room: ${data.room_id}`);
        const [users] = await conn.query('SELECT * FROM users WHERE id =?',[data.users_id]);
        const formdata = {
            users_id:users[0].id,
            username:users[0].username
        }
        const [room] = await conn.query('SELECT * FROM myrooms WHERE room_id =?',[data.room_id])
        console.log(myrooms)
        if(room.length>0){
            io.to(data.room_id).emit('user-joined',formdata)
        }else{
            await conn.query('INSERT INTO myrooms(room_id,users_id,room_name)VALUES(?,?,?)',[data.room_id,data.users_id,myrooms[0].room_name])
            io.to(data.room_id).emit('user-joined',formdata)
        }
    })
    socket.on('send-message', async(data) => {
        await conn.query('INSERT INTO messages(users_id,room_id,message,created)VALUES(?,?,?,now())',[data.users_id,data.room_id,data.message])
        const [response] = await conn.query('SELECT * FROM users WHERE id = ?',[data.users_id])
        const formdata = {
            profilepic:response[0].profilepic,
            username:response[0].username,
            users_id:data.users_id,
            room_id:data.room_id,
            message:data.message
        }
        io.to(data.room_id).emit('chat-message',formdata);

    });



    socket.on('disconnect', () => {
        console.log('User disconnected');
      });
});

http.listen(3001, () => {
    console.log('Server is running on port 3001');
});
