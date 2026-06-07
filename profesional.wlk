class Profesional{
    var universidad

    method universidad(unaUniversidad){
        universidad=unaUniversidad
    }
    method universidad()=universidad
   
    method honorariosPorHora()

    method provincias()
    method cobrar(unImporte)
}

class Universidad {
    var provincia
    var honorarioRecomendado
    var totalDonaciones = 0
    method totalDonaciones()=totalDonaciones
    method recibirDonacion(unImporte){
        totalDonaciones += unImporte
    }


    method provincia()=provincia
    method honorarioRecomendado()=honorarioRecomendado

    method provincia(unaProvincia){
        provincia=unaProvincia
    }
    method honorarioRecomendado(unHonorarioRecomendado){
        honorarioRecomendado=unHonorarioRecomendado
    }

}

class ProfesionalVinculado inherits Profesional{
    override method honorariosPorHora(){
        return universidad.honorarioRecomendado()
    }
    override method provincias(){
        return [universidad.provincia()]
    }

    override method cobrar(unImporte){
       universidad.recibirDonacion(unImporte / 2)
    }

}

class ProfesionalAsociado inherits Profesional{
    override method provincias(){
        return ["Entre rios", "Santa Fe", "Corrientes"]
    }

    override method honorariosPorHora(){
        return 3000
    }
    override method cobrar(unImporte){
        asociacionDelLitoral.recibirDinero(unImporte)
    }
    
}

object asociacionDelLitoral {
    var totalRecaudado= 0
    method totalRecaudado()=totalRecaudado
    method recibirDinero(unImporte){
        totalRecaudado += unImporte
    }
}



class ProfesionalLibre inherits Profesional{
    var totalRecaudado = 0
    var provinciasHabilitadas
    var  honorarios
    method provinciasHabilitadas()=provinciasHabilitadas
    method honorarios()=honorarios
    method totalRecaudado()=totalRecaudado

    method provinciasHabilitadas(unaProvincia){
        provinciasHabilitadas=unaProvincia
    }
    method honorarios(unHonorario){
        honorarios=unHonorario
    }
    override method provincias(){
        return provinciasHabilitadas
    }
    override method honorariosPorHora(){
        return honorarios
    }
    override method cobrar(unImporte){
        totalRecaudado += unImporte
    }
    method pasarDinero(otroProfesional, unImporte){
        totalRecaudado -= unImporte
        otroProfesional.cobrar(unImporte)
    }

    
}