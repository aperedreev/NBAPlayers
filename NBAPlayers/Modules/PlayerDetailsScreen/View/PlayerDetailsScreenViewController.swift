//
//  PlayerDetailsScreenViewController.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class PlayerDetailsScreenViewController: UIViewController, Reusable {
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    private var input: PlayerDetailsScreenViewModelInputProtocol!
    private var output: PlayerDetailsScreenViewModelOutputProtocol!
    private var viewModel: PlayerDetailsScreenViewModelProtocol!
    
    private let onAppear = PublishRelay<Void>()
    
    private var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bindUI()
    }
    
    // MARK: - Public Methods
    
    func inject(_ viewModel: PlayerDetailsScreenViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}

extension PlayerDetailsScreenViewController {
    
    func configureUI() {
        configureViews()
        configureTableView()
    }
    
    func configureViews() {
        navigationItem.title = "Player" // TODO: set player name
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        
        tableView = UITableView(frame: .zero, style: .plain).then {
            $0.showsVerticalScrollIndicator = false
            $0.tableFooterView = UIView()
            $0.bounces = false
            $0.alwaysBounceVertical = false
        }
    
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension PlayerDetailsScreenViewController {
    
    func bindUI() {
        bindViewModel()
        bindTableView()
    }
    
    func bindViewModel() {
        
        let input = PlayerDetailsScreenViewModelInput(onAppear: onAppear.asObservable())
        
        output = viewModel.transform(input: input)
    }
    
    func bindTableView() {
        
        output.sections.drive(tableView.rx.items(dataSource: output.dataSource)).disposed(by: disposeBag)
    }
}
