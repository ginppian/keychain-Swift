//
//  ViewController.swift
//  keychainProject
//
//  Created by Gmo Ginppian on 09/07/18.
//  Copyright © 2018 BUAP. All rights reserved.
//

import UIKit

class Perror: NSObject, NSCoding {
    
    var _nombre: String?
    var _edad: Int?
    
    override init() {
        super.init()
        _nombre = String()
        _edad = Int()
    }
    
    init(nombre: String, edad: Int) {
        _nombre = nombre
        _edad = edad
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObject(forKey: "nombre") as? String ?? String()
        let edad = aDecoder.decodeObject(forKey: "edad") as? Int ?? Int()
        self.init(nombre: nombre, edad: edad)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_nombre, forKey: "nombre")
        aCoder.encode(_edad, forKey: "edad")
    }
    
    var Nombre: String {
        get {
            return _nombre ?? String()
        }
        set {
            _nombre = newValue
        }
    }
    
    var Edad: Int {
        get {
            return _edad ?? Int()
        }
        set {
            _edad = newValue
        }
    }
    
    override var description: String {
        var _description = "\n"
        _description += "nombre: \(String(describing: _nombre))"
        _description += "edad: \(String(describing: _edad))"
        return _description
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var lblMostrar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        
        // Creamos instancia de Perro
        let _perro = Perror(nombre: txtNombre.text!,
                            edad: Int(txtEdad.text!)!)
        
        // Creamos instancia de Keychain
        let _kc = KeyChainHandler.getInstance()
        
        // Creamos un objeto Data (binario) con nuestra instancia
        let saveData = NSKeyedArchiver.archivedData(withRootObject: _perro)
        
        // Guardamos
        _kc?.guardarDataEnKeychain(saveData, clave: "clave")

    }
    
    @IBAction func btnMostrar(_ sender: Any) {
        
        // Creamos instancia de Keychain
        let _kc = KeyChainHandler.getInstance()
        
        // Leemos el objeto en base a nuestra 'clave'
        let saveData = _kc?.leerDataDeKeychain("clave")
        
        // Obtenemos el objeto y lo casteamos
        let _perro: Perror = NSKeyedUnarchiver.unarchiveObject(with: saveData!) as! Perror
        
        // Mostramos
        lblMostrar.text = "nombre: \(_perro.Nombre)\n edad: \(_perro.Edad)\n"
    }
    
}







































