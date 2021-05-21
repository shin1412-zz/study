//
//  SingleUseCase.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol SingleUseCaseDelegate {
    func getData(data: String)
}

class SingleUseCase {
    var delegate: SingleUseCaseDelegate?
}

extension SingleUseCase {
    func getData() {
        let data = "Single Responsibility"
        self.delegate?.getData(data: data)
    }
}
