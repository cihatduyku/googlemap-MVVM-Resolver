//
//  MapItemAnnotation.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation

typealias MapItemAnnotationBlock = (MapItemAnnotation) -> Void

class MapItemAnnotation {
    // MARK: - Properties
    let id = UUID().uuidString
    var location: BasicLocation = .zero
    var onTapped: MapItemAnnotationBlock?

    func notifyTapped() {
        onTapped?(self)
    }
    
}
