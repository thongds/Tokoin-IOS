import UIKit


class HomeItemCell: UICollectionViewCell{
    var navigation : UINavigationController?
    var articleItem : ArticleItem? {
        didSet{
            if(articleItem != nil){
                title.text = articleItem!.title
                thumb.loadImage(urlString : articleItem!.urlToImage ?? "")
                descript.text = articleItem!.description
            }
           
        }
    }
    let thumb : CachedImageView = {
		let image = CachedImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		return image 
	}()
	let title : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
		label.text="Biden Tells Nation There Is Hope After a Devastating Year"
		label.textAlignment = .left
        label.numberOfLines = 3
		return label
		}()
	let descript : UILabel = {
		let label = UILabel()
        label.numberOfLines = 4
		label.font = UIFont.italicSystemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 0.4274509847164154, green: 0.4274509847164154, blue: 0.43529412150382996, alpha: 1)
		label.text="Biden Tells Nation There Is Hope After a Devastating Year Biden Tells Nation There Is Hope After a Devastating Year"
		label.textAlignment = .left
		return label
		}()
	let timerIcon : UIImageView = {
		let image = UIImageView(image: UIImage(named: "timericon"))
		image.translatesAutoresizingMaskIntoConstraints = false
		return image 
	}()
	let timer : UILabel = {
		let label = UILabel()
		label.font = UIFont.italicSystemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 0.6117647290229797, green: 0.6117647290229797, blue: 0.6117647290229797, alpha: 1)
		label.text="21:52:25 - 12/3/2021"
		label.textAlignment = .left
		return label
		}()
	override init(frame: CGRect) {
        super.init(frame: frame)
        addViewAndLayout()
        action()
    }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    func action() {
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openNewsDetail)))
    }
    @objc func openNewsDetail(){
        let newDetail = NewsDetailViewController()
        newDetail.article = articleItem
        navigation?.pushViewController(newDetail, animated: true)
    }
	func addViewAndLayout(){
    	contentView.addSubview(thumb)
		contentView.addSubview(title)
		contentView.addSubview(descript)
		contentView.addSubview(timerIcon)
		contentView.addSubview(timer)
    	thumb.anchor(contentView.topAnchor,left: contentView.leftAnchor,bottom: contentView.bottomAnchor,right: nil,topConstant: 0,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 150, heightConstant: 0)
		title.anchor(contentView.topAnchor,left: thumb.rightAnchor,bottom: nil,right: contentView.rightAnchor,topConstant: 0,leftConstant: 10,bottomConstant: 0,rightConstant: 10, widthConstant: 0, heightConstant: 33)
		descript.anchor(title.bottomAnchor,left: title.leftAnchor,bottom: nil,right: title.rightAnchor,topConstant: 10,leftConstant: 0,bottomConstant: 2,rightConstant: 0, widthConstant: 0, heightConstant: 0)
		timerIcon.anchor(nil,left: descript.leftAnchor,bottom: contentView.bottomAnchor,right: nil,topConstant: 0,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 24, heightConstant: 24)
		timer.anchor(timerIcon.topAnchor,left: timerIcon.rightAnchor,bottom: timerIcon.bottomAnchor,right: nil,topConstant: 0,leftConstant: 10,bottomConstant: 0,rightConstant: 0, widthConstant: 148, heightConstant: 0)
    	}
}
