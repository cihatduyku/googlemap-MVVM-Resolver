//
//  PlacesRepository.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

typealias PlacesDataResult = Result<PlacesResponse, Error>
typealias PlacesDataCompletion = (PlacesDataResult) -> Void

protocol PlacesRepository {
    func getPlaces(request: PlacesRequest, completion: @escaping PlacesDataCompletion)
}

class PlacesRemoteRepository: PlacesRepository {
   
    @Injected var apiClient: ApiClient
    
    func getPlaces(request: PlacesRequest, completion: @escaping PlacesDataCompletion) {
        let url = "place/findplacefromtext/json".appendBaseApiURL
        let request = JSONRequest(url: url,
                                  method: .get,
                                  parameters: request.asJSONParameters())
        apiClient.makeRequest(request: request, completion: completion)
    }
    
}
