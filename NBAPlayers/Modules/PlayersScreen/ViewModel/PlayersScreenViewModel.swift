//
//  PlayersScreenViewModel.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 16.07.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct PlayersScreenViewModelInput: PlayersScreenViewModelInputProtocol {
    
    let onAppear: Observable<Void>
    
}

struct PlayersScreenViewModelOutput: PlayersScreenViewModelOutputProtocol {
    
    let dataSource = PlayersScreenDataSource().dataSource
    
    let sections: Driver<[PlayersScreenDataSource.SectionType]>
    
}

final class PlayersScreenViewModel: Stepper {
    
    let disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()

}

extension PlayersScreenViewModel: PlayersScreenViewModelProtocol {
    
    typealias SectionType = PlayersScreenDataSource.SectionType
    
    func transform(input: PlayersScreenViewModelInputProtocol) -> PlayersScreenViewModelOutputProtocol {
        
        let sections = BehaviorRelay<[SectionType]>(value: [])
        
        let mockItems = BehaviorRelay<[Int]>(value: [])
        
        input.onAppear
            .withLatestFrom(mockItems)
            .map { _ in PlayersScreenBuilder.build() }
            .bind(to: sections)
            .disposed(by: disposeBag)
        
        let output = PlayersScreenViewModelOutput(sections: sections.asDriver(onErrorJustReturn: []))
        
        return output
    }
    
}
