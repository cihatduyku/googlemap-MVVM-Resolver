//
//  JSONResponse.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

struct JSONResponse<T: Decodable>: Decodable{
    let data: T?
    let error: ApiError?
}
