//
//  ViewController.swift
//  Rand Photo
//
//  Created by Илья Александрович on 17.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Rand Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPicture()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 60)
    }
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemTeal,
        .systemBrown,
        .systemOrange
    ]
    
    @objc func didTapButton() {
        getRandomPicture()
        
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPicture() {
        let urlString = "https://picsum.photos/400"
        let url = URL(string: urlString)!
        guard let data = try?  Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
    }
    
    


}

