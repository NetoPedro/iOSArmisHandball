//
//  ModelObjects.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 07/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation


struct Athlete :Codable {
    let name : String
    let IDNumber : String
    let gender : String
    let age : Int
    let nationalTeam : Team?
    let localTeam : Team
    let nationality : Nationality
}

struct Team :  Codable {
    let gender : String
    let club : Club
    let ageRange : AgeRange
}

struct Nationality : Codable {
    let name : String
}

struct Club : Codable {
    let nationality:String
    let name:String
    let taxNumber : String
    let isNational : Bool
}

struct AgeRange : Codable {
    let name : String
    let lowerLimit : Int
    let upperLimit : Int
}

struct Tournament :  Codable{
    let name : String
    let gender : String
    let ageRange : AgeRange
}

struct Edition  :Codable{
    let tournament : Tournament
    let season : String
    let teams : [Team]
}
struct MatchDay : Codable {
    let edition : Edition
    let number : Int
    let phase : String
}

struct Game : Codable {
    let matchDay : MatchDay
    let homeTeam : Team
    let visitorTeam : Team
    let homeTeamScore : Int
    let visitorTeamScore : Int
}

struct SystemUser : Codable {
    let name : String
    let role : String?
    let favoriteTeams : [Team]
    let favoriteTournaments : [Team]
}

struct GoalRecord : Codable {
    let athlete : Athlete
    let team : Team
    let game : Game
    let count : Int 
}

struct Searchable : Codable {
    let name : String
    let icon : Data
    let type : String 
}
