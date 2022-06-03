//
//  ZTablePresenter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class ZTablePresenter {
    var interactor: ZTableInputInteractor?
    var router: ZTableRouterProtocol?
    var view: ZTableViewProtocol?
}
extension ZTablePresenter: ZTablePresenterProtocol {
    func requestCell() {
        interactor?.getCells()
    }
}
extension ZTablePresenter: ZTableOutputInteractor {
    func updateCells(cells: [ZTableCellEntity]) {
        view?.updateCells(cells: cells)
    }
}
