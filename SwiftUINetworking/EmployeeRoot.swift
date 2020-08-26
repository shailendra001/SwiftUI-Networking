//
//  EmployeeRoot.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 26, 2020

import Foundation

struct EmployeeRoot : Codable {

        let data : [EmployeeDatum]?
        let status : String?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case status = "status"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = try values.decodeIfPresent([EmployeeDatum].self, forKey: .data)
                status = try values.decodeIfPresent(String.self, forKey: .status)
        }

}
struct EmployeeDatum : Codable {

        let employeeAge : String?
        let employeeName : String?
        let employeeSalary : String?
        let id : String?
        let profileImage : String?

        enum CodingKeys: String, CodingKey {
                case employeeAge = "employee_age"
                case employeeName = "employee_name"
                case employeeSalary = "employee_salary"
                case id = "id"
                case profileImage = "profile_image"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                employeeAge = try values.decodeIfPresent(String.self, forKey: .employeeAge)
                employeeName = try values.decodeIfPresent(String.self, forKey: .employeeName)
                employeeSalary = try values.decodeIfPresent(String.self, forKey: .employeeSalary)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        }

}
