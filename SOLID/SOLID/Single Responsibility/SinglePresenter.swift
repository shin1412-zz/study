//
//  SinglePresenter.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol SinglePresenterDelegate {
    func fetchData(data: String)
}

class SinglePresenter {
    var delegate: SinglePresenterDelegate?
    var usecase: SingleUseCase?
    
    init(delegate: SinglePresenterDelegate, usecase: SingleUseCase) {
        self.delegate = delegate
        self.usecase = usecase
        self.usecase?.delegate = self
    }
}

extension SinglePresenter {
    func requestData() {
        usecase?.getData()
    }
    
    // do something
}

extension SinglePresenter: SingleUseCaseDelegate {
    func getData(data: String) {
        self.delegate?.fetchData(data: data)
    }
}
