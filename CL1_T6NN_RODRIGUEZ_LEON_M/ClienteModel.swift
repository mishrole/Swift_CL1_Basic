//
//  ClienteModel.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 29/04/21.
//

import UIKit

class ClienteModel: NSObject {
    
    var Codigo: Int = 0
    var Nombres: String = ""
    var Apellidos: String = ""
    var Dni: String = ""
    var CursoElegido: String = ""
    var PrecioCursoElegido: Double = 0
    var PrecioLibroElegido: Double = 0
    var DescuentoCursoElegido: Double = 0
    var NetoPagar: Double = 0
    
    override init() {
        Codigo = 0
        Nombres = ""
        Apellidos = ""
        Dni = ""
        CursoElegido = ""
        PrecioCursoElegido = 0
        PrecioLibroElegido = 0
        DescuentoCursoElegido = 0
        NetoPagar = 0
    }
    
    init(pCodigo: Int, pNombres: String, pApellidos: String, pDni: String, pCursoElegido: String, pPrecioCursoElegido: Double, pPrecioLibroElegido: Double, pDescuentoCursoElegido: Double, pNetoPagar: Double) {
        self.Codigo = pCodigo
        self.Nombres = pNombres
        self.Apellidos = pApellidos
        self.Dni = pDni
        self.CursoElegido = pCursoElegido
        self.PrecioCursoElegido = pPrecioCursoElegido
        self.PrecioLibroElegido = pPrecioLibroElegido
        self.DescuentoCursoElegido = pDescuentoCursoElegido
        self.NetoPagar = pNetoPagar
    }
    
}
