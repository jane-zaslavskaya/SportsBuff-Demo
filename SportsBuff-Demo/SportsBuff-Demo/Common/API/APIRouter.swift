//
//  APIRouter.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case channels
    
    var method: HTTPMethod {
        switch self {
        case .channels:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .channels:
            return "http://jsonplaceholder.typicode.com/photos"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .channels:
            return nil
        }
    }
}
