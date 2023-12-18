require('dotenv').config();

const bcrypt = require('bcrypt');
const db = require('../config/dbConnection')
const jwt = require('jsonwebtoken');



const userRegistration = async (req, res) => {
    let conn; // Declare the connection variable outside the try-catch block.

    try {
        conn = await db.getConnection();
        console.log(req)
        

        // Check if the username is already in use
        const [existingUser] = await conn.query(
            `SELECT * FROM users WHERE LOWER(username) = LOWER(?);`,
            [req.body.username]
        );
        console.log(existingUser.length)
        if (existingUser.length) {
            return res.status(401).json({
                msg: 'This Username is already in Use!'
            });
        }else{
            // Hash the password
            const hashedPassword = await bcrypt.hash(req.body.password, 10);
    
            // Insert the new user into the database
            const newUserResult = await conn.query(
                `INSERT INTO users (profilepic,username, password, created) VALUES (?,?, ?, NOW());`,
                [`images/${req.files.profilePicture[0].originalname}`,req.body.username, hashedPassword]
            );
    
            // Insert the user's password into the savepasswords table
            await conn.query(
                `INSERT INTO savepasswords (user_id, last_password, created) VALUES (?, ?, NOW());`,
                [newUserResult[0].insertId, req.body.password]
            );
    
            return res.status(200).json({
                msg: 'The user has been registered with us!'
            });
        }

    } catch (error) {
        console.error(error);
        return res.status(500).json({
            msg: 'Internal Server Error'
        });
    } finally {
        if (conn) {
            conn.release();
        }
    }
};
const login = async (req, res) => {
    let conn;

    try {
        conn = await db.getConnection();

        const [user] = await conn.query(
        'SELECT id, profilepic, username, password FROM users WHERE username = ?;',
            [req.body.username]
        );
        console.log(user)

        if (!user) {
            return res.status(401).json({
                msg: 'Email or Password is incorrect'
            });
        }

        const hashedPassword = user[0].password; // Retrieve hashed password from the database

        if (!hashedPassword) {
            return res.status(500).json({
                msg: 'Internal Server Error: User password not found'
            });
        }

        const passwordMatch = await bcrypt.compare(req.body.password, hashedPassword);

        if (!passwordMatch) {
            return res.status(401).json({
                msg: 'Email or Password is incorrect'
            });
        }

        const accessToken = generateAccessToken(user);

        return res.status(200).json({
            msg: 'Logged in',
            accessToken: accessToken,
            user: {
                id: user[0].id,
                profilepic:user[0].profilepic,
                username: user[0].username,
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            msg: 'Internal Server Error'
        });
    } finally {
        if (conn) {
            conn.release();
        }
    }
};

const generateAccessToken = (user)=>{
    return jwt.sign({ id: user[0].id },process.env.ACCESS_TOKEN,{
        expiresIn:'7d'
    })
}


module.exports ={
    userRegistration,
    login,
    
}
