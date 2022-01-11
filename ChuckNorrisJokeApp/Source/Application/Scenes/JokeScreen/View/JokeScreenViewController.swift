

import Foundation
import UIKit
import Kingfisher

class JokeScreenViewController: UIViewController {
  
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var randomImage: UIImageView!
//    @IBOutlet weak var topBar: UINavigationBar!
    private lazy var viewModel: JokeViewModelProtocol = JokeViewModel(delegate: self)
    
    let category: String
    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupNavBar()
        setupJoke()     
    }
    
    private func setupNavBar() {
        var navigationBar = self.navigationController?.navigationBar
        self.title = category

        navigationBar?.backgroundColor = .yellow
        self.navigationItem.backButtonTitle = "Categories"


    }
    
    func setupJoke() {
        jokeLabel.text = "Loading..."
        viewModel.setup(category: category)
    }

    
    
}


extension JokeScreenViewController: SearchViewDelegate {
    func didSearch(sucess: Bool) {
        if sucess {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else { return }
                self.jokeLabel.text = self.viewModel.joke.value ?? ""
                self.randomImage.kf.setImage(with: self.viewModel.joke.icon_url ?? URL(string: ""))
 
                self.setupNavBar()
            }
        }
    }
}


