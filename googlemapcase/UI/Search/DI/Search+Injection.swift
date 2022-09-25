//
//  Search+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

extension Resolver {
    
    static func registerSearch() {
        register {
            R.storyboard.search.searchViewController()!
        }
        register {
            SearchViewModel()
        }.implements(SearchViewModelProtocol.self)
    }
    
}

