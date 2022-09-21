//
//  HomeRouter.swift
//  TestJun
//
//  Created by Данила on 21.09.2022.
//

import Foundation
import UIKit

enum HomeRouterActions {
    case presentBottomSheet(_ controller: UIViewController)
}

protocol HomeRouterProtocol {
    func actions(_ action: HomeRouterActions)
}

class HomeRouter: HomeRouterProtocol {
    func actions(_ action: HomeRouterActions) {
        switch action {
        case .presentBottomSheet(let controller):
            presentBottomSheet(controller)
        }
    }

    private func presentBottomSheet(_ controller: UIViewController) {
        let bottomSheet = BottomSheetView()
        bottomSheet.modalPresentationStyle = .overCurrentContext
        controller.tabBarController?.present(bottomSheet, animated: true)
    }
    
    
}
