//
//  BookmarkViewController.swift
//  RicaWeb
//
//  Created by Italo Ricardo Geske on 2019/06/17.
//  Copyright © 2019 Italo Ricardo Geske. All rights reserved.
//

import UIKit

class BookmarkViewController: UITableViewController {

    private lazy var viewModel: BookmarkViewModel = {
        let model = BookmarkViewModel()
        return model
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        tableView.register(UINib(nibName: "BookmarkCellViewController", bundle: nil), forCellReuseIdentifier: "BookmarkCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getBookmarksCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath) as? BookmarkCellViewController else { return UITableViewCell() }
        guard let bookmark = viewModel.getBookmarkDetails(index: indexPath.row) else { return UITableViewCell() }
        cell.setup(imageIcon: bookmark.imageUrl ?? "", title: bookmark.title ?? "", url: bookmark.url ?? "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }
}
