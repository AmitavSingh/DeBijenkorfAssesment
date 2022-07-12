//
//  ProductData.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import Foundation

struct ProductSearchReposne: Decodable {
    let data: SearchData?
}

struct SearchData: Decodable {
    let searchText: SearchText?
    let products: [Products]?
}

struct SearchText: Decodable{
    let original: String?
    let corrected: String?
    let searchPass: String?
    let alternatives: String?
}

struct Products: Decodable{
    let brand: Brand?
    let sellingPrice: SellingPrice?
}

struct Brand: Decodable{
    let name: String?
    let query: String?
    let secondaryName: String?
    let url: String?
}

struct SellingPrice: Decodable{
    let currencyCode: String?
    let type: String?
    let value: Double?
}
