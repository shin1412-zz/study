//
//  Strategy.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation
 
// context
protocol Strategy {
    func search() -> String
}

//strategies
class MusicStrategy: Strategy {
    func search() -> String {
        return "Music search"
    }
}

class MovieStrategy: Strategy {
    func search() -> String {
        return "Movie search"
    }
}

class MangaStrategy: Strategy {
    func search() -> String {
        return "Manga search"
    }
}

class AnimeStrategy: Strategy {
    func search() -> String{
        return "Anime search"
    }
}
