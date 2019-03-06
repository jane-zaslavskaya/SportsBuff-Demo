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
    case followers
    
    var method: HTTPMethod {
        switch self {
        case .channels, .followers:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .channels:
            return "http://jsonplaceholder.typicode.com/photos"
        case .followers:
            return "https://uinames.com/api/?amount=10&ext=1"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .channels, .followers:
            return nil
        }
    }
}
