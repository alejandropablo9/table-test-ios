//
//  UIColorExtension.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
extension UIColor {
    /// Color de fondo para mensaje exitoso.
    public static let successColor = UIColor(named: "successColor") ?? .green
    /// Color de fondo para mensaje de error.
    public static let failureColor = UIColor(named: "failureColor") ?? .red
    /// Color de fondo para mensaje informativo.
    public static let infoColor = UIColor(named: "infoColor") ?? .blue
    /// Color azul
    public static let blueColor = UIColor(named: "blueColor") ?? .blue
    /// Aleatorio
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
