//
//  LazyImageView.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 12/07/2022.
//

import Foundation
import UIKit

class LazyImageView: UIImageView{
    
    func loadImage(imageUrl: URL, placeHolderImage:String){
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageUrl){
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
