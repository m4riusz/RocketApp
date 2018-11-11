//
//  AuthTokenInterceptor.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class AuthTokenInterceptor: NSObject, IRequestInterceptor {
    fileprivate static let authTokenHeader: String = "Auth-Token"
    
    func intercept(_ request: IBaseRequest) {
        request.headers[AuthTokenInterceptor.authTokenHeader] = "123"
    }
}
