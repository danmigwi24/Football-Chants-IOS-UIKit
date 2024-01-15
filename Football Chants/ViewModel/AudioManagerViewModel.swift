//
//  AudioManagerViewModel.swift
//  Football Chants
//
//  Created by Daniel Kimani on 15/01/2024.
//

import Foundation
import AVKit


class AudioManagerViewModel{
    
    private var chantAudioPlayer : AVAudioPlayer?
    
    
    func playAudio(team:Team){
        if team.isPlaying{
            chantAudioPlayer?.stop()
        }else{
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else{return}
                    
                    let url = URL(fileURLWithPath: path)
                    do{
                        chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                        chantAudioPlayer?.numberOfLoops = -1
                        chantAudioPlayer?.play()
                    }catch{
                        print(error)
                    }
        }
    }
    
}
