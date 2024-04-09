<?php
include_once 'DB.php';
class ManageBD extends DB{
  public function getQueries(){

	$areas = $this->connect()->query('SELECT * FROM areas');
	$atracciones =$this->connect()->query('SELECT * FROM atracciones');
	$empleados=$this->connect()->query('SELECT * FROM empleados');
	$espectaculos=$this->connect()->query('SELECT * FROM espectaculos');
	$restaurantes=$this->connect()->query('SELECT * FROM restaurantes');
	$visitantes=$this->connect()->query('SELECT * FROM visitantes');
	$visitas=$this->connect()->query('SELECT * FROM visitas');
	
	$queries = array (
		"areas"=>$areas,
		"atracciones"=>$atracciones,
		"empleados"=>$empleados,
		"espectaculos"=>$espectaculos,
		"restaurantes"=>$restaurantes,
		"visitantes"=>$visitantes,
		"visitas"=>$visitas,

	);
	
		return $queries;
	
	}
}
?>