import UIKit

class ProfileViewController: UIViewController{
    let welcomeTitle : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
		label.text="Welcome thongds"
		label.textAlignment = .center
		return label
    }()
	override func viewDidLoad() {
      	super.viewDidLoad()
      	addViewAndLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        let userName = AppConfig.getUserName()
        if(userName == nil){
            navigationController?.pushViewController(LoginViewController(), animated: false)
        }else{
            welcomeTitle.text = "Welcome \(userName!)"
        }
    }
	func addViewAndLayout(){
    	view.addSubview(welcomeTitle)
    	welcomeTitle.anchorCenterSuperview()
    }
}
