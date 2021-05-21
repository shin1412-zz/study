//
//  ViewUseCase.swift
//  MVP
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol ViewUseCaseDelegate {
    func getData(data: Flick)
}

class ViewUseCase {
    var delegate: ViewUseCaseDelegate?
}

extension ViewUseCase {
    func fetchAlbum(requestModel: PhotoParam, completionHandler: @escaping (Flick) -> Void) {
        let url = URL(string: Constants.url)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let filmSummary = try? JSONDecoder().decode(Flick.self, from: data) {
                completionHandler(filmSummary)
                self.delegate?.getData(data: filmSummary)
            }
        })
        task.resume()
    }
}
