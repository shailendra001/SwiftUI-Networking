//
//  ContentView.swift
//  SwiftUINetworking
//
//  Created by shailendra singh on 26/08/20.
//  Copyright © 2020 shailendra singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var employeViewModal=EmployeeViewModal()
   
    var body: some View {
       // Text("Hello, World!")
        
        Form{
            
            Section{
                Button(action:{ self.employeViewModal.recieveEmployeeData()}) { 
                    Text("get employee data")
                }
            }
            
            Section{
                
                List(employeViewModal.publishedNames,id:\.self){ publishedname in
                   Text("\(publishedname)")
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
