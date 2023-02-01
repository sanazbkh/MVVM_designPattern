//
//  EmployeeService.swift
//  MVVM_designPattern
//
//  Created by sanaz bahmankhah on 01/02/2023.
//

import Foundation

protocol EmployeeServiceProtocol {
    func getEmployeeData(completion: @escaping (_ success: Bool, _ results: Employees?, _ error: String?) -> ())
}

class EmployeeService: EmployeeServiceProtocol {
    func getEmployeeData(completion: @escaping (Bool, Employees?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Employees.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
}
