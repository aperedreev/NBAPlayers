//
//  PlayersScreenViewController.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 16.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class PlayersScreenViewController: UIViewController, Reusable {
    
    // MARK: - Properties
    
    private let generalService = GeneralService()
    
    private let disposeBag = DisposeBag()
    
    private var input: PlayersScreenViewModelInputProtocol!
    private var output: PlayersScreenViewModelOutputProtocol!
    private var viewModel: PlayersScreenViewModelProtocol!
    
    private let onAppear = PublishRelay<Void>()
    
    // MARK: - Outlets
    
    private var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        onAppear.accept(())
    }
    
    // MARK: - Public Methods
    
    func inject(_ viewModel: PlayersScreenViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}

// MARK: - Private Methods

private extension PlayersScreenViewController {
    
    func configureUI() {
        configureViews()
        configureTableView()
    }
    
    func configureViews() {
        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .tertiarySystemGroupedBackground
        navigationController?.navigationBar.backgroundColor = .tertiarySystemGroupedBackground
        
    }
    
    func configureTableView() {
        
        tableView = UITableView(frame: .zero, style: .insetGrouped).then {
            $0.register(cellType: PlayerCell.self)
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.showsVerticalScrollIndicator = false
            $0.tableFooterView = UIView()
            $0.alwaysBounceVertical = true
            $0.bounces = true
        }
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

private extension PlayersScreenViewController {
    
    func fetchData() {
        generalService.fetchPlayers(page: 29, limit: 100).bind(to: tableView.rx.items(cellIdentifier: PlayerCell.reuseIdentifier, cellType: PlayerCell.self)){
            index, player, cell in
            
            cell.setupData(player: player)
            
        }.disposed(by: disposeBag)
    }
}

private extension PlayersScreenViewController {
    
    func bindUI() {
        bindViewModel()
//        bindTableView()
    }
    
    func bindViewModel() {
     
        let input = PlayersScreenViewModelInput(onAppear: onAppear.asObservable())
        
        output = viewModel.transform(input: input)
    }
    
    func bindTableView() {
        output.sections.drive(tableView.rx.items(dataSource: output.dataSource)).disposed(by: disposeBag)
    }
}
