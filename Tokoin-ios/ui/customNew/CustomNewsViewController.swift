import UIKit
import RxSwift
import RxCocoa

let customItemId = "CustomItemId"
class CustomNewsViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    //set picker delegate
    let category = ["apple","bitcoin","earthquake","animal"]
    private let disposeBag = DisposeBag()
    private let customViewModel = CustomNewsViewModel()
    var articleList : [ArticleItem] = []
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(category[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerInput.text = category[row]
        pickerInput.resignFirstResponder()
        customViewModel.requestNewsByCategory(category: category[row])
    }
    
    var rycHome : UICollectionView!
    let emptyMsg : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Please select one category"
        label.textAlignment = .center
        return label
        }()
    let pickerInput : UITextField = {
        let picker = UITextField()
        picker.placeholder = "Select News"
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.textAlignment = .center
        return picker
    }()
    let picker : UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .gray
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Custom view"
        addViewAndLayout()
        pickerInput.inputView = picker
        observeData()
    }
    func observeData(){
        customViewModel.articleListItem.asObserver().subscribe(onNext: {articles in
            if articles.count > 0 {
                self.emptyMsg.isHidden = true
            }
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
        rycHome.register(HomeItemCell.self, forCellWithReuseIdentifier: customItemId)
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(pickerInput)
        view.addSubview(rycHome)
        view.addSubview(emptyMsg)
        pickerInput.anchor(view.topAnchor,left: nil,right: view.rightAnchor,topConstant: 100,leftConstant: 0,bottomConstant: 0,
                      rightConstant: 0,widthConstant: 200,heightConstant: 40)
        rycHome.anchor(pickerInput.bottomAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,topConstant: 20,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 0)
        emptyMsg.anchorCenterSuperview()
        
    }
}
extension CustomNewsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return articleList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customItemId, for: indexPath) as! HomeItemCell
        cell.navigation = navigationController
        cell.backgroundColor = .white
        cell.articleItem = articleList[indexPath.row]
        return cell
    }
}
extension CustomNewsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 386, height: 151)
    }
}
