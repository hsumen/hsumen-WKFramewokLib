//
//  File.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import Foundation
import UIKit

private extension UIColor {
    
    //This is sample code.Don't use it.
    class var testBlack: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "你好")!
            } else {
                return UIColor(hexString: "#ff33ff")
            }
        }
    }
    
}
