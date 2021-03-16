import UIKit
import RxSwift
import RxCocoa

let homeItemId = "homeItemId"

class HomeViewController: UIViewController{
    var rycHome : UICollectionView!
    var homeViewModel = HomeViewModel()
    var articleList : [ArticleItem] = []
    private let disposeBag = DisposeBag()
    let titleHome : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="HOME"
        label.textAlignment = .left
        return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewAndLayout()
        observeData()
    }
    
    func observeData(){
        homeViewModel.articleListItem.asObserver().subscribe(onNext: {articles in
            self.articleList = articles
            self.rycHome.reloadData()
        }).disposed(by: disposeBag)
        
    }
    func addViewAndLayout(){
        rycHome = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        rycHome.dataSource = self
        rycHome.delegate = self
        rycHome.showsVerticalScrollIndicator = false
        rycHome.backgroundColor = .white
        rycHome.register(HomeItemCell.self, forCellWithReuseIdentifier: homeItemId)
        view.addSubview(titleHome)
        view.addSubview(rycHome)
        titleHome.anchor(view.topAnchor,left: view.leftAnchor,bottom: nil,right: nil,topConstant: 40,leftConstant: 16,bottomConstant: 0,rightConstant: 0, widthConstant: 126, heightConstant: 36)
        rycHome.anchor(titleHome.bottomAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,topConstant: 20,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 0)
        }
}
extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeItemId, for: indexPath) as! HomeItemCell
        cell.navigation = navigationController
        cell.backgroundColor = .white
        cell.articleItem = articleList[indexPath.row]
        
        return cell
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 386, height: 151)
    }
}
