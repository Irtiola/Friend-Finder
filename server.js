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
const connection = mysql.createConnection(process.env.JAWSDB_URL || keys.data);

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
    connection.query("SELECT * FROM question", function (err, result) {
        res.render('pages/survey', { res: result });
    })
})

app.post('/api/friends', function (req, res) {
    var name = req.body.f_name;
    var link = req.body.picture_link;
    var scores = [
        parseInt(req.body.question1),
        parseInt(req.body.question2),
        parseInt(req.body.question3),
        parseInt(req.body.question4),
        parseInt(req.body.question5),
        parseInt(req.body.question6),
        parseInt(req.body.question7),
        parseInt(req.body.question8),
        parseInt(req.body.question9),
        parseInt(req.body.question10),
    ];

    // updating database with new user
    connection.query("INSERT INTO friends(f_name, picture_link) VALUES (?, ?)", [name, link], function (err, res) {
        takeNewFriendId(name, link);
        console.log(name + link);
    });

    // take new user's id
    function takeNewFriendId(str, link) {
        connection.query("SELECT f_id FROM friends WHERE f_name = ? AND picture_link=?", [str, link], function (err, res) {
            insertScores(res[0].f_id);
        });
    };

    // updating database with new user's answers
    function insertScores(num) {
        connection.query("INSERT INTO scores (f_id, q_id, score) VALUES (?,1,?), (?,2,?), (?,3,?), (?,4,?), (?,5,?), (?,6,?), (?,7,?), (?,8,?), (?,9,?), (?,10,?)", [num, scores[0], num, scores[1], num, scores[2], num, scores[3], num, scores[4], num, scores[5], num, scores[6], num, scores[7], num, scores[8], num, scores[9]], function (err, res) {
            takeDiff(num);
        });
    };

});


//create server
app.listen(process.env.PORT || 3000, function () {
    console.log("Server runs");
})