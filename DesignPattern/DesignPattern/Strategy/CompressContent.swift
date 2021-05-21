//
//  CompressContent.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation
import UIKit

protocol CompressionStrategy {
    func compressFiles(filePaths: [String])
}

class ZipCompressionStrategy: CompressionStrategy {
    func compressFiles(filePaths: [String]) {
        print("Zip Compression")
    }
}

class RarCompressionStrategy: CompressionStrategy {
    func compressFiles(filePaths: [String]) {
        print("Rar Compression")
    }
}

