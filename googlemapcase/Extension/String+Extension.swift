//
//  String+Extension.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

extension String {
    var url: URL? { URL(string: self) }
    
    var appendBaseApiURL: URL {
        ("https://maps.googleapis.com/maps/api/" + self).url!
    }
}
