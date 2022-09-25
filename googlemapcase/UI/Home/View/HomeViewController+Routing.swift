//
//  HomeViewController+Routing.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import UIKit

extension HomeViewController {
    
    func routeToSearch(viewModel: SearchViewModelProtocol) {
        let vc: SearchViewController = resolve()
        vc.viewModel = viewModel
        present(vc, animated: true)
    }
    
    func routeToDetail(viewModel: DetailViewModelProtocol) {
        let vc: DetailViewController = resolve()
        vc.viewModel = viewModel
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
