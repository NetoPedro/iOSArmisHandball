//
//  ModelObjects.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 07/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation


struct Athlete {
    let name : String
    let IDNumber : String
    let gender : String
    let age : Int
    let nationalTeam : Team?
    let localTeam : Team
    let nationality : Nationality
}

struct Team {
    let gender : String
    let club : Club
    let ageRange : AgeRange
}

struct Nationality {
    let name : String
}

struct Club {
    let nationality:String
    let name:String
    let taxNumber : String
    let clubType : String
}

struct AgeRange {
    let lowerLimit : Int
    let upperLimit : Int
}

struct Tournament{
    let name : String
    let gender : String
    let ageRange : AgeRange
}

struct Edition {
    let tournament : Tournament
    let season : String
    let teams : [Team]
}
struct MatchDay {
    let edition : Edition
    let number : Int
    let phase : String
}

struct Game {
    let matchDay : MatchDay
    let homeTeam : Team
    let visitorTeam : Team
    let homeTeamScore : Int
    let visitorTeamScore : Int
}
