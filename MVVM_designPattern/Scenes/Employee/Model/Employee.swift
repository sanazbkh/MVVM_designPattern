//
//  Employee.swift
//  MVVM_designPattern
//
//  Created by sanaz bahmankhah on 01/02/2023.
//

import Foundation
import UIKit
typealias Employees = [Employee]

// MARK: - Employee
struct Employee: Codable {
    let id: String
    let employeeName: String
    let employeeSalary: String
    let employeeAge: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
    }
}
