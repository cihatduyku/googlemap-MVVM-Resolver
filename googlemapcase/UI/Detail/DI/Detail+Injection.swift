//
//  Detail+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

extension Resolver {
    
    static func registerDetail() {
        register {
            R.storyboard.detail.detailViewController()!
        }
        register { (_, args) in
            DetailViewModel(model: args())
        }.implements(DetailViewModelProtocol.self)
    }
    
}
