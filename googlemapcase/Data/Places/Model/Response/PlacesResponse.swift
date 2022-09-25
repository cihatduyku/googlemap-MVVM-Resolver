//
//  PlacesResponse.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

//https://developers.google.com/maps/documentation/places/web-service/search-find-place

struct PlacesResponse: Response {
    var status: String?
    let candidates: [PlacesData]
}
