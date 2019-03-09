//
//  APIClient.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    @discardableResult
    static func performRequest<T:Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
    
    static func getChannels(completion: @escaping (Result<[Channel]>) -> Void) {
        performRequest(route: APIRouter.channels, completion: completion)
    }
    
    static func getFollowers(completion: @escaping (Result<[Follower]>) -> Void) {
        performRequest(route: APIRouter.followers, completion: completion)
    }
}
