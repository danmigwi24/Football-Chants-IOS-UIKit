//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Daniel Kimani on 09/01/2024.
//

import UIKit

class ChantsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    //
    private lazy var teamViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()

    //LIFECYCLE
    override func loadView() {
        super.loadView()
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    
    
    

   
}

private extension ChantsViewController{
    
    func setUp(){
        //
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //
        tableView.dataSource = self
        //
        self.view.addSubview(tableView)
        //
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension ChantsViewController:UITableViewDataSource{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  teamViewModel.teams.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamViewModel.teams[indexPath.row]//teamViewModel.teams[0]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(team,delegate: self)
        return cell
        
    }
}

extension ChantsViewController:TeamTableViewCellDelegate{
    func didTapPlayback(for team: Team) {
        audioManagerViewModel.playAudio(team: team)
        teamViewModel.togglePlayBack(team: team)
        tableView.reloadData()
        print("ChantsViewController Team name: \(team.name)")
    }
}
