import Foundation

struct RequestToken: Codable{
    let success : Bool
    let request_token : String
    let expires_at : String
}

