//
//  ProductListViewModel.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import UIKit

class ProductListViewModel {
    
    let searchText: String

    init(searchText: String){
        self.searchText = searchText
    }

    func searchProductWithText(){
        let resource = ProductListResource()
        resource.getProductListBySearchText(searchText: searchText) { result in
            debugPrint(result)
        }
    }
}
