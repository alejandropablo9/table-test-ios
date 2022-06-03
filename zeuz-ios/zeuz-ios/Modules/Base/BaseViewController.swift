//
//  BaseViewController.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
import JGProgressHUD
import SwiftMessages
class BaseViewController: UIViewController {
    /// Bandera para establecer si el fondo es dark
    var isDarkBackground: Bool = true
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            if isDarkBackground {
                return .lightContent
            } else {
                return .darkContent
            }
        } else {
            return .default
        }
    }
    /// Progress animation
    var progressHUD = JGProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
    }
    func setupNavigationBar(color: UIColor = .blueColor, tintColor: UIColor = .white) {
        if #available(iOS 13.0, *) {
            let apparence = UINavigationBarAppearance()
            apparence.configureWithOpaqueBackground()
            apparence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            apparence.backgroundColor = color
            apparence.shadowColor = .clear
            navigationController?.navigationBar.standardAppearance = apparence
            navigationController?.navigationBar.scrollEdgeAppearance = apparence
        } else {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.barTintColor = color
            navigationController?.navigationBar.isTranslucent = false
        }
        navigationController?.navigationBar.tintColor = .white
    }
    /// Función para mostrar la animación del progress.
    func showHUD() {
        self.progressHUD.show(in: self.view, animated: true)
    }
    /// Función para ocultar la animación del progress.
    func hideHUD() {
        self.progressHUD.dismiss(afterDelay: 0.1, animated: true)
    }
    /// Función para mostrar el toast
    /// - Parameters:
    ///  - message: Texto del mensaje.
    ///  - style: Tipo de estilo del toast.
    func showToast(message: String, style: StyleToast) {
        var color: UIColor = .white
        switch style {
        case .failure:
            color = .failureColor
        case .success:
            color = .successColor
        case .info:
            color = .infoColor
        }
        
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .viewController(self)
        config.presentationStyle = .top
        let messageView: MessageView = MessageView.viewFromNib(layout: .cardView)
        messageView.configureContent(title: "", body: message.localized)
        messageView.button?.isHidden = true
        messageView.iconLabel?.isHidden = true
        messageView.iconImageView?.isHidden = true
        messageView.configureTheme(backgroundColor: color, foregroundColor: .white)
        messageView.configureDropShadow()
        messageView.configureBackgroundView(width: view.bounds.width-32)
        SwiftMessages.show(config: config, view: messageView)
    }
}
