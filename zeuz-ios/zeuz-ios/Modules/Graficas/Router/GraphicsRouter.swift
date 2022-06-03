//
//  GraphicsRouter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class GraphicsRouter {
    var view: GraphicsVC
    private var presenter: GraphicsPresenter
    private var interactor: GraphicsInteractor
    /// Constructor de la clase, crea la implementación de viper.
    init() {
        view = GraphicsVC.init()
        presenter = GraphicsPresenter.init()
        interactor = GraphicsInteractor.init()
        interactor.presenter = presenter
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = self
    }
}
extension GraphicsRouter: GraphicsRouterProtocol {
}
