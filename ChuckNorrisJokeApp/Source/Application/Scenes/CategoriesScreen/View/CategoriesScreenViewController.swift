

import UIKit
import SwiftUI

class CategoriesScreenViewController: UIViewController {
    private lazy var viewModel = CategoriesViewModel(delegate: self)

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tentando customizar navigation bar
        self.title = "Categories"
        self.navigationController?.navigationBar.backgroundColor = .yellow
        
       setupView()

    }
   
   

   
}
// MARK: private extension

private extension CategoriesScreenViewController {
    func setupView() {
        register()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.loadCategories()
        
        
    }
    
    func register() {
        tableView.register(CategoriesTableViewCell.self)
    }
}
// MARK: CategorieViewModelDelegate

extension CategoriesScreenViewController: CategoriesViewModelDelegate {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func displayCategory(category: String) {
        let viewController = JokeScreenViewController(category: category)
                navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
// MARK: TableViewDelegate e DataSource

extension CategoriesScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    // precisa refatorar \/  --------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeCell(CategoriesTableViewCell.self, indexPath)
        cell.categoryLabel.text = viewModel.transporter(indexPath)
        return cell
        
    }
    // ---------------------------------------------
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showJoke(category: viewModel.transporter(indexPath))
        
    }
    
    
}




   
