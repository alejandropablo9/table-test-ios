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
    /// Función para cargar una imagen.
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    func load(url: String) {
        if let uri = URL.init(string: url) {
            self.load(url: uri)
        }
    }
}
