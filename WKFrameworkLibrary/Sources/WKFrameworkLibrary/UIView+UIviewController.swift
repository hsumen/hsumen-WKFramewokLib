//
//  File.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import Foundation
import UIKit

public extension UIView {
    
    /// 最上層的ViewController
    ///
    /// - Returns: <#return value description#>
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
}

