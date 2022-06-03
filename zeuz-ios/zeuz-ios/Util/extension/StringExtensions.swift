//
//  StringExtensions.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import Foundation
extension String {
    /// Función que recibe una expresión regular en string.
    /// - Parameter regex: revisa que existan coincidencias en el string.
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    /// Función que encapsula la llamada al archivo Localizable.strings del proyecto.
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
