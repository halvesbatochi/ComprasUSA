//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Henrique Alves Batochi on 11/09/21.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmount()
    }
    
    func setAmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }


}

