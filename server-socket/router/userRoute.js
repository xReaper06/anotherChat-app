const express = require('express');
const Router = express.Router();
const TokenValidity = require('../middleware/tokenValidity')
const userController = require('../controllers/userController');
const authController = require('../controllers/authController');
const path = require('path')
const multer = require('multer')

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, '../server-socket/public/images'); // Adjust the destination folder as needed
    },
    filename: function (req, file, cb) {
      cb(null,file.originalname);
    },
  });
  const fileFilter = (req, file, cb) => {
    if (
      file.mimetype === 'image/jpeg' ||
      file.mimetype === 'image/jpg' ||
      file.mimetype === 'image/png'
    ) {
      cb(null, true);
    } else {
      cb(null, false);
    }
  };

  const upload = multer({ storage: storage, fileFilter: fileFilter });



Router.post('/userRegistration',upload.fields([
  {name:'profilePicture', maxCount:1},
]), authController.userRegistration);
Router.post('/login', authController.login);


Router.post('/getRoom',TokenValidity.verifyToken,userController.getRooms);
Router.post('/getRoomConvo',TokenValidity.verifyToken,userController.getRoomConvo);
Router.post('/create-room',TokenValidity.verifyToken,userController.storeRoom);
Router.post('/getMyRoom',TokenValidity.verifyToken,userController.getMyRoom);
Router.get('/getAllUsers',TokenValidity.verifyToken,userController.getAllUsers);
Router.get('/getAllRooms',TokenValidity.verifyToken,userController.getAllRooms);



module.exports = Router