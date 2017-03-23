//
//  Extensions.swift
//  FengNiao
//
//  Created by wynn on 2017/3/22.
//
//

import Foundation
import PathKit

extension String {
    var fullRange: NSRange {
        return NSMakeRange(0, utf16.count)
    }
    
    func plainName(extensions: [String]) -> String {
        let p = Path(self.lowercased())
        let result: String
        if let ext = p.extension, extensions.contains(ext) {
            result = p.lastComponentWithoutExtension
        } else {
            result = p.lastComponent
        }
        
        var r = result
        if r.hasSuffix("@2x") || r.hasSuffix("@3x") {
            r = String(describing: r.utf16.dropLast(3))
        }
        
        return r
    }
}
