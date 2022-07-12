//
//  ProductListResource.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import Foundation

class ProductListResource {
    
    func getProductListBySearchText(searchText: String, completion: @escaping(_ result: ProductSearchReposne?) -> Void){
        
        let httpUtility = HttpUtility()
        let urlEncoded = searchText.utf8

        let endPoint = "\(ApiEndpoints.productSearch)?text=\(urlEncoded)"
        let requestUrl = URL(string: endPoint)!
        httpUtility.getApiData(requestUrl: requestUrl, resultType: ProductSearchReposne.self) { productData in
            _ = completion(productData)
        }
        
    }
}
