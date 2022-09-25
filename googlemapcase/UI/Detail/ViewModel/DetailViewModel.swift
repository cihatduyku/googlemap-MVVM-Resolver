//
//  DetailViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Foundation

typealias DetailViewModelBlock = (DetailViewModelProtocol) -> Void

protocol DetailViewModelProtocol {
    var title: String { get }
    var description: String { get }
}

class DetailViewModel {
    // MARK: - DetailViewModelProtocol
    var title: String
    var description: String
    
    init(model: DetailModel) {
        self.title = model.title
        self.description = model.description
    }

}

extension DetailViewModel: DetailViewModelProtocol {}
