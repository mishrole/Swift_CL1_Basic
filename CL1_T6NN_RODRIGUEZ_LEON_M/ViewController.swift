//
//  ViewController.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 28/04/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tfNombres: UITextField!
    @IBOutlet weak var tfApellidos: UITextField!
    @IBOutlet weak var tftDni: UITextField!
    @IBOutlet weak var tfCursoElegido: UITextField!
    @IBOutlet weak var tfPrecioCurso: UITextField!
    @IBOutlet weak var tfPrecioLibro: UITextField!
    @IBOutlet weak var tfDescuento: UITextField!
    @IBOutlet weak var tfNetoPagar: UITextField!
    
    @IBOutlet weak var pvCurso: UIPickerView!
    
    var oListaCurso: [CursoModel] = []
    var oCurso: CursoModel = CursoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvCurso.dataSource = self
        pvCurso.delegate = self
        oListaCurso.append(CursoModel(pCodigo: "I60", pNombre: "Flutter", pPrecioCurso: 229, pPrecioLibro: 20, pDescuentoCurso: 25))
        oListaCurso.append(CursoModel(pCodigo: "I20", pNombre: "Android", pPrecioCurso: 100, pPrecioLibro: 20, pDescuentoCurso: 5))
        oListaCurso.append(CursoModel(pCodigo: "I40", pNombre: "IOS", pPrecioCurso: 180, pPrecioLibro: 30, pDescuentoCurso: 10))
    }
    
    func mostrarAlerta(mensaje: String) {
        let alert = UIAlertController(title: "¡Oops!", message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Entendido", style: .default, handler: { action in
        }))
        present(alert, animated: true)
    }
    
    func calcularDescuentoCurso(precio: Double, descuento: Double) -> Double {
        return precio * (descuento / 100)
    }
    
    func calcularNeto(precioCurso: Double, precioLibro: Double, descuentoCurso: Double ) -> Double {
        let descuento = calcularDescuentoCurso(precio: precioCurso, descuento: descuentoCurso)
        return precioCurso - descuento + precioLibro
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return oListaCurso.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        oCurso = oListaCurso[row]
        tfCursoElegido.text = oCurso.Nombre
        tfPrecioCurso.text = String(oCurso.PrecioCurso)
        tfPrecioLibro.text = String(oCurso.PrecioLibro)
        tfDescuento.text = ""
        tfNetoPagar.text = ""
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return oListaCurso[row].Nombre
    }
    
    func generarCalculos() {
        tfDescuento.text = String(calcularDescuentoCurso(precio: oCurso.PrecioCurso, descuento: oCurso.DescuentoCurso))
        tfNetoPagar.text = String(calcularNeto(precioCurso: oCurso.PrecioCurso, precioLibro: oCurso.PrecioLibro, descuentoCurso: oCurso.DescuentoCurso))
    }
    
    func cursoEsSeleccionado() -> Bool {
        if(tfCursoElegido.text?.isEmpty == true) {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        if(!cursoEsSeleccionado()) {
            mostrarAlerta(mensaje: "Seleccione un curso")
        } else {
            generarCalculos()
        }
    }
    
    func totalEsCalculado() -> Bool {
        if(tfNetoPagar.text?.isEmpty == true) {
            return false
        } else {
            return true
        }
    }
    
    func formularioEsValido() -> Bool {
        if(tfNombres.text?.isEmpty == true || tfApellidos.text?.isEmpty == true || tftDni.text?.isEmpty == true) {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func btnImprimir(_ sender: UIButton) {
        if(!formularioEsValido()) {
            mostrarAlerta(mensaje: "Todos los campos son obligatorios")
        } else {
            if(!cursoEsSeleccionado()) {
                mostrarAlerta(mensaje: "Seleccione un curso")
            } else {
                if(!totalEsCalculado()) {
                    generarCalculos()
                }
                
                let oCliente: ClienteModel = ClienteModel(pCodigo: 0, pNombres: self.tfNombres.text!, pApellidos: self.tfApellidos.text!, pDni: self.tftDni.text!, pCursoElegido: self.tfCursoElegido.text!, pPrecioCursoElegido: Double(self.tfPrecioCurso.text!) ?? 0, pPrecioLibroElegido: Double(self.tfPrecioLibro.text!) ?? 0, pDescuentoCursoElegido: Double(self.tfDescuento.text!) ?? 0, pNetoPagar: Double(self.tfNetoPagar.text!) ?? 0)
                
                let osb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let oPantalla2 = osb.instantiateViewController(identifier: "ViewControllerSalida") as! ViewControllerSalida
                oPantalla2.pCliente = oCliente
                
                self.present(oPantalla2, animated: true, completion: nil)
                
            }
        }
    }
}
