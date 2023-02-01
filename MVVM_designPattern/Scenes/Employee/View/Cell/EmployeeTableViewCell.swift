//
//  EmployeeTableViewCell.swift
//  MVVM_designPattern
//
//  Created by sanaz bahmankhah on 01/02/2023.
//

import Foundation
import UIKit

final class EmployeeTableViewCell: UITableViewCell {
    static let identifier = "employeeTabelViewCell"
    private var stack = UIStackView()
    private let id = UILabel()
    private let name = UILabel()
    private let salary = UILabel()
    private let age = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStack()
        configStack()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ viewModel: EmployeeCellViewModel) {
        id.text = "id: \(viewModel.id)"
        name.text = "name: \(viewModel.name)"
        salary.text = "salary: \( viewModel.salary)"
        age.text = "age: \(viewModel.age)"
    }
    
    func configStack() {
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
    }
    
    func setupStack() {
        stack = UIStackView(arrangedSubviews: [id,name,salary,age])
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
}
