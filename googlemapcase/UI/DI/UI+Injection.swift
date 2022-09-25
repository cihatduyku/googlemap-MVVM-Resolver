//
//  UI+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

extension Resolver {
    
    static func registerUI() {
        registerMap()
        registerHome()
        registerSearch()
        registerDetail()
    }
    
}
