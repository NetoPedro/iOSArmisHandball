//
//  ModelObjects.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 07/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation
import UIKit

struct Athlete :Codable {
    let pk : Int
    let name : String
    let gender : String
    let clubName : String
    let nationality : String
    let photo : Data?
    let teamPk : Int
    
    enum CodingKeys : String, CodingKey {
        case photo = "pic"
        case pk, name,clubName,gender,nationality,teamPk
    }
    
    init(){
        let logo = UIImage(named: "athlete")
        pk = 0
        name = "Ronaldo"
        gender = "Male"
        clubName = "Real Madrid"
        nationality = "Portuguese"
        teamPk = 0
        photo = (UIImagePNGRepresentation(logo!)! as Data)
    }
    init(_ type : Int){
        let logo = UIImage(named: "athlete")
        pk = 1
        name = "Messi"
        gender = "Male"
        clubName = "Barcelona"
        nationality = "Argentine"
        teamPk = 0
        photo = (UIImagePNGRepresentation(logo!)! as Data)
    }
}

struct Edition  :Codable{
    let pk : Int
    let season : String
    
    init(){
        pk = 0
        season = "2016/2017"
    }
    init(_ type : Int){
        pk = 1
        season = "2017/2018"
    }
}
struct MatchDay : Codable {
    let pk : Int
    let name : String
    
    init(){
        pk = 0
        name = "Jornada 1"
    }
    init(_ type: Int){
        pk = 0
        name = "Jornada 2"
    }
}

struct Game : Codable {
    let pk : Int
    let matchDay : String
    let homeTeamPk : Int
    let visitorTeamPk : Int
    let homeClubName : String
    let visitorClubName : String
    let homeTeamResult : Int
    let visitorTeamResult : Int
    let homeClubLogo: Data?
    let visitorClubLogo : Data?
    let date : String
    enum CodingKeys : String, CodingKey {
        case visitorClubLogo = "visitorLogo"
        case homeClubLogo = "homeLogo"
        case pk, matchDay,homeTeamPk,visitorTeamPk,visitorClubName,homeClubName,homeTeamResult,visitorTeamResult,date
    }
    
    init(){
        let logo = UIImage(named: "club")

        pk = 1 ;
        matchDay = "MatchDay"
        homeTeamPk = 0
        visitorTeamPk = 1
        homeClubName = "Real Madrid"
        homeTeamResult = 21
        homeClubLogo = (UIImagePNGRepresentation(logo!)! as Data)
        visitorClubName = "Barcelona"
        visitorTeamResult = 80
        visitorClubLogo = (UIImagePNGRepresentation(logo!)! as Data)
        date = "22-10-2017"
    }
    init(type:Int ){
        let logo = UIImage(named: "club")

        pk = 1 ;
        matchDay = "MatchDay"
        homeTeamPk = 0
        visitorTeamPk = 1
        homeClubName = "ManUnited"
        homeTeamResult = 10
        homeClubLogo = (UIImagePNGRepresentation(logo!)! as Data)
        visitorClubName = "ManCity"
        visitorTeamResult = 20
        visitorClubLogo = (UIImagePNGRepresentation(logo!)! as Data)
        date = "23-10-2017"
    }
}


struct GoalRecord : Codable {
    let pk : Int
    let athletePk : Int
    let athleteName : String
    let athletePhoto : Data?
    let team : Int
    let count : Int
    enum CodingKeys : String, CodingKey {
        case athletePhoto = "photo"
        case pk,athletePk,athleteName,team,count
    }
    init(){
        let logo = UIImage(named: "athlete")
        pk = 0
        athletePk = 0
        athleteName = "Ronaldo"
        athletePhoto = (UIImagePNGRepresentation(logo!)! as Data)
        team = 0
        count = 3
    }
    init(type : Int){
    let logo = UIImage(named: "athlete")
    pk = 0
    athletePk = 1
    athleteName = "Messe"
    athletePhoto = (UIImagePNGRepresentation(logo!)! as Data)
    team = 1
    count = 2
    }
}

struct Searchable : Codable {
    let pk : Int
    let name : String
    let icon : Data?
    let type : Int
    
    enum CodingKeys : String, CodingKey {
        case icon = "photo"
        case pk,name,type
    }
    
    init(){
        let logo = UIImage(named: "club")
        pk = 0
        name = "Porto"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = 0
    }
    init(_ par : Int){
        let logo = UIImage(named: "athlete")
        pk = 0
        name = "Ronaldo"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = 2
    }
    init(_ par : String){
        let logo = UIImage(named: "TeamLogo")
        pk = 2
        name = "Liga NOS"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = 1
    }
    

}
struct Team : Codable{
    let pk : Int
    let gender : String
    let ageRange : String
    let clubPk : Int
}
