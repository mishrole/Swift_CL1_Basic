//
//  ViewControllerMenuOffice.swift
//  CL1_T6NN_RODRIGUEZ_LEON_M
//
//  Created by Mitchell on 29/04/21.
//

import UIKit

class ViewControllerMenuOffice: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var tfMenuElegido: UITextField!
    @IBOutlet weak var tfPrecio: UITextField!
    @IBOutlet weak var tfCantidad: UITextField!
    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var tfDescuento: UITextField!
    @IBOutlet weak var tfTotalPagar: UITextField!
    
    @IBOutlet weak var pvMenu: UIPickerView!
    @IBOutlet weak var swDescuento: UISwitch!
    
    var oListaMenu: [MenuModel] = []
    var oMenu: MenuModel = MenuModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvMenu.dataSource = self
        pvMenu.delegate = self
        oListaMenu.append(MenuModel(pCodigo: "M1", pNombre: "Ejecutivo", pPrecio: 25))
        oListaMenu.append(MenuModel(pCodigo: "M2", pNombre: "Carta", pPrecio: 18))
        oListaMenu.append(MenuModel(pCodigo: "M3", pNombre: "Diario", pPrecio: 12))
        tfCantidad.text = "1"
    }
    
    func mostrarAlerta(mensaje: String) {
        let alert = UIAlertController(title: "¡Oops!", message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Entendido", style: .default, handler: { action in
        }))
        present(alert, animated: true)
    }
    
    func calcularSubtotal(precio: Double, cantidad: Int) -> Double {
        return precio * Double(cantidad)
    }
    
    func calcularDescuento(subtotal: Double) -> Double {
        if(subtotal > 40) {
            return subtotal * (5 / 100)
        } else {
            return 0
        }
    }
    
    func calcularTotal(precioMenu: Double, cantidadMenu: Int) -> Double {
        let costoDelivery = 7
        let subtotalMenu = calcularSubtotal(precio: precioMenu, cantidad: cantidadMenu)
        let descuento = calcularDescuento(subtotal: subtotalMenu)
        
        if(swDescuento.isOn) {
            return subtotalMenu + Double(costoDelivery) - descuento
        } else {
            return subtotalMenu - descuento
        }
    }
    
    func generarCalculos() {
        let cantidad = Int(tfCantidad.text ?? "")
        let subtotal = calcularSubtotal(precio: oMenu.Precio, cantidad: cantidad ?? 0)
        let descuento = calcularDescuento(subtotal: subtotal)
        
        tfTotal.text = String(subtotal)
        tfDescuento.text = String(format: "%.2f", descuento)
        tfTotalPagar.text = String(calcularTotal(precioMenu: oMenu.Precio, cantidadMenu: cantidad ?? 0))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return oListaMenu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        oMenu = oListaMenu[row]
        
        let cantidad = Int(tfCantidad.text ?? "")
        
        tfMenuElegido.text = oMenu.Nombre
        tfPrecio.text = String(oMenu.Precio)
        tfTotal.text = String(calcularSubtotal(precio: oMenu.Precio, cantidad: cantidad ?? 0 ))
        tfDescuento.text = ""
        tfTotalPagar.text = ""
    }
    
    func menuEsSeleccionado() -> Bool {
        if(tfMenuElegido.text?.isEmpty == true) {
            return false
        } else {
            return true
        }
    }
    
    func formularioEsValido() -> Bool {
        if(tfCantidad.text?.isEmpty == true) {
            return false
        } else {
            return true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return oListaMenu[row].Nombre
    }
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        if(!formularioEsValido()) {
            mostrarAlerta(mensaje: "Ingrese una cantidad")
        } else {
            if(!menuEsSeleccionado()) {
                mostrarAlerta(mensaje: "Seleccione un menu")
            } else {
                generarCalculos()
            }
        }
    }
    
    @IBAction func btnLimpiar(_ sender: UIButton) {
        tfMenuElegido.text = ""
        tfPrecio.text = ""
        tfCantidad.text = "1"
        tfTotal.text = ""
        tfDescuento.text = ""
        tfTotalPagar.text = ""
    }

}
