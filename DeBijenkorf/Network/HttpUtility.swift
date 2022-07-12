//
//  NetworkUtility.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import Foundation

class HttpUtility {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil)
            {
                do {
                    let result = try JSONDecoder().decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }
            
        }.resume()
    }
    
}
