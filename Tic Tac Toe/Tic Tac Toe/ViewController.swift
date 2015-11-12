//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by גיל אושר on 11.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameOverController: UIAlertController!;
    var invalidMove: UIAlertController!;
    var boardX = 15;
    var boardY = 80;
    var buttons: [UIButton]!;
    var board: UIImageView!;
    var gameOverTitle: String!;
    var message: String!;
    var game: TicTacToe!;
    var resetButton: UIButton!;
    var xPoints = 0;
    var oPoints = 0;
    var pointsTitle: UILabel!;
    var pointsResults: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        board = UIImageView(image: UIImage(named: "board"))
        board.frame = CGRect(x: boardX, y: boardY, width: 300, height: 300);
        view.addSubview(board);
        
        initializeBoard();
        
        game = TicTacToe();
        gameOverTitle = "המשחק נגמר";
        message = "אנא לחץ כאן";
        gameOverController = UIAlertController(title: gameOverTitle, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let action_end = UIAlertAction(title: "סיום", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            
        }
        let action_new_game = UIAlertAction(title: "משחק חדש", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            self.startNewGame();
        }
        gameOverController.addAction(action_end);
        gameOverController.addAction(action_new_game);
        
        invalidMove = UIAlertController(title: "מהלך לא חוקי", message: "אנא נסה שנית", preferredStyle: UIAlertControllerStyle.Alert);
        invalidMove.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Cancel, handler: nil))
        resetButton = UIButton(type: UIButtonType.System);
        resetButton.frame = CGRect(x: board.frame.origin.x, y: board.frame.maxY, width: 100, height: 30);
        resetButton.setTitle("איפוס", forState: UIControlState.Normal)
        resetButton.addTarget(self, action: "resetFromButton:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(resetButton);
        pointsTitle = UILabel(frame: CGRect(x: view.frame.width/2, y: resetButton.frame.origin.y, width: 100, height: 30))
        pointsTitle.text = "ניקוד"
        view.addSubview(pointsTitle);
        pointsResults = UILabel(frame: CGRect(x: (view.frame.width - 75) / 2, y: pointsTitle.frame.maxY, width: 150, height: 30))
        pointsResults.text = "X : \(xPoints)      O : \(oPoints)";
        view.addSubview(pointsResults);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    func initializeBoard(){
        buttons = [UIButton]();
        for i in 0..<9{
            buttons.append(UIButton(type: UIButtonType.Custom));
            buttons[i] = UIButton(type: UIButtonType.Custom);
            if(i%3 == 0){
                boardX = 15;
            }else{
                boardX += 100
            }
            if(i/3 == 0){
                boardY = 100;
            }else if(i/3 == 1){
                boardY = 190
            }else{
                boardY = 280;
            }
            buttons[i].frame = CGRect(x: boardX, y: boardY, width: 80, height: 80);
            buttons[i].tag = i;
            buttons[i].addTarget(self, action: "cellClickListener:", forControlEvents: UIControlEvents.TouchDown);
            view.addSubview(buttons[i])
        }
    }
    
    func cellClickListener(sender: UIButton){
        let cell = sender.tag + 1;
        let moveResult: TicTacToe.MoveResult = game.MakeMove(cell) ;
        if moveResult == TicTacToe.MoveResult.INVALID_MOVE{
            presentViewController(invalidMove, animated: true, completion: nil);
        }else{
            let value = game.isXturn == true ? "x" : "o";
            sender.setBackgroundImage(UIImage(named: value), forState: UIControlState.Normal);
            if moveResult != TicTacToe.MoveResult.VALID_MOVE{
                if moveResult == TicTacToe.MoveResult.VICTORY{
                    gameOverController.message = "המנצח הוא " + value + " !";
                    if(value == "x"){
                        xPoints++;
                    }else{
                        oPoints++;
                    }
                    pointsResults.text = "X : \(xPoints)      O : \(oPoints)";
                }else{
                    gameOverController.message = "יש לנו תיקו!";
                }
                presentViewController(gameOverController, animated: true, completion: nil);
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetFromButton(sender: UIButton){
        startNewGame();
    }
    
    func startNewGame(){
        game.resetGame();
        for i in 0..<9{
            buttons[i].setBackgroundImage(nil, forState: UIControlState.Normal)
        }
        initializeBoard();
    }
    
}

