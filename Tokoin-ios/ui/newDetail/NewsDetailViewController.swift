import UIKit


class NewsDetailViewController: UIViewController{
    var article : ArticleItem?{
        didSet{
            if(article != nil){
                thumb.loadImage(urlString : article!.urlToImage ?? "")
                newsTitle.text = article!.title
                content.text = article!.content
                url.text = article!.url
            }
        }
    }
    let newsTitle : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text="Biden Tells Nation There Is Hope After a Devastating Year"
        label.textAlignment = .left
        return label
        }()
    let thumb : CachedImageView = {
        let image = CachedImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let url : UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.05177086591720581, green: 0.2356313019990921, blue: 0.887499988079071, alpha: 1)
        label.text="http://vnexpress.net"
        label.textAlignment = .left
        return label
        }()
    let content : UITextView = {
        let label = UITextView()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.4274509847164154, green: 0.4274509847164154, blue: 0.43529412150382996, alpha: 1)
        label.text="Biden Tells Nation There Is Hope After a Devastating Year Biden Tells Nation There Is Hope After a Devastating Year Biden Tells Nation There Is Hope After a Devastating Year"
        label.textAlignment = .left
        return label
        }()
    override func viewDidLoad() {
          super.viewDidLoad()
          addViewAndLayout()
    }

    func addViewAndLayout(){
        view.backgroundColor = .white
        view.addSubview(newsTitle)
        view.addSubview(thumb)
        view.addSubview(url)
        view.addSubview(content)
        newsTitle.anchor(view.topAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 150,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 60)
        thumb.anchor(newsTitle.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 23,leftConstant: 0,bottomConstant: 0,rightConstant: 0, widthConstant: 0, heightConstant: 151)
        url.anchor(thumb.bottomAnchor,left: view.leftAnchor,bottom: nil,right: view.rightAnchor,topConstant: 23,leftConstant: 10,bottomConstant: 0,rightConstant: 21, widthConstant: 0, heightConstant: 38)
        content.anchor(url.bottomAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,topConstant: 0,leftConstant: 10,bottomConstant: 0,rightConstant: 10, widthConstant: 0, heightConstant: 0)
        }
}
