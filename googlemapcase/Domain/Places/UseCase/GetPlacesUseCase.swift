//
//  GetPlacesUseCase.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

typealias SearchResult = Result<[SearchModel], Error>
typealias SearchCompletion = (SearchResult) -> Void

protocol GetPlacesUseCaseProtocol {
    func callAsFunction(param: GetPlacesParameter, completion: @escaping SearchCompletion)
}
 
class GetPlacesUseCase {
    
    // MARK: - Injected
    @Injected var repository: PlacesRepository
}

extension GetPlacesUseCase: GetPlacesUseCaseProtocol {
    
    func callAsFunction(param: GetPlacesParameter, completion: @escaping SearchCompletion) {
        let request = param.asRequest()
        repository.getPlaces(request: request) { result in
            switch result {
            case .success(let response):
                completion(response.asResult())
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Private External Extensions
private extension GetPlacesParameter {
    
    func asRequest() -> PlacesRequest {
        PlacesRequest(input: searchText)
    }

}

private extension PlacesResponse {
    
    func asResult() -> SearchResult {
        var result = candidates.map { candidate in
            SearchModel(name: candidate.geometry?.name ?? "",
                        description: candidate.formattedAddress ?? "",
                        location: candidate.geometry?.location?.asBasicLocation() ?? .zero)
        }
        if result.isEmpty {
            result = [SearchModel(name: "ExampleName",
                                  description: "ExampleDescription",
                                  location: BasicLocation(lat: 41, lon: 29))]
        }
        return .success(result)
    }
    
}
