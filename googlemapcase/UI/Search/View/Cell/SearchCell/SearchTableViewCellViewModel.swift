//
//  SearchTableViewCellViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

protocol SearchTableViewCellViewModelProtocol {
    var title: String { get }
}

class SearchTableViewCellViewModel {
    var title: String
    var model: SearchModel
    
    init(model: SearchModel) {
        self.model = model
        title = model.name
    }
}

extension SearchTableViewCellViewModel: SearchTableViewCellViewModelProtocol {}
