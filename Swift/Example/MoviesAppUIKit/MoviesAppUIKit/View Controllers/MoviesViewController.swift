//
//  MoviesTableViewController.swift
//  MoviesAppUIKit
//
//  Created by Mohammad Azam on 10/12/23.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class MoviesViewController: UIViewController {

    private let viewModel:MovieListViewModel
    private var cancelables:Set<AnyCancellable> = []


    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        return searchBar
    }()
        
    lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

  init(viewModel: MovieListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        setupUI()
      viewModel.$loadingCompleted
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completed in
          if completed {
            //reload tableview
            self?.moviesTableView.reloadData()
          }
        }
        .store(in: &cancelables)

    }
        
    private func setupUI() {
        
        view.backgroundColor = .white
        
        // register cells
        moviesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(moviesTableView)
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let movie = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
      content.text = movie.title
        cell.contentConfiguration = content
        return cell
    }
}

extension MoviesViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.setSearchText(searchText)
  }
}

struct MoviesViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MoviesViewController
    
    func updateUIViewController(_ uiViewController: MoviesViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> MoviesViewController {
        MoviesViewController(viewModel: MovieListViewModel(httpClient: HTTPClient()))
    }
}

#Preview {
    MoviesViewControllerRepresentable()
}


