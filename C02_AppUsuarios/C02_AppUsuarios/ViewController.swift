//
//  ViewController.swift
//  C02_AppUsuarios
//
//  Created by Dragon on 17/05/22.
//

import UIKit

struct UserName: Codable {
    var title: String
    var first: String
    var last: String
}

struct Street: Codable {
    var number: Int
    var name: String
}

struct Coodinate: Codable {
    var latitude: String
    var longitude: String
}

struct TimeZone: Codable {
    var offset: String
    var description: String
}

enum JsonTypeError: Error {
    case InvalidType
}

enum JsonType: Codable {
    
    case fromString(String)
    case fromInt(Int)
    case fromDouble(Double)
    case fromBool(Bool)
    case fromNil
    
    init(from decoder: Decoder) throws {
        if let value = try? Int(decoder.singleValueContainer().decode(Int.self)) {
            self = .fromInt(value)
            return
        }
                                   
        if let value = try? Double(decoder.singleValueContainer().decode(Double.self)) {
            self = .fromDouble(value)
            return
        }
        
        if let value = try? String(decoder.singleValueContainer().decode(String.self)) {
            self = .fromString(value)
            return
        }
        
        guard let isNil = try? decoder.singleValueContainer().decodeNil() else {
            throw JsonTypeError.InvalidType
        }
        
        if isNil {
            self = .fromNil
            return
        }
        
        throw JsonTypeError.InvalidType
    }
    
}

struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var country: String
    var postcode: JsonType
    var coordinates: Coodinate
    var timezone: TimeZone
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct RandomUser: Codable {
    var name: UserName
    var gender: String
    var email: String
    var nat: String
    var location: Location
    var picture: Picture
}

struct RandomUserResult: Codable {
    
    var results: [RandomUser]
    
}

class ViewController: UIViewController {

    var randomUsers: [RandomUser] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        reloadUsers()
        
        tableView.dataSource = self
    }
    
    func reloadUsers() {
        guard let url = URL(string: "https://randomuser.me/api/?results=5") else {
            return
        }
        
        guard let json = try? Data(contentsOf: url) else {
            return
        }
        
        print(json)
        
        guard let result = try? JSONDecoder().decode(RandomUserResult.self, from: json) else {
            print("No se puede decodificar como RandomUserResult")
            return
        }
        
        randomUsers = result.results
        
        for randomUser in result.results {
            print(randomUser)
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Hombres"
        } else {
            return "Mujeres"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            var hombres = 0
            
            for randomUser in randomUsers {
                if randomUser.gender == "male" {
                    hombres += 1
                }
            }
            
            return hombres
        } else {
            var mujeres = 0
            
            for randomUser in randomUsers {
                if randomUser.gender == "female" {
                    mujeres += 1
                }
            }
            
            return mujeres
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomUserCell")!
        
        
        if indexPath.section == 0 {
            let randomUserHombres = randomUsers.filter { $0.gender == "male" }
            
            let randomUserHombre = randomUserHombres[indexPath.row]
            
            cell.textLabel?.text = "\(randomUserHombre.name.title) \(randomUserHombre.name.first) \(randomUserHombre.name.last)"
            cell.detailTextLabel?.text = "\(randomUserHombre.gender) | \(randomUserHombre.email) | \(randomUserHombre.nat)"
            
            guard let url = URL(string: randomUserHombre.picture.thumbnail) else {
                return cell
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return cell
            }
            
            cell.imageView?.image = UIImage(data: data)
            
            return cell
        } else {
            let randomUserMujeres = randomUsers.filter { $0.gender == "female" }
            
            let randomUserMujer = randomUserMujeres[indexPath.row]
            
            cell.textLabel?.text = "\(randomUserMujer.name.title) \(randomUserMujer.name.first) \(randomUserMujer.name.last)"
            cell.detailTextLabel?.text = "\(randomUserMujer.gender) | \(randomUserMujer.email) | \(randomUserMujer.nat)"
            
            guard let url = URL(string: randomUserMujer.picture.thumbnail) else {
                return cell
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return cell
            }
            
            cell.imageView?.image = UIImage(data: data)
            
            return cell
        }
    }
    
}

