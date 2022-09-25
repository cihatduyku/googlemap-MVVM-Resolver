//
//  SearchViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import Resolver

protocol SearchViewModelProtocol: BaseViewModelProtocol {
    var reloadTable: VoidBlock? { get set }
    var itemViewModels: [SearchTableItem] { get }
    
    func didSelectRow(forRowAt indexPath: IndexPath)
    func handleSearch(text: String)
}

class SearchViewModel: BaseViewModel {
    // MARK: - Injected
    @Injected var getPlacesUseCase: GetPlacesUseCaseProtocol
    
    
    // MARK: - SearchViewModelProtocol Properties
    var reloadTable: VoidBlock?
    var itemViewModels: [SearchTableItem] = []
    
    // MARK: - Public
    var onItemSelected: SearchModelBlock?
}

extension SearchViewModel: SearchViewModelProtocol {
    
    func handleSearch(text: String) {
        let param = GetPlacesParameter(searchText: text)
        getPlacesUseCase(param: param) { [weak self] result in
            switch result {
            case .success(let model):
                self?.itemViewModels = model.map {
                    .regular(cellViewModel: SearchTableViewCellViewModel(model: $0))
                }
                self?.reloadTable?()
            case .failure(let error):
                self?.showError(error: error)
            }
        }
    }
    
    func didSelectRow(forRowAt indexPath: IndexPath) {
        switch itemViewModels[indexPath.row] {
        case .regular(let viewModel):
            goBack(options: .dismiss) {
                self.onItemSelected?(viewModel.model)
            }
        }
    }
    
}
