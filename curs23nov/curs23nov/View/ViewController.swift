//
//  ViewController.swift
//  curs23nov
//
//  Created by Vlad Groza on 23.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var loaderView: UIActivityIndicatorView!
    @IBOutlet private weak var commentsTableView: UITableView!
    
    private let postsViewModel = PostsViewModel()
    private let commentsViewModel = CommentsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        postsViewModel.delegate = self
        postsViewModel.loadPosts()
        
        commentsViewModel.delegate = self
        commentsViewModel.loadComments(postId: 1)
        commentsViewModel.loadComments(postId: 4)
        
        commentsTableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsViewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.configure(comment: commentsViewModel.comments![indexPath.row])
        
        return cell
    }
    
    
}


extension ViewController: PostsViewModelDelegate {
    func postsDidLoad(posts: [Post]) {
        posts.forEach { post in
            print(post)
        }
    }

    func postsDidLoadWithFailure(error: Error) {
        print(error)
    }

    func postsAreLoading() {
        print("Posts loading...")
    }
}

extension ViewController: CommentsViewModelDelegate {
    func commentsDidLoad(comments: [Comment]) {
        comments.forEach { comment in
            print(comment)
        }
        loaderView.isHidden = true
        commentsTableView.isHidden = false
        commentsTableView.reloadData()
    }
    
    func commentsDidLoadWithFailure(error: Error) {
        let alertController = UIAlertController(title: "Error", message: "Try later", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in self.commentsViewModel.loadComments(postId: 1)}
        
        alertController.addAction(cancelAction)
        alertController.addAction(retryAction)
        
        self.present(alertController, animated: true)
    }
    
    func commentsAreLoading() {
        loaderView.isHidden = false
        commentsTableView.isHidden = true
    }
}
