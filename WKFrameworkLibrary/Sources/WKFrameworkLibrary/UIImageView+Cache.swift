//
//  File.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import UIKit

/// 暫存區
let imageCache = NSCache<AnyObject, AnyObject>()

public extension UIImageView {
    
    /// 下載圖片或是直接取圖片
    ///
    /// - Parameter urlString: <#urlString description#>
    func cacheImage(urlString: String){
        if urlString == "" {
            return
        }
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            if data != nil {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    if self.accessibilityIdentifier == urlString {
                        self.image = imageToCache
                    }
                }
            }
            }.resume()
    }
    
    /// 移除下載圖片
    ///
    /// - Parameter urlString: <#urlString description#>
    func removeCacheImage(urlString: String){
        if urlString == "" {
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            imageCache.removeObject(forKey: imageFromCache)
        }
    }
    
}
