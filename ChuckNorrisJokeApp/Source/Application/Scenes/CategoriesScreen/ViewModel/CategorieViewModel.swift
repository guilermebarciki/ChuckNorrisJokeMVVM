//
//  CategorieViewModel.swift
//  ChuckNorrisJokeApp
//
//  Created by Guilerme Barciki on 10/01/22.
//

import Foundation

class CategoriesViewModel: CategoriesViewModelProtocol {
    
     private var categories: [String] = []
     weak var delegate: CategoriesViewModelDelegate?
    init(delegate: CategoriesViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadCategories() {
        APIService().categoriesRequest { result in
            
            switch result {
            case let .success(categoriesData):
                self.categories = categoriesData
                self.delegate?.didLoad()
            case let .failure(error):
                print(error)
                
            }
            
        }
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        categories.count
    }
    
    func showJoke(category: String) {
        delegate?.displayCategory(category: category)
    }
    func transporter(_ indexPath: IndexPath) -> String {
        categories[indexPath.row]
    }
    
}
