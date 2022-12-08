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