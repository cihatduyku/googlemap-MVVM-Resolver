//
//  HomeViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation

protocol HomeViewModelProtocol {
    var onShowDetail: DetailViewModelBlock? { get set }
    var mapViewModel: MapViewModelProtocol { get set }
    
    func makeSearchViewModel() -> SearchViewModelProtocol
}

class HomeViewModel {
    // MARK: - HomeViewModelProtocol Properties
    var onShowDetail: DetailViewModelBlock?
    lazy var mapViewModel = makeMapViewModel()
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
    
    func makeSearchViewModel() -> SearchViewModelProtocol {
        let vm = SearchViewModel()
        vm.onItemSelected = { [weak self] model in
            self?.handleItemSelected(model: model)
        }
        return vm
    }
    
}

// MARK: - Privates
private extension HomeViewModel {
    
    func makeMapViewModel() -> MapViewModelProtocol {
        MapViewModel()
    }
    
    func handleItemSelected(model: SearchModel) {
        let annotationModel = MapItemAnnotation()
        annotationModel.location = model.location
        annotationModel.onTapped = { [weak self] annotation in
            self?.handleOnTappedAnnotation(model: model)
        }
        mapViewModel.set(annotation: annotationModel)
        mapViewModel.focus(location: model.location)
        
    }
    
    func handleOnTappedAnnotation(model: SearchModel) {
        let model = DetailModel(title: model.name, description: model.description)
        let vm = DetailViewModel(model: model)
        onShowDetail?(vm)
    }
    
}
