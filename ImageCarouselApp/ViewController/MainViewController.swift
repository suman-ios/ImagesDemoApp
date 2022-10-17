//
//  MainViewController.swift
//  ImageCarouselApp
//

import UIKit

class MainViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    private let carouselImages = getCarouselImages()
    private var profileNames = getProfileNames()
    private var searchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        tableView.registerCell(CarouselImageTableViewCell.self)
        tableView.registerCell(ImageListTableViewCell.self)
        tableView.registerView(SearchProfileHeaderView.self)
        tableView.keyboardDismissMode = .interactive

        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return profileNames.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(CarouselImageTableViewCell.self)
            cell.setupCell(carouselImages: carouselImages)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(ImageListTableViewCell.self)
            cell.setupCell(profile: profileNames[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = tableView.dequeueReusableView(SearchProfileHeaderView.self)
            view.searchBar.delegate = self
            if !searchText.isEmpty {
                view.searchBar.text = searchText
                view.searchBar.becomeFirstResponder()
            }
            
            return view
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? UITableView.automaticDimension : 0
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        self.profileNames = getProfileNames()
        if !searchText.isEmpty{
            self.profileNames = self.profileNames.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
        }
        UIView.performWithoutAnimation {
            self.tableView.reloadSections([1], with: .none)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
