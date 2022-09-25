//
//  Location.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation
import CoreLocation

typealias BasicLocationBlock = (BasicLocation) -> Void

struct BasicLocation {
    let lat: Double
    let lon: Double
}

extension BasicLocation {

    static var zero: BasicLocation { BasicLocation(lat: 0, lon: 0) }
    
}

extension BasicLocation {
    
    func asCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
}
