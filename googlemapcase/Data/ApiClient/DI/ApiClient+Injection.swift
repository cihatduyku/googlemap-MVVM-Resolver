//
//  ApiClient+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

extension Resolver {
    
    static func registerApiClient() {
        register {
            AlamofireApiClient()
        }.implements(ApiClient.self)
    }
    
}
