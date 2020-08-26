//
//  EmployeeViewModal.swift
//  SwiftUINetworking
//
//  Created by shailendra singh on 26/08/20.
//  Copyright © 2020 shailendra singh. All rights reserved.
//

import Foundation

class EmployeeViewModal:ObservableObject{
    
    @Published var publishedNames:[String] = []
    @Published var employeeData:[EmployeeDatum] = []

    func recieveEmployeeData(){
        
        WebService.fetchEmployeeList()
//            .sink(receiveCompletion: { completion in
            .sink(receiveCompletion: { completion in
                
                switch completion{
                case .finished:
                    print("completed")
                    break
                case .failure(let error):
                    
                    print(error)
                    break
                }
            }, receiveValue: { value in
                self.employeeData = value
                
                for i in self.employeeData{
                    
                    self.publishedNames = self.publishedNames + ([i.employeeName ?? ""])
                }
                
            })
    }
    
    
}
