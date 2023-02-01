//
//  EmployeeViewModel.swift
//  MVVM_designPattern
//
//  Created by sanaz bahmankhah on 01/02/2023.
//

import Foundation

final class EmployeeViewModel {
    var reloadTableView: (() -> Void)?
    var employees = Employees()
    private var employeeService: EmployeeServiceProtocol
    var employeeCellViewModels = [EmployeeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(employeeService: EmployeeServiceProtocol = EmployeeService()) {
        self.employeeService = employeeService
    }
    
    func getEmployees() {
        employeeService.getEmployeeData { success, model, error in
            if success, let employees = model {
                self.fetchData(employees: employees)
            } else {
                print("error in get employee")
            }
        }
    }
    
    func fetchData(employees: Employees) {
        self.employees = employees // Cache
        var vms = [EmployeeCellViewModel]()
        for employee in employees {
            vms.append(createCellModel(employee: employee))
        }
        employeeCellViewModels = vms
    }
    
    func createCellModel(employee: Employee) -> EmployeeCellViewModel {
        let id = employee.id
        let name = employee.employeeName
        let salary = employee.employeeSalary + " $ " 
        let age = employee.employeeAge
        
        return EmployeeCellViewModel(id: id, name: name, salary: salary, age: age)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> EmployeeCellViewModel {
        return employeeCellViewModels[indexPath.row]
    }
}

