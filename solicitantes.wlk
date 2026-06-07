class Solicitante{

    method puedeSerAtendidoPor(unProfesional){
        
    }
}

class Persona inherits Solicitante{
    var provincia
    method provincia()=provincia
    method provincia(unaProvincia){
        provincia=unaProvincia
    }
    
    override method puedeSerAtendidoPor(unProfesional){
        return unProfesional.provincias().contains(provincia)
    }

}

class Institucion inherits Solicitante{
    var universidadesReconocidas =[]
    method universidadesReconocidas()=universidadesReconocidas
    method universidadesReconocidas(unaUniversidad){
        universidadesReconocidas=unaUniversidad
    }

    override method puedeSerAtendidoPor(unProfesional){
        return universidadesReconocidas.contains(unProfesional.universidad())
    }

}

class Club inherits Solicitante{
    var provincias
    method provincias()=provincias
    method provincias(unasProvincias){
        provincias=unasProvincias
    }

    override method puedeSerAtendidoPor(unProfesional){
        return provincias.any({provincia=> unProfesional.provincias().contains(provincia)})
    }
}