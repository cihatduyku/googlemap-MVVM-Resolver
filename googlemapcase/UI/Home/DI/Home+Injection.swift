//
//  Home+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Resolver

extension Resolver {
    
    static func registerHome() {
        register {
            R.storyboard.home.homeViewController()!
        }
        register {
            HomeViewModel()
        }.implements(HomeViewModelProtocol.self)
    }
    
}

