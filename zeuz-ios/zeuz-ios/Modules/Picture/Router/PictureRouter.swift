//
//  PictureRouter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class PictureRouter {
    var view: PictureVC
    var presenter: PicturePresenter
    /// Constructor de la clase.
    init() {
        view = PictureVC.init()
        presenter = PicturePresenter.init()
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
    }
}
extension PictureRouter: PictureRouterProtocol {}
