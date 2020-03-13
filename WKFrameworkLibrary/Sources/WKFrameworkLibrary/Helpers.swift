//
//  File.swift
//  
//
//  Created by Hsu on 2020/1/3.
//

import UIKit

public struct KLog {
    
    static func assertionFailure(
        _ message: @autoclosure () -> String,
        file: StaticString = #file,
        line: UInt = #line)
    {
        Swift.assertionFailure("[assertionFailure] \(message())", file: file, line: line)
    }
    
    static func fatalError(
        _ message: @autoclosure () -> String,
        file: StaticString = #file,
        line: UInt = #line) -> Never
    {
        Swift.fatalError("[fatalError] \(message())", file: file, line: line)
    }
    
    static func print(_ items: Any...) {
        let s = items.reduce("") { result, next in
            return result + String(describing: next)
        }
        Swift.print("[print] \(s)")
    }
}
