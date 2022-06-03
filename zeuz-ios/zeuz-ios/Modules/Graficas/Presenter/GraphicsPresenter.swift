//
//  GraphicsPresenter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class GraphicsPresenter {
    var interactor: GraphicsInputInteractorProtocol?
    var router: GraphicsRouterProtocol?
    var view: GraphicsViewProtocol?
}
extension GraphicsPresenter: GraphicsPresenterProtocol {
    func getDataBranches() {
        view?.showHUD()
        interactor?.getDataBranches()
    }
}
extension GraphicsPresenter: GraphicsOutputInteractorProtocol {
    func showDataBranches(data: [Branches]) {
        view?.showDataBranches(data: data)
        view?.hideShowHU()
    }
    func requestFailure(message: String) {
        view?.hideShowHU()
        view?.requestFailure(message: message)
    }
}
