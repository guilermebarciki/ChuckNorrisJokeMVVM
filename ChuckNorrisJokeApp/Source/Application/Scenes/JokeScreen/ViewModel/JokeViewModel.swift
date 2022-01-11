//
//  JokeViewModel.swift
//  ChuckNorrisJokeApp
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

class JokeViewModel: JokeViewModelProtocol {
    var joke: Joke = Joke(value: "", icon_url: URL(string: ""))
    
    private var category: String?
    private weak var delegate: SearchViewDelegate?
    
    init(delegate: SearchViewDelegate?) {
        self.delegate = delegate
    }
    
    func setup(category: String) {
        self.category = category
        loadJoke(category: category)
    }
    
    func loadJoke(category: String) {
        APIService().jokeRequest(category: category) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case let .success(jokeData):
                        self.joke = jokeData
                        self.delegate?.didSearch(sucess: true)
                    case let .failure(error):
                        print(error)
                    }
                }
    }
    
    
}
