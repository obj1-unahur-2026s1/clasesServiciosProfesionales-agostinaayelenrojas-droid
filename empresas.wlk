import profesional.*

class Empresa{
    const profesional=[]
    const clientes =[]
    var honorariosDeReferencia

    method honorariosDeReferencia()=honorariosDeReferencia

    method agregarProfesional(unProfesional){
        profesional.add(unProfesional)
    }
    
    method honorariosDeReferencia(unHonorario) {
      honorariosDeReferencia=unHonorario

    }
    
    method cantidadDeProfesionalesDe(unaUniversidad){
         return profesional.count({ p => p.universidad() == unaUniversidad })
    }

    method profesionalesCaros(){
       return  profesional.filter({p=>p.honorariosPorHora() > honorariosDeReferencia})
    }
    method universidadesFormadoras(){
        return profesional.map({p=>p.universidad() })
    }
    method profesionalMasBarato(){
       return  profesional.min({p=>p.honorariosPorHora() })
    }
    method genteAcotada(){
       return  profesional.all({p=>p.provincias().size()<=3})
    }

    method puedeSatisfacer(unSolicitante){
        return profesional.any({p=>unSolicitante.puedeSerAtendidoPor(p)})
    }
    method profesionalQueAtiende(unSolicitante){
        return profesional.find({p => unSolicitante.puedeSerAtendidoPor(p)})
    }

    method darServicio(unSolicitante){
        if (self.puedeSatisfacer(unSolicitante)){
            const rofesional = self.profesionalQueAtiende(unSolicitante)
            profesional.cobrar(profesional.honorariosPorHora())
            clientes.add(unSolicitante)
        }
    }

    method cuantosClientes(){
        return clientes.size()
    }
    method esCliente(unSolicitante){
        return clientes.contains(unSolicitante)
    }

    method profesionalPocoAtrectivo(unProfesional){
        return unProfesional.provincias().all({provincia=>profesional.any({
            otroProfesional=>otroProfesional != unProfesional &&
             otroProfesional.provincias().contains(provincia) &&
             otroProfesional.honorariosPorHora() < unProfesional.honorariosPorHora()
         })
      })
    }

}

