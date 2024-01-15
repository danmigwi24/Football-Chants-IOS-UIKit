//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Daniel Kimani on 15/01/2024.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"
    
    //
    private lazy var containerVw:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var contentStackVw:UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.spacing = 4
        vw.axis = .vertical
        return vw
    }()
    
    private lazy var badgeImgVw:UIImageView = {
        let vw = UIImageView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.contentMode = .scaleAspectFit
        return vw
    }()
    
    private lazy var playBtnVw:UIButton = {
        let vw = UIButton()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.tintColor = .white
        
        return vw
    }()
    
    private lazy var nameLbl:UILabel = {
        let vw = UILabel()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.numberOfLines = 0
        vw.font = .systemFont(ofSize: 18,weight: .bold)
        vw.textColor = .white
        return vw
    }()
    
    private lazy var foundedLbl:UILabel = {
        let vw = UILabel()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.numberOfLines = 0
        vw.font = .systemFont(ofSize: 12,weight: .light)
        vw.textColor = .white
        return vw
    }()
    
    private lazy var jobLbl:UILabel = {
        let vw = UILabel()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.numberOfLines = 0
        vw.font = .systemFont(ofSize: 10,weight: .light)
        vw.textColor = .white
        return vw
    }()
    
    
    private lazy var infoLbl:UILabel = {
        let vw = UILabel()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.numberOfLines = 0
        vw.font = .systemFont(ofSize: 12,weight: .medium)
        vw.textColor = .white
        return vw
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerVw.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach{
            $0.removeFromSuperview()
        }
    }
    
    private weak var delegate:TeamTableViewCellDelegate?
    private var team:Team?
    
    func configure(_ team :Team, delegate:TeamTableViewCellDelegate){
        
        self.delegate = delegate
        self.team = team
        
        //
        playBtnVw.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        //
        containerVw.backgroundColor = team.id.background
        badgeImgVw.image = team.id.badge
        playBtnVw.setImage( team.isPlaying ? Assets.pauseImg :Assets.playImg, for: .normal)
        //
        nameLbl.text = team.name
        foundedLbl.text = team.founded
        jobLbl.text = "Current \(team.manager.job.rawValue): \(team.manager.name)"
        infoLbl.text = team.info
        //"In object-oriented programming, implements and extends are keywords used to establish relationships between classes and interfaces. The specific usage and meaning of these keywords depend on the programming language, but I'll provide a general explanation based on common practices in languages like Java."
        
        self.contentView.addSubview(containerVw)
        
        //
        containerVw.addSubview(contentStackVw)
        //
        containerVw.addSubview(playBtnVw)
        containerVw.addSubview(badgeImgVw)
        //
        contentStackVw.addArrangedSubview(nameLbl)
        contentStackVw.addArrangedSubview(foundedLbl)
        contentStackVw.addArrangedSubview(jobLbl)
        contentStackVw.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8),
            containerVw.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
            containerVw.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 8),
            containerVw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -8),
            //

            badgeImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgeImgVw.topAnchor.constraint(equalTo: contentStackVw.topAnchor),
            badgeImgVw.leadingAnchor.constraint(equalTo: containerVw.leadingAnchor,constant: 8),
            //
            contentStackVw.topAnchor.constraint(equalTo: containerVw.topAnchor,constant: 16),
            contentStackVw.bottomAnchor.constraint(equalTo: containerVw.bottomAnchor,constant: -16),
            contentStackVw.leadingAnchor.constraint(equalTo: badgeImgVw
                .trailingAnchor, constant: 8),
            contentStackVw.trailingAnchor.constraint(equalTo: playBtnVw.leadingAnchor, constant: -8),
            //
            playBtnVw.heightAnchor.constraint(equalToConstant: 44),
            playBtnVw.widthAnchor.constraint(equalToConstant: 44),
            playBtnVw.trailingAnchor.constraint(equalTo: containerVw.trailingAnchor, constant: -8),
            playBtnVw.centerYAnchor.constraint(equalTo: containerVw.centerYAnchor),
        ])
    }
    
    
    @objc  func didTapBtn(){
        if let team = team {
            delegate?.didTapPlayback(for: team)
        }
    }

}



protocol TeamTableViewCellDelegate: class{
    func didTapPlayback(for team :Team)
}
