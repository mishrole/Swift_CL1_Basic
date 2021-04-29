//
//  ViewControllerSalida.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 29/04/21.
//

import UIKit

class ViewControllerSalida: UIViewController {
    
    var pCliente: ClienteModel = ClienteModel()
    
    @IBOutlet weak var tfNombres: UITextField!
    @IBOutlet weak var tfApellidos: UITextField!
    @IBOutlet weak var tfDni: UITextField!
    @IBOutlet weak var tfCursoElegido: UITextField!
    @IBOutlet weak var tfPrecioCursoElegido: UITextField!
    @IBOutlet weak var tfPrecioLibroElegido: UITextField!
    @IBOutlet weak var tfDescuentoCursoElegido: UITextField!
    @IBOutlet weak var tfNetoPagar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfNombres.text = pCliente.Nombres
        self.tfApellidos.text = pCliente.Apellidos
        self.tfDni.text = pCliente.Dni
        self.tfCursoElegido.text = pCliente.CursoElegido
        self.tfPrecioCursoElegido.text = String(pCliente.PrecioCursoElegido)
        self.tfPrecioLibroElegido.text = String(pCliente.PrecioLibroElegido)
        self.tfDescuentoCursoElegido.text = String(pCliente.DescuentoCursoElegido)
        self.tfNetoPagar.text = String(pCliente.NetoPagar)
    }
    
    @IBAction func btnVolver(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
