//
//  BranchesFacade.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import Alamofire
final class BranchesFacade: BaseFacade {
    /// Función para consultar la información.
    public func getBranches() {
        let settings: RequestSettings = RequestSettings.init(url: HttpEndPoints.Api.host + HttpEndPoints.Branches.url, method: .get, parameters: nil, headers: self.basicHeaders)
        self.connection.delegate = self
        self.connection.startRequestConnection(settings: settings, tagName: BranchesResponse.className)
    }
}
extension BranchesFacade: MSDelegate {
    func didReceiveData(data: Data, serviceName: String) {
        switch serviceName {
        case BranchesResponse.className:
            self.decodeEntity(responseType: BranchesResponse.self, data: data, serviceName: BranchesResponse.className)
        default:
            let error = ErrorResponseEntity.init(status: false, message: "errorGenericService".localized)
            self.delegate?.didReceiveEntitySuccess(tagName: serviceName, result: error)
        }
    }
}
