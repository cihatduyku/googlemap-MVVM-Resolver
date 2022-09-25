//
//  AlamofireApiClient.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Alamofire
import Resolver

class AlamofireApiClient {}

// MARK: - APIClient
extension AlamofireApiClient: ApiClient {
    
    func makeRequest<T>(request: JSONRequest, completion: @escaping DecodableCompletion<T>) where T : Decodable {
        let encoding: ParameterEncoding = request.method == .get
        ? URLEncoding(destination: .methodDependent)
        : JSONEncoding.default
        let params = request.parameters
        let url = request.url
        let method = request.method.asAlamofireHTTPMethod()
        let headers = HTTPHeaders(request.headers.merged(with: commonHeaders()))
        AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers).responseData { [weak self] (response) in
            self?.handle(afDataResponse: response, completion: completion)
        }
    }
    
}

// MARK: - Private methods
private extension AlamofireApiClient {
    
    func handle<T>(afDataResponse response: AFDataResponse<Data>, completion: @escaping DecodableCompletion<T>) where T : Decodable {
        
        switch response.result {
        case.success(let data):
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
    
}

// MARK: - Private External Extensions
private extension HTTPMethod {
    
    func asAlamofireHTTPMethod() -> Alamofire.HTTPMethod {
        switch self {
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        default:
            return .get
        }
    }
    
}
