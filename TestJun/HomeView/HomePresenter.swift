//
//  HomePresenter.swift
//  TestJun
//
//  Created by Данила on 02.09.2022.
//

import Foundation

enum HomePresenterActions {
    case updateCollection(newProducts: ModelsNetwork)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    func actionPresenter(action: HomePresenterActions)
}

class HomePresenter: HomePresenterProtocol {
    func actionPresenter(action: HomePresenterActions) {
        switch action {
            
        case .updateCollection(newProducts: let newProducts):
            updateCollection(newProducts: newProducts)
        }
    }
    
    weak var view: HomeViewProtocol?
    
}

extension HomePresenter {
    private func updateCollection(newProducts: ModelsNetwork) {
        view?.actionView(action: .updateCollectionView(newProducts: newProducts))
    }
}
