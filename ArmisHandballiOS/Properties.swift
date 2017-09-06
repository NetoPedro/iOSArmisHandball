//
//  Properties.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 06/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation


class Properties{
    
    
    fileprivate static func getBaseURL() -> String{
        return "http://192.168.100.27/ArmisHandBall/api/"
    }
    
    static func getGamesURL() -> String{
        return getBaseURL() + "Games"
    }
    static func getMatchDaysURL(edition : String) -> String{
        return getBaseURL() + "MatchDays?editionPk=\(edition)"

    }
    static func getAthleteURL(athlete : String) -> String{
        return getBaseURL() + "Athletes/\(athlete)"

    }
    static func getTeamsUTL(club : String) -> String {
        return getBaseURL() + "Teams?clubPk=\(club)"

    }
    static func getGoalRecordURL(game : String ) -> String{
        return getBaseURL() + "GoalRecords?gamePk=\(game)"
    }
    
    static func getSearchURL(toSearch : String) -> String {
        return getBaseURL() + "Searchable?name=\(toSearch)"
    }
    
    static func getEditionsURL(tournament : String) -> String {
        return getBaseURL() + "editions?tournamentPk=\(tournament)"
    }
    
}
