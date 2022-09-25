//
//  BaseRepository.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

class BaseRemoteRepository<T> {
    
    let urls: T
    
    init() {
        urls = resolve()
    }
    
    init(apiUrls: T) {
        urls = apiUrls
    }
    
}
