import Foundation

class PerfilViewModel{
    func GetDetail(idSession: String ,perfill : @escaping (Perfil , Error?) -> Void){
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let url = URL(string: "https://api.themoviedb.org/3/account?api_key=acd2646bc68e6b8550024d0531803ef8&session_id=\(idSession)")
        urlSession.dataTask(with: url!){ data, response, error in
                    print("Data \(String(describing: data))")
            print(url)
                        if let data = data {
                            let json = try? JSONSerialization.jsonObject(with: data)
                            let perfil = try! decoder.decode(Perfil.self, from: data)
                            perfill(perfil, nil)
                        }
                    }.resume()
            }
}
