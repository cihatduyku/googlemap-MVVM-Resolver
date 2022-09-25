//
//  SearchTableViewCell.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel: SearchTableViewCellViewModel?
}

// MARK: - Public Methods
extension SearchTableViewCell {
    
    func bind(viewModel: SearchTableViewCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
    
}
