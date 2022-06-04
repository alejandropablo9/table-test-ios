//
//  PictureVC.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class PictureVC: BaseViewController {
    @IBOutlet fileprivate weak var ivPicture: UIImageView!
    private var imagePicker: ImagePickerHelper?
    var presenter: PicturePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePickerHelper(presentationController: self, delegate: self)
        self.ivPicture.roundCorner(radius: 20)
        presenter?.loadImage()
        self.navigationItem.title = "Fotografía"
    }
    @IBAction func btnTakePicturePressed(_ sender: UIButton) {
        self.imagePicker?.present(from: sender)
    }
}
extension PictureVC: PictureViewProtocol {
    func requestFailure(message: String) {
        showToast(message: message, style: .failure)
    }
    func requestSuccess(message: String) {
        showToast(message: message, style: .success)
    }
}
/// Delegado imagepicker
extension PictureVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let img = image {
            self.ivPicture.image = img
            presenter?.save(image: img)
        }
    }
    func showImage(img: UIImage) {
        self.ivPicture.image = img
    }
}
