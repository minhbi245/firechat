//
//  ConversationController.swift
//  FirebaseChatMVVM
//
//  Created by KhanhNguyen on 26/01/2021.
//

import Foundation
import UIKit

private let reuseIdentifier = "ConversationCell"

class ConversationController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Selectors
    @objc private func showProfile() {
        
    }
    
    // MARK: Helpers
    private func configureUI() {
        configureNav()
        configureTableView()
    }
    
    private func configureNav() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    private func configureTableView() {
        tableView.frame = view.frame
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
}

extension ConversationController: UITableViewDelegate {
    
}

extension ConversationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    
}
