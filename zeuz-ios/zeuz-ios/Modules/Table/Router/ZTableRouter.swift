//
//  ZTableRouter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class ZTableRouter {
    var view: ZTableVC
    private var presenter: ZTablePresenter
    private var interactor: ZTableInteractor
    /// Constructor de la clase, crea la implementación de viper.
    init() {
        view = ZTableVC.init()
        presenter = ZTablePresenter.init()
        interactor = ZTableInteractor.init()
        interactor.presenter = presenter
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = self
    }
}
extension ZTableRouter: ZTableRouterProtocol {
    func showPicture() {
        let router = PictureRouter.init()
        view.navigationController?.pushViewController(router.view, animated: true)
    }
    func showGraphics() {
        let router = GraphicsRouter.init()
        view.navigationController?.pushViewController(router.view, animated: true)
    }
}
