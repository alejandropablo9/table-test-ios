//
//  GraphicsProtocols.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
/// Define las acciones de la vista para la comunicación con el presenter.
protocol GraphicsViewProtocol {
    /// Muestra el loading
    func showHUD()
    /// Oculta el loadin
    func hideHUD()
    /// Muestra la información de las sucursales
    func showDataBranches(data: [Branches])
    /// Función que indica que hubo un error
    /// - Parameter message: Mensaje con el error.
    func requestFailure(message: String)
}
/// Define las acciones del presenter para la comunicación con la vista.
protocol GraphicsPresenterProtocol {
    /// Solicita la información de las sucursales.
    func getDataBranches()
}
/// Define las acciones del para la comunicación entre el presenter y el router.
protocol GraphicsRouterProtocol {
}
/// Define las acciones para la comunicación entre el interactor y el presenter.
protocol GraphicsOutputInteractorProtocol {
    /// Muestra la información de las sucursales
    func showDataBranches(data: [Branches])
    /// Función que indica que hubo un error
    /// - Parameter message: Mensaje con el error.
    func requestFailure(message: String)
}
/// Define las acciones para la comunicación entre el presenter y el interactor.
protocol GraphicsInputInteractorProtocol {
    /// Solicita la información de las sucursales.
    func getDataBranches()
}
