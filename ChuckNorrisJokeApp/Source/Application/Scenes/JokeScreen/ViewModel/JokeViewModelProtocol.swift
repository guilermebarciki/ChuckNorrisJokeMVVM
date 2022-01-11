//
//  JokeViewModelProtocol.swift
//  ChuckNorrisJokeApp
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

protocol JokeViewModelProtocol: AnyObject {
    var joke: Joke { get }
    func setup(category: String)
    func loadJoke(category: String)
}
 
protocol SearchViewDelegate: AnyObject {
    func didSearch(sucess: Bool)
}
