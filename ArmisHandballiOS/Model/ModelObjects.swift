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
    let photo : Data
    let teamPk : Int
    
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
}
struct MatchDay : Codable {
    let pk : Int
    let name : String
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
    let homeClubLogo: Data
    let visitorClubLogo : Data
    let date : String
    
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
    let athleteName : String
    let athletePhoto : Data
    let team : Int
    let count : Int
    
    init(){
        let logo = UIImage(named: "athlete")
        pk = 0
        athleteName = "Ronaldo"
        athletePhoto = (UIImagePNGRepresentation(logo!)! as Data)
        team = 0
        count = 3
    }
    init(type : Int){
    let logo = UIImage(named: "athlete")
    pk = 0
    athleteName = "Messe"
    athletePhoto = (UIImagePNGRepresentation(logo!)! as Data)
    team = 1
    count = 2
    }
}

struct Searchable : Codable {
    let pk : Int
    let name : String
    let icon : Data
    let type : String
    init(){
        let logo = UIImage(named: "club")
        pk = 0
        name = "Porto"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = "CLUB"
    }
    init(_ par : Int){
        let logo = UIImage(named: "athlete")
        pk = 0
        name = "Ronaldo"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = "ATHLETE"
    }
    init(_ par : String){
        let logo = UIImage(named: "TeamLogo")
        pk = 0
        name = "Liga NOS"
        icon = (UIImagePNGRepresentation(logo!)! as Data)
        type = "TOURNAMENT"
    }
}
