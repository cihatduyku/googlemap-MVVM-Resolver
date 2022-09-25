//
//  ApiClient.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

typealias DecodableResult<T: Decodable> = Result<T, Error>
typealias DecodableCompletion<T: Decodable> = (DecodableResult<T>) -> Void

protocol ApiClient: AnyObject {
    func makeRequest<T: Decodable>(request: JSONRequest, completion: @escaping DecodableCompletion<T>)
}

extension ApiClient {
    
    func commonHeaders() -> [String: String] {
        [:]
    }
    
}
