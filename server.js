const express = require('express');
const initDB = require('./config/db'); //conexion segura de mongoDB
const bodyParser = require('body-parser');
const path = require('path');

//instanciar express
const app = express();

//seleccionar puerto
const port = 3001;

//habilitar HTML
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

//Carpeta de visitas
app.set('views', path.join(__dirname, './app/views'));

const atraccionRouters = require('./app/routes/atraccion');
const homeRouters = require('./app/routes/home');

app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({extended: true}));

app.use(atraccionRouters);
app.use(homeRouters);

app.listen(port, () => {
    console.log(`La aplicaccion esta en linea en el puerto  ${port}`);
})

initDB(); //inicializar la base de datos