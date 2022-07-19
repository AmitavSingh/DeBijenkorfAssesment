//
//  Extentions.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 12/07/2022.
//

import Foundation
import UIKit


extension Double {
    func toString() -> String {
        return String(format: "%.2f",self)
    }
}

extension UICollectionView {

    func setMessage(_ message: String) -> UILabel {
        let messageLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        messageLabel.sizeToFit()
        messageLabel.textColor = .systemBlue
        messageLabel.isUserInteractionEnabled = true

        self.backgroundView = messageLabel
        return messageLabel
    }

    func restore() {
        self.backgroundView = nil
    }
}

extension URL {
    var sanitise: URL {
        if var components = URLComponents(url: self, resolvingAgainstBaseURL: false) {
            if components.scheme == nil {
                components.scheme = "https"
            }
            return components.url ?? self
        }
        return self
    }
}
