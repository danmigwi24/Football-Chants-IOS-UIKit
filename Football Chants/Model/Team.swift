//
//  Team.swift
//  Football Chants
//
//  Created by Daniel Kimani on 09/01/2024.
//

import Foundation


struct Team{
    let id:TeamType
    let name:String
    let info:String
    let manager:Manager
    let founded:String
    var isPlaying:Bool = false
}
