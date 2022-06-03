//
//  ImageView.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
extension UIImageView {
    /// Función para redondear imagen
    func roundCorner(radius: CGFloat) {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
