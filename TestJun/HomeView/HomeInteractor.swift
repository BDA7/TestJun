//
//  HomeInteractor.swift
//  TestJun
//
//  Created by Данила on 02.09.2022.
//

import Foundation
import UIKit

enum HomeInteractorActions {
    case getProducts
    case presentBottomSheet(_ controller: UIViewController)
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func actionInteractor(action: HomeInteractorActions)
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    var router: HomeRouterProtocol?
    
    func actionInteractor(action: HomeInteractorActions) {
        switch action {
            
        case .getProducts:
            getProducts()
        case .presentBottomSheet(let controller):
            presentBottomSheet(controller)
        }
    }
}

extension HomeInteractor {
    private func getProducts() {
        NetworkQueries.getProducts(urlString: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") { result in
            switch result {
                
            case .success(let newProducts):
                self.presenter?.actionPresenter(action: .updateCollection(newProducts: newProducts))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func presentBottomSheet(_ controller: UIViewController) {
        router?.actions(.presentBottomSheet(controller))
    }
}
