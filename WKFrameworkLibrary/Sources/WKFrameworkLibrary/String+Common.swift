//
//  File.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import Foundation
import UIKit

public extension String {
    
    /// 容器高
    ///
    /// - Parameters:
    ///   - width: <#width description#>
    ///   - font: <#font description#>
    /// - Returns: <#return value description#>
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /// 容器寬
    ///
    /// - Parameters:
    ///   - height: <#height description#>
    ///   - font: <#font description#>
    /// - Returns: <#return value description#>
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}

