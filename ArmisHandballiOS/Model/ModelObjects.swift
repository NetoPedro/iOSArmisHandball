//
//  ModelObjects.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 07/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation


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
        pk = 1 ;
        matchDay = "MatchDay"
        homeTeamPk = 0
        visitorTeamPk = 1
        homeClubName = "HomeName"
        homeTeamResult = 21
        homeClubLogo = Data(count: 10)
        visitorClubName = "VisitorName"
        visitorTeamResult = 80
        visitorClubLogo = Data(count: 10)
        date = "date"
    }
    init(type:Int ){
        pk = 1 ;
        matchDay = "MatchDay"
        homeTeamPk = 0
        visitorTeamPk = 1
        homeClubName = "Type2"
        homeTeamResult = 10
        homeClubLogo = Data(count: 10)
        visitorClubName = "Type2"
        visitorTeamResult = 20
        visitorClubLogo = Data(count: 10)
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
