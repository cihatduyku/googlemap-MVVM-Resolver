//
//  SearchViewController.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import UIKit

class SearchViewController: BaseViewController<SearchViewModelProtocol> {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        viewModel.reloadTable = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
// MARK: - Action
extension SearchViewController {
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        viewModel.handleSearch(text: text)
    }
    
}

// MARK: - UITableView
extension SearchViewController {
    
    func setupTableView() {
        tableView.register(typeOfnib: SearchTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.itemViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.itemViewModels[indexPath.row] {
        case .regular(let viewModel):
            let cell: SearchTableViewCell = tableView.dequeue(forIndexPath: indexPath)
            cell.bind(viewModel: viewModel)
            return cell
        }
    }
    
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

