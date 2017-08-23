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
