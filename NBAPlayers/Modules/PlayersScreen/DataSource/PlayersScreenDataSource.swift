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
    
    let dataSource = DataSource { dataSource, tableView, indexPath, items -> UITableViewCell in
        switch dataSource[indexPath] {
        case .players:
            let cell: PlayerCell = tableView.dequeueReusableCell(for: indexPath)
            
            return cell
        }
    }
}
