// Required modules to run the server: 
//    - Express: framework in order to develop minimalist webpages applications
//    - Body parser: in order to access to body variables from the HTML code

const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql')

// create the app object which manage the whole application
const app = express();

// template engine to render the pages
app.set('view engine', 'ejs')

// path to obtain the .ejs files for the HTML
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));

// Some variables 
var PORT = 3000

// endpoints
var LOGIN = '/login'
var INDEX = '/'

// html files
var LOGIN_HTML = 'login'
var INDEX_HTML = 'index'

// Enpoints an action for the services

// /login Endpoint
// GET 
app.get(LOGIN, function (req, res) {
    res.render(LOGIN_HTML);
})

// POST 
app.post(LOGIN, function (req, res) {
    // we obtain this from html from tag: name in input
    //console.log(req.body.city)
    //let cityTyped = req.body.city;
    // then we pass the information to the front in a dictionary way (parserbody things)
    // we have to manage this variables in the frontend 
    res.render(INDEX_HTML);
})

// / endpoint
// GET 
app.get(INDEX, function (req, res) {
    res.render(INDEX_HTML);
})

// runner for the server
app.listen(PORT, function () {
    console.log('Server listening in: http://localhost:' + PORT)
})