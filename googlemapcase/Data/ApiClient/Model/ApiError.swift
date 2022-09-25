//
//  ApiError.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

struct ApiError: Decodable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "error_message"
    }
    
}
