//
//  ImagePickerHelper.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
import Foundation
/// Protocolo para selección de imagenes
protocol ImagePickerDelegate {
    /// Función para tratar los datos de la imagen.
    ///  - Parameter image: Imagen seleccionada
    func didSelect(image: UIImage?)
}
/// Clase encargada de tratar los datos
open class ImagePickerHelper: NSObject {
    private let pickerController: UIImagePickerController
    private var presentationController: UIViewController?
    private var delegate: ImagePickerDelegate?
    /// Constructor de la clase
    init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    /// Presentador del alert para selección de origen de la imagen.
    public func present(from sourceView: UIView) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if let action = self.action(for: .camera, title: "Tomar foto") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Fotos") {
            alertController.addAction(action)
        }
        alertController.addAction(UIAlertAction(title: "Galeria de fotos", style: .cancel, handler: nil))
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        self.presentationController?.present(alertController, animated: true)
    }
    ///
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        self.delegate?.didSelect(image: image)
    }
}
/// Delegado del imagepicker
extension ImagePickerHelper: UIImagePickerControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}
extension ImagePickerHelper: UINavigationControllerDelegate {
}
