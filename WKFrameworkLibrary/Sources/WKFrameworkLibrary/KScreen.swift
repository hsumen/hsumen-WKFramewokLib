//
//  File.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import Foundation
import UIKit

public struct KScreen {
    /// Screen bounds size.
    public static let  screenRect =  UIScreen.main.bounds
    
    /// Screen Height
    public static let  screenHeight = UIScreen.main.bounds.size.height
    
    /// Screen Width
    public static let  screenWidth = UIScreen.main.bounds.size.width
    
    /// cut range include status bar.
    public static var  screenHeightCutSafeArea:CGFloat{
        get{
            if #available(iOS 11.0, *) {
                let window = UIApplication.shared.keyWindow
                guard let topPadding = window?.safeAreaInsets.top else { return UIScreen.main.bounds.size.height - 20 }
                guard let bottomPadding = window?.safeAreaInsets.bottom else { return UIScreen.main.bounds.size.height - 20 }
                return UIScreen.main.bounds.size.height - topPadding - bottomPadding
            }else{
                return UIScreen.main.bounds.size.height - 20
            }
        }
    }
}

@objc public class KScreens: NSObject {
    private override init() {}
    @objc public class func screenRect() -> CGRect { return KScreen.screenRect }
    @objc public class func screenHeight() -> CGFloat { return KScreen.screenHeight }
    @objc public class func screenWidth() -> CGFloat { return KScreen.screenWidth }
}
