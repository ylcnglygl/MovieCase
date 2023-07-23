//
//  HomePageViewController.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import UIKit
import Cartography
import JGProgressHUD

protocol MovieOutput {
    func saveDatas(response: Movies)
    func showIndicator()
    func dismissIndicator()
}

class HomePageViewController: UIViewController {
    lazy var viewModel: IHomePageViewModel = HomePageViewModel()
    private var movies: Movies?
    private var filteredMovies: [Search]?
    private let spinner = JGProgressHUD(style: .dark)
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = UIColor.black.withAlphaComponent(1.0)
        searchBar.placeholder = Constants.HomePageViewController.searchBarPlaceholder
        searchBar.backgroundColor = .white
        searchBar.barTintColor = UIColor.clear
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Style.HomePageViewController.minimumLineSpacing
        layout.minimumInteritemSpacing = Style.HomePageViewController.minimumInteritemSpacing
        let gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gridCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        gridCollectionView.backgroundColor = .white.withAlphaComponent(0.9)
        gridCollectionView.showsVerticalScrollIndicator = true
        return gridCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
        
        searchBar.delegate = self
        self.definesPresentationContext = false
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        view.addSubview(searchBar)
        view.addSubview(verticalCollectionView)
        viewModel.setDelegate(output: self)

        constrain(searchBar, verticalCollectionView) {
            guard let superview = $0.superview else { return }
            $0.top == superview.safeAreaLayoutGuide.top
            $0.left == superview.left
            $0.right == superview.right
            $0.bottom == $1.top
            
            $1.left == superview.left
            $1.right == superview.right
            $1.bottom == superview.bottom
            
            $0.width == superview.width
            $1.width == superview.width
        }
    }
    
    @objc func reload() {
        guard let searchText = searchBar.text else { return }
        viewModel.fetchMovies(movieTitle: searchText)
    }
    
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        self.verticalCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.filteredMovies = []
        self.searchBar.showsCancelButton = false
        self.searchBar.endEditing(true)
        self.dismiss(animated: true, completion: nil)
        self.verticalCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text?.isEmpty == true  {
            filteredMovies = []
            verticalCollectionView.reloadData()
        } else {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(HomePageViewController.reload), object: nil)
            self.perform(#selector(HomePageViewController.reload), with: nil, afterDelay: 0.5)
        }
        
    }
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        guard let movie = filteredMovies?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: movie)
        collectionView.deselectItem(at: indexPath, animated: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.filteredMovies?.count == 0 || filteredMovies == nil {
            self.verticalCollectionView.setEmptyMessage(Constants.HomePageViewController.collectionViewEmptyText)
        } else {
            self.verticalCollectionView.restore()
        }
        return filteredMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movieId = filteredMovies?[indexPath.row].imdbID
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - Style.HomePageViewController.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: view.frame.size.height / 3)
    }
}

extension HomePageViewController: MovieOutput {
    func saveDatas(response: Movies) {
        self.movies = response
        filteredMovies = movies?.search
        verticalCollectionView.reloadData()
    }
    
    func showIndicator() {
        self.spinner.show(in: view)
    }
    
    func dismissIndicator() {
        self.spinner.dismiss()
    }
}
