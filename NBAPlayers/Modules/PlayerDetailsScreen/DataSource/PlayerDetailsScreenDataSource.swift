//
//  PlayerDetailsScreenDataSource.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import UIKit
import RxDataSources

enum PlayerDetailsScreenHeader {
    case header
}

enum PlayerDetailsScreenItem {
    case playerInfo
}

final class PlayerDetailsScreenDataSource {
    
    typealias SectionType = SectionModel<PlayerDetailsScreenHeader, PlayerDetailsScreenItem>
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<SectionType>
    
    let dataSource = DataSource { dataSource, tableView, indexPath, items -> UITableViewCell in
        switch dataSource[indexPath] {
        default:
            return UITableViewCell()
        }
    }
}
