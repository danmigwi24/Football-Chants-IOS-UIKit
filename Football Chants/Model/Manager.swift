//
//  Manager.swift
//  Football Chants
//
//  Created by Daniel Kimani on 09/01/2024.
//

import Foundation

enum JobType :String{
    case manager = "Manager"
    case headCoach  = "Head Coach"
}

struct Manager{
    let name:String
    let job:JobType
}
