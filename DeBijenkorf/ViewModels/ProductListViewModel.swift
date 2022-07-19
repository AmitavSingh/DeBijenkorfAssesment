//
//  ProductListViewModel.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import UIKit

protocol ProductListViewModelDelegate {
    func didReceiveProductList(response: ProductSearchReposne)
}

class ProductListViewModel {
    
    let searchText: String
    var productData : ProductSearchReposne?
    var delegate : ProductListViewModelDelegate?


    init(searchText: String){
        self.searchText = searchText
    }

    func searchProductWithText(){
        let resource = ProductListResource()
        resource.getProductListBySearchText(searchText: searchText) { result in
            DispatchQueue.main.async {
                self.delegate?.didReceiveProductList(response: result!)
            }
        }
    }
}
