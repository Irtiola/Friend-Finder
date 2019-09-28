const express = require("express");
const app = express();
app.set("view engine", "ejs");

//add dotenv package for hiding private data
require("dotenv").config();
const keys = require("./keys.js");

//path package
const path = require("path");

//mysql package
const mysql = require("mysql");

//create array with friends
var friends = [];

//hiding private data 
const connection = mysql.createConnection(keys.data);

var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: true }));

// Creates the connection with the server and loads the product data upon a successful connection
connection.connect(function (err) {
    if (err) {
        console.error("error connecting: " + err.stack);
    }
    console.log("DB connected");
});

//route to homepage
app.get("/", function (req, res) {
    res.sendFile(path.join(__dirname, 'public/home.html'));
})

//survey page
app.get("/survey", function (req, res) {
    res.sendFile(path.join(__dirname, 'public/survey.html'));
})



//create server
app.listen(3000, function () {
    console.log("Server runs");
})