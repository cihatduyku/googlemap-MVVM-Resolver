//
//  MapView.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import UIKit
import GoogleMaps

class MapView: NibLoadableView {
    
    // MARK: - Overridden
    @IBOutlet private weak var mapView: GMSMapView!
    
    // MARK: - Overridden
    override var nibNameOrNil: String? { "MapView" }
    weak var viewModel: MapViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    public func configure(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel
        viewModel.onDraw = { [weak self] in
            viewModel.annotations.forEach {
                self?.makeMarker(annotation: $0)
            }
        }
        viewModel.onFocus = { [weak self] location in
            self?.focusMap(location: location)
        }
    }
    
   
    
}

// MARK: - Privates
private extension MapView {
    
    func makeMarker(annotation: MapItemAnnotation) {
        let marker = GMSMarker()
        marker.position = annotation.location.asCLLocationCoordinate2D()
        marker.userData = ["index": annotation.id]
        marker.map = mapView
    }
    
    func focusMap(location: BasicLocation) {
        let camera = GMSCameraPosition.camera(withLatitude: location.lat,
                                              longitude: location.lon,
                                              zoom: 6.0)
        mapView.camera = camera
    }

}

extension MapView: GMSMapViewDelegate{
   
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        viewModel?.annotations.filter {
            if let dict = marker.userData as? [String : String],
                $0.id == dict["index"] {
                return true
            }
            return false
        }.forEach {
            $0.notifyTapped()
        }
        return true
    }
    
}
