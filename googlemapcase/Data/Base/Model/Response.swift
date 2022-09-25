//
//  Response.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

protocol Response: Decodable {
    var status: String? { get }
}
