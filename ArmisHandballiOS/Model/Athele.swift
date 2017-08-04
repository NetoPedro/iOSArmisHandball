//
//  Athele.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 04/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import Foundation

class Athlete : Decodable{
    
    let name : String
    let IDNumber : String
    let gender : String
    let age : Int
    let nationalTeam : Team?
    let localTeam : Team
    let nationality : Nationality
}
