//
//  BaseViewController.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import UIKit
import Resolver

class BaseViewController<T>: UIViewController {
    
    // MARK: - Injected
    var viewModel: T!
    
    // MARK: - Computed
    private var baseViewModel: BaseViewModelProtocol? { viewModel as? BaseViewModelProtocol }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resolveProperties()
        baseViewModel?.viewDidLoad()
        bindViewModel()
        subscribeViewModel()
        applyLocalization()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        baseViewModel?.viewWillAppear()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        baseViewModel?.viewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        baseViewModel?.viewWillDisappear()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        baseViewModel?.viewDidDisappear()
    }
    private func resolveProperties() {
        viewModel = viewModel ?? Resolver.optional()
    }
    
    // MARK: - Public Methods
    func applyLocalization() {}
    
    func bindViewModel() {}
}

private extension BaseViewController {
    
    func subscribeViewModel() {
        baseViewModel?.onShowError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showError(error: error)
            }
        }
        baseViewModel?.onGoBack = { [weak self] options, completion in
            DispatchQueue.main.async {
                self?.goBack(options: options, animated: true, completion: completion)
            }
        }
    }
    
    func goBack(options: GoBackOption = .default, animated: Bool = true, completion: VoidBlock? = nil) {
        switch options {
        case .dismiss:
            dismiss(animated: animated, completion: completion)
        case .pop:
            navigationController?.popViewController(animated: animated, completion: completion)
        case .default:
            let option: GoBackOption = (navigationController?.viewControllers.count ?? 0) > 1
            ? .pop
            : .dismiss
            goBack(options: option, animated: animated, completion: completion)
        case .toTheRoot:
            navigationController?.popToRootViewController(animated: true, completion: completion)
        }
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
