//
//  EmployeeViewController.swift
//  MVVM_designPattern
//
//  Created by sanaz bahmankhah on 01/02/2023.
//

import Foundation
import UIKit

final class EmployeeViewController: UIViewController {
    private let tableView = UITableView()
    private var model = [Employee]()
    lazy var viewModel = {
        EmployeeViewModel()
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupView()
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.getEmployees()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    func setupView() {
        registerTabelViewCell()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view = tableView
    }
    
    func registerTabelViewCell() {
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }
}

// MARK: -Protocols

extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
        else {
            return UITableViewCell()
        }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.configure(cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}


