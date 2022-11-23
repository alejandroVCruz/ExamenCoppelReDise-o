import Foundation

class RequestTokenViewModel{
    
    var requestToken = RequestToken(success: false, request_token: "", expires_at: "")

    func GetRequestToken(Token : @escaping (RequestToken? , Error?) -> Void){
        let decoder = JSONDecoder()
        let urlSession = URLSession.shared
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=acd2646bc68e6b8550024d0531803ef8")
        urlSession.dataTask(with: url!){ data, response, error in
            print("Data \(String(describing: data))")

            guard let data = data else {
                return
            }
            
            self.requestToken = try! decoder.decode(RequestToken.self, from: data)
            Token(self.requestToken, nil)
            
        }.resume()
    }
}


