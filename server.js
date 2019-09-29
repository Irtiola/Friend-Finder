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
    res.render('pages/home');
})

//survey page
app.get("/survey", function (req, res) {
    res.render('pages/survey');

})

app.get("/questions", function (req, res) {
    connection.query("SELECT * FROM question", function (err, response) {
        console.log(response);

        if (err) res.send(err)
        else res.json(response);
        console.log(response);
    })
})
app.get('/api/friends', function (req, res) {
    connection.query('SELECT f.f_name, f.picture_link, GROUP_CONCAT(s.score) AS scores FROM scores s JOIN friends f  USING(f_id) GROUP BY f_id',
        function (error, response) {
            if (error) res.send(error);
            else res.json(res)
        })
});
app.post('/insert', function (req, res) {
    connection.query("INSERT INTO friends(f_name, picture_link) VALUES (' ? ',' ? ')", [req.body.f_name, req.body.picture_link], function (err, resp) {

    })
});


//create server
app.listen(3000, function () {
    console.log("Server runs");
})