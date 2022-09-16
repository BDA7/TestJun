//
//  ModelsNetwork.swift
//  TestJun
//
//  Created by Данила on 31.08.2022.
//

import Foundation

struct ModelsNetwork: Decodable {
    var home_store: [HomeStore]
    var best_seller: [BestSeller]
}

struct HomeStore: Decodable {
    var id: Int
    var is_new: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var is_buy: Bool
}

struct BestSeller: Decodable {
    var id: Int
    var is_favorites: Bool
    var title: String
    var price_without_discount: Int
    var discount_price: Int
    var picture: String
}
