//
//  PictureInteractor.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import FirebaseFirestore
import FirebaseStorage
final class PictureInteractor {
    var presenter: PictureOutputInteractorProtocol?
    let storage = Storage.storage()
}
extension PictureInteractor: PictureInputInteractorProtocol {
    func save(image: UIImage) {
        guard let imageJpeg = image.jpegData(compressionQuality: 0.75) else {
            presenter?.requestFailure(message: "Ups, algo salio mal...")
            return
        }
        let imageName = "profile.jpg"
        let imageRef = storage.reference().child("images").child(imageName)
        imageRef.putData(imageJpeg, metadata: nil) { [weak self] (metadata, err) in
            if let error = err {
                self?.presenter?.requestFailure(message: error.localizedDescription)
            } else {
                self?.presenter?.requestSuccess(message: "Imagen guardada en FireStorage")
            }
        }
    }
    func loadImage() {
        let imageRef = storage.reference().child("images/profile.jpg")
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
              self.presenter?.requestFailure(message: "No fue posible cargar la imagen")
          } else {
              if let imgMetadata = data, let image = UIImage(data: imgMetadata) {
                  self.presenter?.showImage(img: image)
              }
          }
        }
    }
}
