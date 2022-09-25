//
//  NibLoadableView.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import UIKit

protocol NibLoadable: UIView {
    var contentView: UIView! { get set }
}

extension NibLoadable {

    func loadContentView(fromNib nibName: String? = nil, bundle: Bundle? = nil) {
        let nibName = nibName ?? String(describing: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }

}

class NibLoadableView: UIView, NibLoadable {

    var contentView: UIView!

    var nibNameOrNil: String? { nil }
    var nibBundleOrNil: Bundle? { nil }

    convenience init() {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    private func loadView() {
        if let nibName = nibNameOrNil {
            loadContentView(fromNib: nibName, bundle: nibBundleOrNil)
        }
        viewDidLoad()
    }

    func viewDidLoad() {}

}
