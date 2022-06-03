//
//  ZTableProtocols.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
/// Define las acciones de la vista para la comunicación con el presenter.
protocol ZTableViewProtocol {
    /// Actualiza la lista en la tabla
    /// - Parameter cell: Lista de celdas
    func updateCells(cells: [ZTableCellEntity])
}
/// Define las acciones del presenter para la comunicación con la vista.
protocol ZTablePresenterProtocol {
    /// Solicita la lista de las tabla
    func requestCell()
    /// Dirige a la vista de fotografía.
    func showPicture()
    /// Dirige a la vista de graficas.
    func showGraphics()
}
/// Define las acciones del para la comunicación entre el presenter y el router.
protocol ZTableRouterProtocol {
    /// Dirige a la vista de fotografía.
    func showPicture()
    /// Dirige a la vista de graficas.
    func showGraphics()
}
/// Define las acciones para la comunicación entre el interactor y el presenter.
protocol ZTableOutputInteractor {
    /// Delega la lista de celdas
    /// - Parameter cell: Lista de celdas
    func updateCells(cells: [ZTableCellEntity])
}
/// Define las acciones para la comunicación entre el presenter y el interactor.
protocol ZTableInputInteractor {
    /// Obtiene la lista de celdas
    func getCells()
}
