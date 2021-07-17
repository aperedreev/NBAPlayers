//
//  PlayersScreenViewModelProtocols.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 16.07.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol PlayersScreenViewModelInputProtocol {
    var onAppear: Observable<Void> { get }
}

protocol PlayersScreenViewModelOutputProtocol {
 
    var dataSource: PlayersScreenDataSource.DataSource { get }
    var sections: Driver<[PlayersScreenDataSource.SectionType]> { get }
}

protocol PlayersScreenViewModelProtocol {
    func transform(input: PlayersScreenViewModelInputProtocol) -> PlayersScreenViewModelOutputProtocol
}
