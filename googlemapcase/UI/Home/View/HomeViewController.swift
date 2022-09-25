//
//  HomeViewController.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModelProtocol> {

    @IBOutlet weak var mapView: MapView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        mapView.configure(viewModel: viewModel.mapViewModel)
        viewModel.onShowDetail = { [weak self] vm in
            self?.routeToDetail(viewModel: vm)
        }
    }

}

// MARK: - Actions
extension HomeViewController {
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        routeToSearch(viewModel: viewModel.makeSearchViewModel())
    }

}
