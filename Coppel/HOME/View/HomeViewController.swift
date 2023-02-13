//  HomeViewController.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//
import UIKit

class HomeViewController: UIViewController {
    //MARK: - IBOutles
    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var segmetedControl: UISegmentedControl!
    
    //MARK: - Viper Implementation
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        presenter?.onViewAppearMovies()
        presenter?.onViewAppearMoviesToRated()
        presenter?.onViewApperOnTheAir()
        presenter?.onViewApperTvAiringToday()
        setupColectionView()
        setupNavigationBar()
        setupSegmetedControlForMoviesView()
    }
    func setupNavigationBar() {
        title = "Apple TV"
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .done, target: self, action: #selector(showOptionsMenu))
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        self.navigationItem.rightBarButtonItem = btnBack
    }
    @objc func showOptionsMenu() {
        showAlertDefaultAction(title: "selecciona:", message: "", inController: self, style: .actionSheet)
    }
    func setupSegmetedControlForMoviesView() {
        
        segmetedControl.setTitle("Popular", forSegmentAt: 0)
        segmetedControl.setTitle("Top Rated", forSegmentAt: 1)
        segmetedControl.setTitle("On TV", forSegmentAt: 2)
        segmetedControl.setTitle("Airing Today", forSegmentAt: 3)
        segmetedControl.tintColor = UIColor.white
    }
    
    @IBAction func segmentControllClick(_ sender: Any) {
        switch segmetedControl.selectedSegmentIndex {
        case 0, 1, 2, 3 :
            colectionView.reloadData()
        default:
            break
        }
    }
    
    func showAlertSelection() {
        let vc = UserProfileViewController()
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func showAlertDefaultAction(title:String,message:String,inController:UIViewController,style:UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ver Perfil", style: .default) { action in self.showAlertSelection() }
        let logOut = UIAlertAction(title: "Cerrar sesión", style: .destructive) { action in self.logOut() }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) { action in }
        alertController.addAction(okAction)
        alertController.addAction(logOut)
        alertController.addAction(cancel)
        inController.present(alertController, animated: true, completion: nil)
    }
    func logOut() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true )
        print("cerrar Sesíon.")
    }
}
//MARK: - Protocol to get data For Popular movies.
extension HomeViewController: HomePresenterProtocolForMovies {
    func updateViewWithMovies(datos: [PopularMovieEntity]) {
        DispatchQueue.main.async {
            self.colectionView.reloadData()
        }
    }
}
//MARK: - Protocol to get data For Top Rated movies.
extension HomeViewController: HomePresenterProtocolForMoviesTopRated {
    func updateViewWithMoviesTopRated(datos: [PopularMovieEntity]) {
        DispatchQueue.main.async {
            self.colectionView.reloadData()
        }
    }
}
//MARK: - Protocol to get data For On The Air.
extension HomeViewController: HomePresenterProtocolOnTheAir {
    func updateViewWithDataOnTheAir(datos: [OnTheAirEntity]) {
        DispatchQueue.main.async {
            self.colectionView.reloadData()
        }
    }
}
//MARK: - Protocol to get data For Tv Airing Today.
extension HomeViewController: HomePresenterProtocolTvAiringToday {
    func updateViewWithDataTvAiringToday(datos: [OnTheAirEntity]) {
        DispatchQueue.main.async {
            self.colectionView.reloadData()
        }
    }
} 
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupColectionView() {
        colectionView.delegate = self
        colectionView.dataSource = self
        colectionView.layer.cornerRadius = 8
        colectionView.collectionViewLayout = UICollectionViewFlowLayout()
        colectionView.register(UINib(nibName:"MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "colection")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmetedControl.selectedSegmentIndex {
        case 0:
            return presenter?.modelsForMovies.count ?? 0
        case 1:
            return presenter?.modelsForMoviesTopRated.count ?? 0
        case 2:
            return presenter?.modelsForOnTheAir.count ?? 0
        case 3:
            return presenter?.modelsForTvAiringToday.count ?? 0
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = colectionView.dequeueReusableCell(withReuseIdentifier: "colection", for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        switch segmetedControl.selectedSegmentIndex {
        case 0:
            let models = presenter?.modelsForMovies[indexPath.row]
            cell.setupCell(posterImage: models?.poster_path ?? "", titleOfMovie: models?.title ?? "", descriptionMovie: models?.overview ?? "", dateOfMuvie: models?.release_date ?? "", voteAverageMovie: models?.vote_average.description ?? "")
        case 1:
            let models = presenter?.modelsForMoviesTopRated[indexPath.row]
            cell.setupCell(posterImage: models?.poster_path ?? "", titleOfMovie: models?.title ?? "", descriptionMovie: models?.overview ?? "", dateOfMuvie: models?.release_date ?? "", voteAverageMovie: models?.vote_average.description ?? "")
        case 2:
            let models = presenter?.modelsForOnTheAir[indexPath.row]
            cell.setupCell(posterImage: models?.poster_path ?? "", titleOfMovie: models?.name ?? "", descriptionMovie: models?.overview ?? "", dateOfMuvie: models?.first_air_date ?? "", voteAverageMovie: models?.vote_average.description ?? "")
        case 3:
            let models = presenter?.modelsForTvAiringToday[indexPath.row]
            cell.setupCell(posterImage: models?.poster_path ?? "", titleOfMovie: models?.name ?? "", descriptionMovie: models?.overview ?? "", dateOfMuvie: models?.first_air_date ?? "", voteAverageMovie: models?.vote_average.description ?? "")
        default:
            let models = presenter?.modelsForMovies[indexPath.row]
            cell.setupCell(posterImage: models?.poster_path ?? "", titleOfMovie: models?.title ?? "", descriptionMovie: models?.overview ?? "", dateOfMuvie: models?.release_date ?? "", voteAverageMovie: models?.vote_average.description ?? "")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = DetailViewRouter()
        switch segmetedControl.selectedSegmentIndex {
        case 0:
            let models = (presenter?.modelsForMovies[indexPath.row])!
            colectionView.deselectItem(at: indexPath, animated: true)
            detailView.showDetailViewForMovies(fromView: self, DataForDatail: models.id)
        case 1:
            let models = (presenter?.modelsForMoviesTopRated[indexPath.row])!
            colectionView.deselectItem(at: indexPath, animated: true)
            detailView.showDetailViewForMovies(fromView: self, DataForDatail: models.id)
        case 2:
            let models = (presenter?.modelsForOnTheAir[indexPath.row])!
            print(models.id)
            colectionView.deselectItem(at: indexPath, animated: true)
            detailView.showDetailViewForOnTheAir(fromView: self, DataForDatail: models.id)
    
        case 3:
            let models = (presenter?.modelsForTvAiringToday[indexPath.row])!
            print(models.id)
            colectionView.deselectItem(at: indexPath, animated: true)
            detailView.showDetailViewForOnTheAir(fromView: self, DataForDatail: models.id)
           
        default:
            let models = (presenter?.modelsForMovies[indexPath.row])!
            colectionView.deselectItem(at: indexPath, animated: true)
            detailView.showDetailViewForMovies(fromView: self, DataForDatail: models.id)
        }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340/2, height: 325)
    }
}
