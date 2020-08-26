//
//  WebService.swift
//  SwiftUINetworking
//
//  Created by shailendra singh on 26/08/20.
//  Copyright © 2020 shailendra singh. All rights reserved.
//

import UIKit
import Foundation
import Combine

class WebService {

    enum ApiError:Error,LocalizedError{
        
        case unknown,apiError(reason:String)
    }
  static func fetchEmployeeList()-> AnyPublisher<[EmployeeDatum],Error>{
        
     let url = "http://dummy.restapiexample.com/api/v1/employees"
    
    guard let Url = URL(string: url)else{
    
        fatalError("invalid url")
    }

   return URLSession.shared.dataTaskPublisher(for: Url)
        .tryMap { data,response-> Data in
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else{
                    
                    throw ApiError.apiError(reason: "something went wrong")
            }
            print(data)
            return data
    }
    .decode(type: EmployeeRoot.self, decoder: JSONDecoder())
    .map{
        $0.data!
        
    }
    .receive(on: RunLoop.main)
     .eraseToAnyPublisher()
    
    }
}
