//
//  PictureProtocols.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//

import UIKit
/// Define las acciones de la vista para la comunicación con el presenter.
protocol PictureViewProtocol {
    /// Muestra el loading
    func showHUD()
    /// Oculta el loadin
    func hideHUD()
    /// Función que indica que hubo un error
    /// - Parameter message: Mensaje con el error.
    func requestFailure(message: String)
    /// Función que indica que la acción se llevo existosamente.
    /// - Parameter message: Mensaje con el error.
    func requestSuccess(message: String)
    /// Función para mostrar imagen.
    func showImage(img: UIImage)
}
/// Define las acciones del para la comunicación entre el presenter y el router.
protocol PictureRouterProtocol {
}
/// Define las acciones del presenter para la comunicación con la vista.
protocol PicturePresenterProtocol {
    /// Función para guardar la imagen.
    func save(image: UIImage)
    /// Función para consultar la imagen.
    func loadImage()
}
///
protocol PictureInputInteractorProtocol {
    /// Función para guardar la imagen.
    func save(image: UIImage)
    /// Función para consultar la imagen.
    func loadImage()
}
protocol PictureOutputInteractorProtocol {
    /// Función que indica que hubo un error
    /// - Parameter message: Mensaje con el error.
    func requestFailure(message: String)
    /// Función que indica que la acción se llevo existosamente. 
    /// - Parameter message: Mensaje con el error.
    func requestSuccess(message: String)
    /// Función para mostrar imagen.
    func showImage(img: UIImage)
}
