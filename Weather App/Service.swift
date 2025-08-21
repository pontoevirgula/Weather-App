//
//  Service.swift
//  Weather App
//
//  Created by Carlos Santos on 20/08/25.
//

import Foundation

struct City{
    let lat : String
    let lon : String
    let name : String
}

class Service{
    private let baseURL : String = "https://api.openweathermap.org/data/2.5/forecast"
    private let apiKey : String = "92dd787507548c9ca7e02cd139ec6408"
    private let session = URLSession.shared
    
    func fetchData(city : City,_ completion: @escaping (ForecastResponse?) -> Void){
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            }catch {
                
                print(error)
                if let jsonString = String(data: data, encoding: .utf8) {
                   print("JSON de resposta: \(jsonString)")
                }
                completion(nil)
            }
            
        }
        
        task.resume()
    }
}


struct ForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast] // A lista de previsões de 3 horas
    let city: CityInfo // Informações da cidade
}

// Você também precisa de uma struct para as informações da cidade
struct CityInfo: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let country: String
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}

// E uma para as coordenadas
struct Coordinates: Codable {
    let lat: Double
    let lon: Double
}

struct Forecast: Codable {
    let dt: Int // Data/hora da previsão
    let main: MainInfo
    let weather: [Weather]
    let wind: WindInfo
    
}

// Estrutura para a chave 'main'
struct MainInfo: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

// Estrutura para a chave 'wind'
struct WindInfo: Codable {
    let speed: Double
    let deg: Int
}

struct Weather: Codable {
    let id : Int
    let main, description,icon: String
}
