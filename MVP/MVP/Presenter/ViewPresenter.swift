//
//  ViewPresenter.swift
//  MVP
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol ViewPresenterDelegate {
    func fetchData(data: Flick)
}

class ViewPresenter {
    var delegate: ViewPresenterDelegate?
    var usecase: ViewUseCase?
    
    init(delegate: ViewPresenterDelegate, usecase: ViewUseCase) {
        self.delegate = delegate
        self.usecase = usecase
        self.usecase?.delegate = self
    }
}

extension ViewPresenter {
    func requestData(requestModel: PhotoParam) {
        self.usecase?.fetchAlbum(requestModel: requestModel) { (data) in 
        }
    }
}

extension ViewPresenter: ViewUseCaseDelegate {
    func getData(data: Flick) {
        self.delegate?.fetchData(data: data)
    }
}
