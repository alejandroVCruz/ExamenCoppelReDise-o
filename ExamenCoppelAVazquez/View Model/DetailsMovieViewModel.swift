import Foundation

class DetailsMovie {
    func GetDetailMovie(idMovie: Int , moviedetail : @escaping (Movie , Error?) -> Void){
            let urlSession = URLSession.shared
            let decoder = JSONDecoder()
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(idMovie)?api_key=acd2646bc68e6b8550024d0531803ef8&language=en-US")
            urlSession.dataTask(with: url!){ data, response, error in
                print("Data \(String(describing: data))")
                
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data)
                    let movie = try! decoder.decode(Movie.self, from: data)
                    moviedetail(movie, nil)
                }
               
            }.resume()
        }
}
