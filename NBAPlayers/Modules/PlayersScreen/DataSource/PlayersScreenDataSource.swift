//
//  PlayersScreenDataSource.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 16.07.2021.
//

import UIKit
import RxDataSources

enum PlayersScreenHeader {
    case search
}

enum PlayersScreenItem {
    case players
}

final class PlayersScreenDataSource {
    
    typealias SectionType = SectionModel<PlayersScreenHeader, PlayersScreenItem>
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<SectionType>
    
    let dataSource = DataSource { dataSource, tableView, indexPath, _ -> UITableViewCell in
        switch dataSource[indexPath] {
        default:
            return UITableViewCell()
        }
    }
}
