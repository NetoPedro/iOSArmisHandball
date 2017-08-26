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
        let logo = UIImage(named: "TeamLogo")

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
        date = "date"
    }
    init(type:Int ){
        let logo = UIImage(named: "TeamLogo")

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
        date = "date"
    }
}


struct GoalRecord : Codable {
    let pk : Int
    let athleteName : String
    let athletePhoto : Data
    let team : Int
    let count : Int
}

struct Searchable : Codable {
    let pk : Int
    let name : String
    let icon : Data
    let type : String 
}
