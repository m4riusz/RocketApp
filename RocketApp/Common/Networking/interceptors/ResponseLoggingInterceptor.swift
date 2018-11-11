//
//  ResponseLoggingInterceptor.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class ResponseLoggingInterceptor: NSObject, IResponseInterceptor {
    
    func intercept(_ response: IBaseResponse) {
        print("\nRESPONSE FROM REQUEST: \n\t\(response.url)")
        print("HEADERS: ")
        response.headers.forEach { print("\t\($0) : \($1)")}
        print("BODY: \n\t\(response.body ?? "")\n")
    }
}
