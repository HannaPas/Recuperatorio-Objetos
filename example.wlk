class Presidente{
	var presidentes = []
	var actosDeGobierno= []
	var promesas = []
	var property aniosMuerto 

	method agregarActosDeGobierno(acto){
		actosDeGobierno.add(acto)
	}
	
	//asumiendo que todos los presidentes estan fallecidos
	method imagenPositiva(){
		return actosDeGobierno.sum{unActo =>unActo.impacto()} + (aniosMuerto*0.01)
	}
	
	method mayorImagenPostiva(){
		return presidentes.max{unPresidente => self.imagenPositiva()}
	}
	
	method masDe4Actos(){
		return actosDeGobierno.size() > 4
	}
	
	method todasCumplidas(){
		return promesas.forEach{unaPromesa => unaPromesa.promesaCumplida(true)}
	}
	
	method esUnOpositor(denuncia){
		return denuncia.opositor()
	}
	
	
}

class InaguracionDeObras{
	var property cantPersonasAfectadas
	var property impacto
	method impacto(importancia, naturalezaObra){
		impacto = (cantPersonasAfectadas*importancia) + naturalezaObra
	}
}

class  Discursos{
	var property personasPresentes
	var property impacto
	var importancia
	var intensidadAplauso
	
	method discurso(){
		return (personasPresentes*importancia)* intensidadAplauso
	}
}

class Promesas inherits Discursos{
	var promesas = []
	var property promesaCumplida = true
	
	override method impacto(){
		if(promesaCumplida){
			impacto = self.discurso()*2
		}else{
			impacto = - self.discurso()*2
		}
	}
}

class Denuncias{
	var denuncias = []
	var property impacto //siempre negativo 
	var audiencia
	var property opositor = true
	
	method impacto(importancia){
		impacto = -(audiencia*importancia)* self.impacto()
	}
	method denuncia(nuevaDenuncia){
		denuncias.add(nuevaDenuncia)
	}
}

class Periodista inherits Denuncias{
	override method impacto(){
		impacto = audiencia / 2
	} 
}

class Politico inherits Denuncias{
	var CantDeSeguidores
	override method impacto(){
		impacto = CantDeSeguidores.min(audiencia)
	}
}


///////////////////////////////////preguntas/////////////////////////////////////////

//¿Cómo impacta en la solución que las denuncias también las pueda hacer un sindicalista?

//Si las denuncias fueran hechas por un sindicalista bastaría con agregar una clase sindicalista
//que herede de las Denuncias y poder determinar el valor de impacto que genera una denuncia
//realizada por un sindicalista.


//¿En qué caso fue útil la herencia?

//La herencia fue util en el caso de las Promesas ya que dependian de los Discursos y de 
//las promesas que realizaba el presidente en cada uno.

//Tambien fue util en las Denuncias ya que cada denuncia podia estar hecha por dos personas
//tanto periodista como politico y ambos presentaban un valor de impacto distinto que nos 
//modificaba nuestro metodo general.