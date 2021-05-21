//
//  SearchStrategy.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation

// client
class SearchStrategy {
    var strategy: Strategy?
    
    init() {
        strategy = MusicStrategy()
    }

    func setStrategy(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func search() -> String {
        strategy?.search() ?? ""
    }
}
