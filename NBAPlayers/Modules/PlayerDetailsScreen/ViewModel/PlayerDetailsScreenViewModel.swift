//
//  PlayerDetailsScreenViewModel.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct PlayerDetailsScreenViewModelInput: PlayerDetailsScreenViewModelInputProtocol {
    
    let onAppear: Observable<Void>
    
}

struct PlayerDetailsScreenViewModelOutput: PlayerDetailsScreenViewModelOutputProtocol {
    
    let dataSource = PlayerDetailsScreenDataSource().dataSource
    
    let sections: Driver<[PlayerDetailsScreenDataSource.SectionType]>
    
}

final class PlayerDetailsScreenViewModel: Stepper {
    
    let disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
    
}

extension PlayerDetailsScreenViewModel: PlayerDetailsScreenViewModelProtocol {
    
    typealias SectionType = PlayerDetailsScreenDataSource.SectionType
    
    func transform(input: PlayerDetailsScreenViewModelInputProtocol) -> PlayerDetailsScreenViewModelOutputProtocol {
        
        let sections = BehaviorRelay<[SectionType]>(value: [])
        
        let mockItems = BehaviorRelay<[Int]>(value: [])
        
        input.onAppear
            .withLatestFrom(mockItems)
            .map { _ in PlayerDetailsScreenBuilder.build() }
            .bind(to: sections)
            .disposed(by: disposeBag)
        
        let output = PlayerDetailsScreenViewModelOutput(sections: sections.asDriver(onErrorJustReturn: []))
        
        return output
    }
    
    
}
