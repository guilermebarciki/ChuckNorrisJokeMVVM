
import Foundation
typealias CategoriesDataWrapperCompletionResult = ((Result<[String], Error>) -> Void)
typealias JokeDataWrapperCompletionResult = ((Result<Joke, Error>) -> Void)

class APIService {
    
    
    func categoriesRequest(completion: @escaping (CategoriesDataWrapperCompletionResult)) {
        let url = URL(string: "https://api.chucknorris.io/jokes/categories")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            if let categoriesData = try? JSONDecoder().decode([String].self, from:  data) {
                print("categories inside: \(categoriesData)")
                completion(.success(categoriesData))
            }
            
        }
        
        task.resume()
    }
    
    func jokeRequest (category: String ,completion: @escaping JokeDataWrapperCompletionResult) {
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=\(category)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            guard let jokeData =  try? JSONDecoder().decode(Joke.self, from:  data) else {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["Message" : "Can't parse json"])))
                return
            }
            
            completion(.success(jokeData))
            
        }
        
        task.resume()
    }
}
