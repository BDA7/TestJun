//
//  HomeViewModule.swift
//  TestJun
//
//  Created by Данила on 02.09.2022.
//

import UIKit

class HomeViewModule {
    static func setupHomeView() -> UIViewController  {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()

        view.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter

        return view
    }
}
