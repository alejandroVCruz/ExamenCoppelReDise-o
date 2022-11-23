import Foundation

class UserViewModel {
    
        var requestToken = RequestToken(success: false, request_token: "", expires_at: "")
        
        func Login(user: User, Logear: @escaping (RequestToken?, Error?) -> Void){
            do{
                let decoder = JSONDecoder()
                let baseURL = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=acd2646bc68e6b8550024d0531803ef8"
                let url = URL(string: baseURL)
                var urlRequest = URLRequest(url: url!)
                urlRequest.httpMethod = "POST"
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = try! JSONEncoder().encode(user)
                
                let urlSession = URLSession.shared
                urlSession.dataTask(with: urlRequest){ data, response, error in
                    guard let data = data else {
                        return
                    }
                    print("Data \(String(describing: data))")
                    self.requestToken = try! decoder.decode(RequestToken.self, from: data)
                    Logear(self.requestToken, nil)
                    
                }.resume()
            }
        }
    }

