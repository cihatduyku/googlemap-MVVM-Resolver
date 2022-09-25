//
//  JSONRequest.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

struct JSONRequest {
    let url: URL
    let method: HTTPMethod
    var headers: [String: String] = [:]
    var parameters: [String: Any] = [:]
}
