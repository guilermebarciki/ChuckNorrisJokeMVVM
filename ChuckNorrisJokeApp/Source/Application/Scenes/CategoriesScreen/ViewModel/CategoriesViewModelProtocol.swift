
import Foundation

protocol CategoriesViewModelProtocol: AnyObject {
    func loadCategories()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    //func dtoForRows(indexPath: IndexPath) -> CategoryCellDTO
        func transporter(_ indexPath: IndexPath) -> String
    func showJoke(category: String)
}

protocol CategoriesViewModelDelegate: AnyObject {
    func didLoad()
    func displayCategory(category: String)
}
