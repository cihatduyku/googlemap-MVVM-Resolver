//
//  Encodable+Extension.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

extension Encodable {
    
    func asJSONParameters() ->  [String: Any] {
        guard let encoded = try? JSONEncoder().encode(self),
        let json = try? JSONSerialization.jsonObject(with: encoded, options: []) as? [String: Any]
            else { return [:] }
        return json
    }
 
}
