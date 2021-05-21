//
//  StrategyViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import UIKit

enum ButtonType: Int {
    case music = 0
    case movie = 1
    case manga = 2
    case anime = 3
}

struct ButtonModel {
    var button: UIButton
    var isSelected: Bool = false
}

class StrategyViewController: UIViewController {

    @IBOutlet weak var btnMusic: UIButton!
    @IBOutlet weak var btnMovie: UIButton!
    @IBOutlet weak var btnManga: UIButton!
    @IBOutlet weak var btnAnime: UIButton!
    @IBOutlet weak var lbMode: UILabel!
    
    fileprivate var textSelected: UIColor = UIColor.white
    fileprivate var textNotSelected: UIColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
    fileprivate var backGroundSelected: UIColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
    fileprivate var backGroundNotSelected: UIColor = UIColor.white
    
    var groupButton: [UIButton]?
    var modeButtons: [ButtonModel] = [ButtonModel]()
    
    var searchStrategy: SearchStrategy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupButton = [btnMusic, btnMovie, btnManga, btnAnime]
        initButtons()
        setUp(searchStrategy: SearchStrategy())
    }

    func initButtons() {
        groupButton?.forEach({ button in
            let m = ButtonModel(button: button, isSelected: false)
            modeButtons.append(m)
            
        })
        addCornerToButtons(buttons: [btnMusic, btnMovie, btnManga, btnAnime])
    }

    func setUp(searchStrategy: SearchStrategy) {
        self.searchStrategy = searchStrategy
    }
    
    // Usage
    @IBAction func selectMode(_ sender: UIButton) {
        modeButtons = selectSingle(selectedButton: sender, buttonModel: modeButtons, isReset: false)
        switch sender.tag {
        case ButtonType.music.rawValue:
            searchStrategy?.setStrategy(strategy: MusicStrategy())
        case ButtonType.movie.rawValue:
            searchStrategy?.setStrategy(strategy: MovieStrategy())
        case ButtonType.manga.rawValue:
            searchStrategy?.setStrategy(strategy: MangaStrategy())
        default:
            searchStrategy?.setStrategy(strategy: AnimeStrategy())
        }
        let a = searchStrategy?.search()
        lbMode.text = a
    }
  
}

extension StrategyViewController {
    func selectSingle(selectedButton: UIButton?, buttonModel: [ButtonModel], isReset: Bool) -> [ButtonModel] {
        var temp = [ButtonModel]()
        if let button = selectedButton {
            for var model in buttonModel {
                // if button is the selected button
                if button == model.button {
                    model.isSelected = isReset ? true : !model.isSelected
                } else {
                    model.isSelected = false
                }
                temp.append(model)
            }
        } else {
            for var model in buttonModel {
                model.isSelected = false
                temp.append(model)
            }
        }
        colorButton(model: temp)
        return temp
    }
    
    func colorButton(model: [ButtonModel]) {
        for item in model {
            setUpButton(button: item.button, status: item.isSelected)
        }
    }
    
    func setUpButton(button: UIButton, status: Bool) {
        button.backgroundColor = status ? backGroundSelected : backGroundNotSelected
        button.setTitleColor(status ? textSelected : textNotSelected, for: .normal)
        if let image = button.currentImage {
            button.changeImageColor(image: image, color: status ? textSelected : backGroundSelected)
        }
    }

    func addCornerToButtons(buttons: [UIButton]) {
        buttons.forEach { (b) in
            b.layer.cornerRadius = 15
            b.layer.borderColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1).cgColor
            b.layer.borderWidth = 1
        }
    }
}
extension UIButton {
    func changeImageColor(image: UIImage, color: UIColor) {
        let myImage = image.withRenderingMode(.alwaysTemplate)
        self.setImage(myImage, for: .normal)
        self.tintColor = color
    }
}
