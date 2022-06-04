//
//  PicturePresenter.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class PicturePresenter: PicturePresenterProtocol {
    var view: PictureViewProtocol?
    var router: PictureRouterProtocol?
    var interactor: PictureInputInteractorProtocol?
    func save(image: UIImage) {
        view?.showHUD()
        interactor?.save(image: image)
    }
    func loadImage() {
        view?.showHUD()
        interactor?.loadImage()
    }
}
extension PicturePresenter: PictureOutputInteractorProtocol {
    func requestFailure(message: String) {
        view?.hideHUD()
        view?.requestFailure(message: message)
    }
    func requestSuccess(message: String) {
        view?.hideHUD()
        view?.requestSuccess(message: message)
    }
    func showImage(img: UIImage) {
        view?.hideHUD()
        view?.showImage(img: img)
    }
}
