//
//  PlayerDetailsScreenViewModelProtocols.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol PlayerDetailsScreenViewModelInputProtocol {
    
    var onAppear: Observable<Void> { get }
}

protocol PlayerDetailsScreenViewModelOutputProtocol {
    
    var dataSource: PlayerDetailsScreenDataSource.DataSource { get }
    var sections: Driver<[PlayerDetailsScreenDataSource.SectionType]> { get }
}

protocol PlayerDetailsScreenViewModelProtocol {
    
    func transform(input: PlayerDetailsScreenViewModelInputProtocol) -> PlayerDetailsScreenViewModelOutputProtocol
}
