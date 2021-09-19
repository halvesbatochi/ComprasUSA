//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Henrique Alves Batochi on 18/09/21.
//

import Foundation

class TaxesCalculator {
    
    // Singleton
    static let shared = TaxesCalculator()
    
    // Variáveis
    var dolar        : Double = 3.5
    var iof          : Double = 6.38
    var stateTax     : Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    // Variáveis computadas
    var shoppingValueInReal : Double {
        return shoppingValue * dolar
    }
    var stateTaxValue : Double {
        return shoppingValue * stateTax / 100
    }
    var iofValue : Double {
        return (shoppingValue + stateTax) * iof / 100
    }
    
    // Função de calculo
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        // Força a mostrar sempre o separador decimal (0,00)
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    // É utilizado o private init para impossibilitar que seja instanciado mais de uma instância.
    private init() {
        // Configura se o NumberFormatter irá apresentar com separador de casa do milhar e virgula
        formatter.usesGroupingSeparator = true
    }
}
