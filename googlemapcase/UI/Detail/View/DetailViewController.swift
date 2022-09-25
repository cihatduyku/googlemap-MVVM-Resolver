//
//  DetailViewController.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModelProtocol> {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
    
}

// MARK: - Action
extension DetailViewController {
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
}
