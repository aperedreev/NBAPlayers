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

final class PlayersScreenViewController: UIViewController, StoryboardBased {
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    private var input: PlayersScreenViewModelInputProtocol!
    private var output: PlayersScreenViewModelOutputProtocol!
    private var viewModel: PlayersScreenViewModelProtocol!
    
    private let onAppear = PublishRelay<Void>()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
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
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureTableView() {
        tableView.do {
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.tableFooterView = UIView()
            $0.alwaysBounceVertical = false
            $0.bounces = false
        }
        
    }
    
}

private extension PlayersScreenViewController {
    
    func bindUI() {
        bindViewModel()
        bindTableView()
    }
    
    func bindViewModel() {
     
        let input = PlayersScreenViewModelInput(onAppear: onAppear.asObservable())
        
        output = viewModel.transform(input: input)
    }
    
    func bindTableView() {
        output.sections.drive(tableView.rx.items(dataSource: output.dataSource)).disposed(by: disposeBag)
    }
}
