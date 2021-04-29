//
//  MenuModel.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 29/04/21.
//

import UIKit

class MenuModel: NSObject {
    
    var Codigo: String = ""
    var Nombre: String = ""
    var Precio: Double = 0
    
    override init() {
        Codigo = ""
        Nombre = ""
        Precio = 0
    }
    
    init(pCodigo: String, pNombre: String, pPrecio: Double) {
        self.Codigo = pCodigo
        self.Nombre = pNombre
        self.Precio = pPrecio
    }
}
