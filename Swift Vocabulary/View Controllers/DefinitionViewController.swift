//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Chad Parker on 1/29/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionTextView: UITextView!

    var vocabWord: VocabularyWord?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    func updateViews() {
        guard let word = vocabWord else { return }
        wordLabel.text = word.word
        definitionTextView.text = word.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
