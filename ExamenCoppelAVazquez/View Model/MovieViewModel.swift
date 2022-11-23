import Foundation

class MovieViewModel {
    			
    func GetFavoriteMovies(idSession: String ,Movie : @escaping (Movies , Error?) -> Void){
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let url = URL(string: "https://api.themoviedb.org/3/account/AlejandroVC/favorite/movies?api_key=acd2646bc68e6b8550024d0531803ef8&session_id=\(idSession)&language=en-US&sort_by=created_at.asc&page=1")
        urlSession.dataTask(with: url!){ data, response, error in
                    print("Data \(String(describing: data))")
                    
                        if let data = data {
                            let json = try? JSONSerialization.jsonObject(with: data)
                            let movies = try! decoder.decode(Movies.self, from: data)
                            Movie(movies, nil)
                        }
                    }.resume()
            }
    
    
    func GetPopularMovie(movie : @escaping (Movies , Error?) -> Void){
            let urlSession = URLSession.shared
            let decoder = JSONDecoder()
            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=acd2646bc68e6b8550024d0531803ef8&language=en-US&page=1")
            urlSession.dataTask(with: url!){ data, response, error in
                print("Data \(String(describing: data))")
                
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data)
                    let movies = try! decoder.decode(Movies.self, from: data)
                    movie(movies, nil)
                }
               
            }.resume()
        }
    
    func GetTopRatedMovie(movie : @escaping (Movies , Error?) -> Void){
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=acd2646bc68e6b8550024d0531803ef8&language=en-US&page=1")
        urlSession.dataTask(with: url!){ data, response, error in
            print("Data \(String(describing: data))")
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                let movies = try! decoder.decode(Movies.self, from: data)
                movie(movies, nil)
            }
           
        }.resume()
    }
}
