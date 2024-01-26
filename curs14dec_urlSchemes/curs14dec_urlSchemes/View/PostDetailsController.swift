//
//  PostDetailsController.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import UIKit

class PostDetailsController: UIViewController {
    
    @IBOutlet private weak var postInfoLabel: UILabel!
    @IBOutlet private weak var commentsTableView: UITableView!
    @IBOutlet private weak var commentsLabel: UILabel!
    
    var postId: Int?
    private let viewModel = PostDetailsViewModel()
    private let commentsViewModel = CommentsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        postInfoLabel.text = nil
        postInfoLabel.numberOfLines = 0
        commentsLabel.text = nil
        viewModel.delegate = self
        commentsViewModel.delegate = self
        if let postId {
            viewModel.loadPost(postId: postId)
            commentsViewModel.loadComments(postId: postId)
        }
        
        commentsTableView.dataSource = self
    }
 

}

extension PostDetailsController: PostDetailsViewModelDelegate {
    func postIsLoading() {
        postInfoLabel.text = "Post is loading"
    }
    
    func postDidLoad(post: Post) {
        postInfoLabel.text = "Title: " + post.title + "\nBody: " + post.body
    }
    
    func postDidFail(error: Error) {
        postInfoLabel.text = "Post has error!"
    }
    
    
}

extension PostDetailsController: CommentsViewModelDelegate {
    func commentsDidLoad(comments: [Comment]) {
        commentsLabel.text = "Comments"
        commentsTableView.isHidden = false
        commentsTableView.reloadData()
    }
    
    func commentsDidLoadWithFailure(error: Error) {
        commentsLabel.text = "Comments have error!"
    }
    
    func commentsAreLoading() {
        commentsLabel.text = "Comments are loading"
        commentsTableView.isHidden = true
    }
    
    
}


extension PostDetailsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsViewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        cell.configure(comment: commentsViewModel.comments![indexPath.row])
        
        return cell
    }
    
    
}
