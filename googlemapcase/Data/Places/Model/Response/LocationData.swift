//
//  LocationData.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

struct LocationData: Decodable {
    let latitude: Double?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

extension LocationData {
    
    func asBasicLocation() -> BasicLocation? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        return BasicLocation(lat: latitude, lon: longitude)
    }
    
}
