//
//  Dictionary+Extension.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

extension Dictionary {

    func merged(with dictionary: [Key: Value]) -> [Key: Value] {
        var result = self
        for (k, v) in dictionary {
            result.updateValue(v, forKey: k)
        }
        return result
    }
    
}
