import UIKit


let customItemId = "CustomItemId"
class CustomNewsViewController: UIViewController{
    var rycHome : UICollectionView!
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
    }

    func addViewAndLayout(){
        rycHome = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        rycHome.dataSource = self
        rycHome.delegate = self
        rycHome.showsVerticalScrollIndicator = false
        rycHome.backgroundColor = .white
        rycHome.register(HomeItemCell.self, forCellWithReuseIdentifier: customItemId)
        view.addSubview(titleHome)
        view.addSubview(rycHome)
        titleHome.anchor(view.topAnchor,left: view.leftAnchor,bottom: nil,right: nil,topConstant: 40,leftConstant: 16,bottomConstant: 0,rightConstant: 0, widthConstant: 126, heightConstant: 36)
        rycHome.anchor(titleHome.bottomAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,topConstant: 20,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 0)
        }
}
extension CustomNewsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customItemId, for: indexPath) as! HomeItemCell
        cell.navigation = navigationController
        cell.backgroundColor = .white
        return cell
    }
}
extension CustomNewsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 386, height: 151)
    }
}
