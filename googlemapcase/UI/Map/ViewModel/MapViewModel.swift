//
//  MapViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation

protocol MapViewModelProtocol: AnyObject {
    var onDraw: VoidBlock? { get set }
    var onFocus: BasicLocationBlock? { get set }
    var annotations: [MapItemAnnotation] { get }
    
    func focus(location: BasicLocation)
    func set(annotations: [MapItemAnnotation])
    func set(annotation: MapItemAnnotation)
}

class MapViewModel {
    // MARK: - MapViewModelProtocol
    var onDraw: VoidBlock?
    var onFocus: BasicLocationBlock?
    var annotations: [MapItemAnnotation] = []
}

// MARK: - MapViewModelProtocol
extension MapViewModel: MapViewModelProtocol {

    func set(annotations: [MapItemAnnotation]) {
        self.annotations = annotations
        onDraw?()
    }
    
    func set(annotation: MapItemAnnotation) {
        self.annotations = [annotation]
        onDraw?()
    }
    
    func focus(location: BasicLocation) {
        onFocus?(location)
    }
    
}
