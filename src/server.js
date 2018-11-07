const express = require('express');
const path = require('path');

const port = process.env.PORT || 8000;
const publicPath = '/';

const websiteDir = path.join(__dirname,'src/website');
const app = express();

app.use(publicPath, express.static(websiteDir));

app.listen(port, function(){
    console.log('App listening on port: ${port}');
});