//
//  ZTablePresenter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class ZTablePresenter {
    var interactor: ZTableInputInteractorProtocol?
    var router: ZTableRouterProtocol?
    var view: ZTableViewProtocol?
}
extension ZTablePresenter: ZTablePresenterProtocol {
    func requestCell() {
        interactor?.getCells()
    }
    func showPicture() {
        router?.showPicture()
    }
    func showGraphics() {
        router?.showGraphics()
    }
}
extension ZTablePresenter: ZTableOutputInteractorProtocol {
    func updateCells(cells: [ZTableCellEntity]) {
        view?.updateCells(cells: cells)
    }
}
