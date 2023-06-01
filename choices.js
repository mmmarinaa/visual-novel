var express = require('express');
var app = express();
var {getNextDialogueByChoice } = require('./db.js');

app.use(express.urlencoded({ extended: true }));

