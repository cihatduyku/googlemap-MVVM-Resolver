//
//  BaseViewModel.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Foundation

typealias VoidBlock = () -> Void
typealias ErrorBlock = (Error) -> Void
typealias GoBackOptionsBlock = (GoBackOption, VoidBlock?) -> Void

protocol BaseViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    var onShowError: ErrorBlock? { get set }
    var onGoBack: GoBackOptionsBlock? { get set }
    
    // MARK: - Functions
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewDidDisappear()
    func viewWillDisappear()
    func applyLocalization()
}

// MARK: - Default Methods
extension BaseViewModelProtocol {
    
    func showError(error: Error) {
        onShowError?(error)
    }
    
    func goBack(options: GoBackOption? = nil, completion: VoidBlock? = nil) {
        onGoBack?(options ?? .default, completion)
    }
    
}

class BaseViewModel {
    
    // MARK: - BaseViewModelProtocol Properties
    var onShowError: ErrorBlock?
    var onGoBack: GoBackOptionsBlock?
    
    // MARK: - BaseViewModelProtocol Methods
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewDidDisappear() {}
    func viewWillDisappear() {}
    func applyLocalization() {}
    
}

// MARK: - BaseViewModelProtocol
extension BaseViewModel: BaseViewModelProtocol {}
