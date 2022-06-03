//
//  GraphicsVC.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class GraphicsVC: UIViewController {
    var presenter: GraphicsPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataBranches()
    }
}
extension GraphicsVC: GraphicsViewProtocol {
    func showHUD() {
        print("showHUD")
    }
    func hideShowHU() {
        print("hideHU")
    }
    func showDataBranches(data: [Branches]) {
        print(data)
    }
    func requestFailure(message: String) {
        print(message)
    }
}
