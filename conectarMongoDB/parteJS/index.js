
import mongoose from 'mongoose';
import {getdata} from './api.js';
const { Schema, model } = mongoose;
let uri = 'mongodb://localhost:27017/portaventura2';
//trayendo la data del api
const query = await getdata().then(data=> {
  //console.log(data);
  return data;
}).catch(error => {
  console.log('no va');
  process.exit(0);
});
//console.log(query);
 // conectando a la bd
 const options = {
  autoIndex: false, // Don't build indexes
  maxPoolSize: 10, // Maintain up to 10 socket connections
  serverSelectionTimeoutMS: 5000, // Keep trying to send operations for 5 seconds
  socketTimeoutMS: 45000, // Close sockets after 45 seconds of inactivity
  family: 4 // Use IPv4, skip trying IPv6
};

 mongoose.connect(uri, options).then(
    () => { console.log('se ha conectado exitosamente')
     },
    err => { console.log('no se ha podido conectar');
    process.exit(0);
  });

// definiendo schemas y modelos en mongoose

const areaSchema = new mongoose.Schema({
   id: {type:Number},
    nombre:{type:String},
    descripcion:{type:String},
    fecha_apertura:{type:Date},
    ubicacion:{type:String}
});
const atraccioneSchema = new mongoose.Schema({
  id: {type:Number},
  nombre:{type:String},
  tipo: {type:String},
  altura_minima: {type:mongoose.Types.Decimal128},
  descripcion:{type:String},
  fecha_apertura:{type:Date},
  tiempo_espera_promedio: {type:Number},
  ubicacion:{type:String},
  capacidad:{type:Number},
  estado: {type:String, enum: ['Operativa', 'En Mantenimiento']},
});
const empleadosSchema= new mongoose.Schema({
  id: {type:Number},
  nombre:{type:String},
  apellido:{type:String},
  puesto: {type:String},
  area_trabajo: {type:String},
  fecha_contratacion:{type:Date},
  salario: {type:mongoose.Types.Decimal128},
  estado: {type:String, enum: ['Activo', 'Inactivo']},
  fecha_registro:{type:Date}
});

const espectaculoSchema = new mongoose.Schema({
  id: {type:Number},
  nombre:{type:String},
  descripcion:{type:String},
  hora_inicio: {type:String},
  duracion: {type:Number},
  ubicacion:{type:String}
  });
  
const restauranteSchema = new mongoose.Schema({
  id: {type:Number},
  nombre:{type:String},
  tipo_cocina: {type:String},
  ubicacion:{type:String},
  horarrio_apertura: {type:String},
  horario_cierre: {type:String},
  capacidad:{type:Number}
  });
const visitanteSchema = new mongoose.Schema({
    id: {type:Number},
    nombre:{type:String},
    apellido:{type:String},
    fecha_nacimiento: {type:Date},
    genero: {type:String, enum: ['Masculino', 'Femenino', 'Otro']},
    nacionalidad:{type:String},
    tipo_documento:{type:String},
    numero_documento:{type:String},
    fecha_registro:{type:Date}
  });

const visitaSchema = new mongoose.Schema({
      id: {type:Number},
      id_visitante:{type:Number},
      fecha_visita: {type:Date},
      cantidad_personas:{type:Number},
      monto_total:{type:mongoose.Types.Decimal128},

  });


let areas =new mongoose.model('areas', areaSchema);
let atracciones =new mongoose.model('atracciones', atraccioneSchema);
let empleados =new mongoose.model('empleados', empleadosSchema);
let espectaculos =new mongoose.model('espectaculos', espectaculoSchema);
let restaurantes =new mongoose.model('restaurantes', restauranteSchema);
let visitantes =new mongoose.model('visitantes', visitanteSchema);
let visitas =new mongoose.model('visitas', visitaSchema);


console.log(query.espectaculo);
try {
 let inserted_a = await areas.insertMany(query.areas);
 let inserted_b = await atracciones.insertMany(query.atracciones);
 let inserted_c = await empleados.insertMany(query.empleados);
 let inserted_d = await espectaculos.insertMany(query.espectaculos);
 let inserted_e = await restaurantes.insertMany(query.restaurantes);
 let inserted_f = await visitantes.insertMany(query.visitantes);
 let inserted_g = await visitas.insertMany(query.visitas);

 //console.log(inserted_a);
 process.exit(0);
} catch (e) {
 console.log('Some error');
 console.log(e);
 process.exit(0);
}


