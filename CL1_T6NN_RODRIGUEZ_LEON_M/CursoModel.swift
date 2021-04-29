//
//  CursoModel.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 28/04/21.
//

import UIKit

class CursoModel: NSObject {

    var Codigo: String = ""
    var Nombre: String = ""
    var PrecioCurso: Double = 0
    var PrecioLibro: Double = 0
    var DescuentoCurso: Double = 0
    
    override init() {
        Codigo = ""
        Nombre = ""
        PrecioCurso = 0
        PrecioLibro = 0
        DescuentoCurso = 0
    }
    
    init(pCodigo: String, pNombre: String, pPrecioCurso: Double, pPrecioLibro: Double, pDescuentoCurso: Double) {
        self.Codigo = pCodigo
        self.Nombre = pNombre
        self.PrecioCurso = pPrecioCurso
        self.PrecioLibro = pPrecioLibro
        self.DescuentoCurso = pDescuentoCurso
    }
}
