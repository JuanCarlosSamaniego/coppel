//
//  DetailViewController.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//
import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var imgPosterImage: UIImageView!
    @IBOutlet weak var imgBackdropMovie: UIImageView!
    @IBOutlet weak var scrollDetail: UIScrollView!
    @IBOutlet weak var contetView: UIView!
    @IBOutlet weak var constrainToFullView: NSLayoutConstraint!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblOverViewMovie: UILabel!
    @IBOutlet weak var lbldateOfMovie: UILabel!
    @IBOutlet weak var lblVoteCoverage: UILabel!
    
    @IBOutlet weak var collectionViewForCompanies: UICollectionView!
    
    //MARK: - Presenter.
    var presenter: DetailViewPresenter?
    var isOnTheAir = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForDetailView()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.onViewAppearForCompanies()
        presenter?.onViewAppearForTVShows()
    }
    
    func setupForDetailView() {
        setupNavigationBar()
        constrainToFullView.constant = -95
        lblTitleMovie.numberOfLines = 0
        lblOverViewMovie.numberOfLines = 0
        imgPosterImage.layer.cornerRadius = 10
        imgBackdropMovie.layer.cornerRadius = 10
        setupColectionView()
        setupViewForDetail(title: presenter?.dataForDetailMovie?.title ?? "", overview: presenter?.dataForDetailMovie?.overview ?? "", releaseDate: presenter?.dataForDetailMovie?.release_date ?? "", posterPath: presenter?.dataForDetailMovie?.poster_path ?? "", voteCoverage: presenter?.dataForDetailMovie?.vote_average?.description ?? "", backdropPath: presenter?.dataForDetailMovie?.backdrop_path ?? "")
    }
    
    
    func setupViewForDetail(title: String, overview: String, releaseDate: String, posterPath: String, voteCoverage: String, backdropPath: String) {
        lblTitleMovie.text = title
        lblOverViewMovie.text = overview
        lbldateOfMovie.text = releaseDate
        lblVoteCoverage.text = voteCoverage
        imgPosterImage.kf.indicatorType = .activity
        imgPosterImage.kf.setImage(with: URL(string:"\(dataForAPI.complementForURL)\(posterPath)"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
        imgBackdropMovie.kf.indicatorType = .activity
        self.imgBackdropMovie.kf.setImage(with: URL(string:"\(dataForAPI.complementForURL)\(backdropPath)"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
        
    }
    
    func setupNavigationBar() {
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "star.square"), style: .done, target: self, action: #selector(sendBack))
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.rightBarButtonItem = btnBack
    }
    
    @objc func sendBack() {
    }
    
    func transparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}

extension DetailViewController: DetailViewPresenterProtocolDetailForId {
    func updateViewWithDataForDetail(data: DetailMovieEntity) {
        DispatchQueue.main.async { [self] in
            setupViewForDetail(title: presenter?.dataForDetailMovie?.title ?? "", overview: presenter?.dataForDetailMovie?.overview ?? "", releaseDate: presenter?.dataForDetailMovie?.release_date ?? "", posterPath: presenter?.dataForDetailMovie?.poster_path ?? "", voteCoverage: presenter?.dataForDetailMovie?.vote_average?.description ?? "", backdropPath: presenter?.dataForDetailMovie?.backdrop_path ?? "")
        }
    }
}

extension DetailViewController: DetailViewPresenterProtocolDetailForTVShow {
    func updateViewWithDataForDetail(data: DetailViewForTVEntity) {
        DispatchQueue.main.async { [self] in
            setupViewForDetail(title: presenter?.dataForDetailTVShow?.last_episode_to_air?.name ?? "", overview: presenter?.dataForDetailTVShow?.last_episode_to_air?.overview ?? "", releaseDate: presenter?.dataForDetailTVShow?.last_episode_to_air?.air_date ?? "", posterPath: presenter?.dataForDetailTVShow?.last_episode_to_air?.still_path ?? "", voteCoverage: presenter?.dataForDetailTVShow?.last_episode_to_air?.vote_average?.description ?? "", backdropPath: presenter?.dataForDetailTVShow?.backdrop_path ?? "")
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupColectionView() {
        collectionViewForCompanies.delegate = self
        collectionViewForCompanies.dataSource = self
        collectionViewForCompanies.collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewForCompanies.register(UINib(nibName:"CompaniesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "colection")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.dataForDetailMovie?.production_companies?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewForCompanies.dequeueReusableCell(withReuseIdentifier: "colection", for: indexPath) as? CompaniesCollectionViewCell else { return UICollectionViewCell() }
        let models = presenter?.dataForDetailMovie?.production_companies?[indexPath.row]
        cell.setupCell(name: models?.name ?? "No Disponilbe", imgCompanie: models?.logo_path ?? "", country: models?.origin_country ?? "No Disponible")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
   }
}
