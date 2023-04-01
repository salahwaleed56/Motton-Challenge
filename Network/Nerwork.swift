//
//  Nerwork.swift
//  Motton Challnge
//
//  Created by salah waleed on 01/04/2023.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    private init(){
        
}
    func fetchresult(CompleationHandler: @escaping (Userdetalis?)-> Void){
        
        guard let url = URL(string: "https://api.unsplash.com/photos") else {
            print("invalid api key")
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Client-ID Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM", forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, erorr in
            guard let data = data else {return}
       
        do {
            
    
  
            let result = try JSONDecoder().decode(Userdetalis.self, from: data)
            CompleationHandler(result)
           
        }catch{
            print(error.localizedDescription)
          
        }
        
        
        
    }
    
        task.resume()
}
}
