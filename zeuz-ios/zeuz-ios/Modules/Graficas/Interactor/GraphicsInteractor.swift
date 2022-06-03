//
//  GraphicsInteractor.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class GraphicsInteractor {
    var presenter: GraphicsOutputInteractorProtocol?
}
extension GraphicsInteractor: GraphicsInputInteractorProtocol {
    func getDataBranches() {
        let facade = BranchesFacade()
        facade.delegate = self
        facade.getBranches()
    }
}
extension GraphicsInteractor: FacadeDelegate {
    func didReceiveEntitySuccess<T>(tagName: String, result: T) where T : Decodable {
        switch (tagName) {
        case BranchesResponse.className:
            if let response = result as? BranchesResponse, let data = response.data {
                presenter?.showDataBranches(data: data)
            } else if let error = result as? ErrorResponseEntity {
                presenter?.requestFailure(message: error.message ?? "errorGenericService".localized)
            } else {
                presenter?.requestFailure(message: "errorGenericService".localized)
            }
        default: break
        }
    }
}
