

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the viewcontroller as the datasource and delegate of the tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detect which article was selected
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else{
            //user hasn't selected anything
            return
        }
        
        //get article user tapped on
        let article = articles[indexPath!.row]
        
        //get a reference to detailed vc
        let detailVC = segue.destination as! DetailViewController
        
        //pass the article url to detailed vc
        detailVC.articleUrl = article.url!
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article that the tableview is asking about
        let article = articles[indexPath.row]
        
        // Customize it
        cell.displayArticle(article)
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //user selected row
        //performSegue(withIdentifier:"goToDetail",sender:self)
        
    }
}

extension ViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
}
