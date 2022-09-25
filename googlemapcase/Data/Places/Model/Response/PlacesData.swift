//
//  PlacesData.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

struct PlacesData: Decodable {
    let formattedAddress: String?
    let geometry: GeometryData?
    
    enum CodingKeys: String, CodingKey {
        case formattedAddress = "formatted_address"
        case geometry
    }
}
