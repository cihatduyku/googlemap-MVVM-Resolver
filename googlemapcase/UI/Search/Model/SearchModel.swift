//
//  SearchModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation

typealias SearchModelBlock = (SearchModel) -> Void

struct SearchModel {
    let name: String
    let description: String
    let location: BasicLocation
}
