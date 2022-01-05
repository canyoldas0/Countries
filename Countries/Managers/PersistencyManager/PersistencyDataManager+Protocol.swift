//
//  File name: PersistencyDataManager+Protocol.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 5.01.2022
//  
//

import Foundation

protocol PersistencyDataProtocol {
    
    func getFavoriteItems(with completion: @escaping ([CountryData]) -> Void)
    func addFavorite(with data: CountryData)
    func removeFavourite(with data: CountryData)
    func checkExists(with data: CountryData) -> Bool
}

struct PersistencyContainer: Codable {
    let data: [CountryData]
}

class PersistencyDataManager: PersistencyDataProtocol {
    
    static let KEY = "FavoriteCountries"
    
    private let queue = DispatchQueue(label: "snycQueue", qos: .default)
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func getFavoriteItems(with completion: @escaping ([CountryData]) -> Void) {
        queue.sync {
            completion(getList())
        }
    }
    
    func addFavorite(with data: CountryData) {
        queue.sync {
            var list = getList()
            list.append(data)
            saveList(with: list)
        }
    }
    
    func removeFavourite(with data: CountryData) {
        queue.sync {
            saveList(with: getList().filter({ $0.wikiDataID != data.wikiDataID }))
        }
    }
    
    func checkExists(with data: CountryData) -> Bool {
        queue.sync {
            return getList().contains(where: { $0.wikiDataID == data.wikiDataID })
        }
    }
    
    private func getList() -> [CountryData] {
        guard let data = UserDefaults.standard.object(forKey: PersistencyDataManager.KEY) as? Data else {
            return []
        }
        if let decodedData = try? decoder.decode(PersistencyContainer.self, from: data) {
            return decodedData.data
        }
        return []
    }
    
    private func saveList(with data: [CountryData]) {
        let data = PersistencyContainer(data: data)
        if let encodedData = try? encoder.encode(data) {
            UserDefaults.standard.set(encodedData, forKey: PersistencyDataManager.KEY)
        }
    }
    
}
