//
//  Tic Tac Toe.swift
//  Tic Tac Toe
//
//  Created by גיל אושר on 11.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class TicTacToe {
    
    var board: [CellValue];
    var moveCount: Int?;
    var isXturn: Bool!;
    
    init(){
        board = [CellValue]();
        for _ in 1...9{
            board.append(CellValue.EMPTY);
        }
        moveCount = 0;
        isXturn = true;
    }
    
    enum CellValue{
        case X
        case O
        case EMPTY
    }
    
    enum MoveResult{
        case VALID_MOVE
        case INVALID_MOVE
        case VICTORY
        case DRAW
    }
    
    
    
    func resetGame()->Void{
        for i in 0..<9{
            board[i] = CellValue.EMPTY;
        }
        moveCount = 0;
        isXturn = true;
    }
    
    
    func MakeMove(var cell: Int)->MoveResult{
        if(cell < 1 || cell > 9){
            return MoveResult.INVALID_MOVE;
        }
        cell--;
        if(board[cell] == CellValue.EMPTY){
            moveCount!++;
            board[cell] = isXturn==true ? CellValue.X : CellValue.O
            isXturn! = !isXturn!;
            if(moveCount > 4 && checkVictory(cell)){
                return MoveResult.VICTORY;
            }
            if moveCount == 9{
                return MoveResult.DRAW;
            }
            return MoveResult.VALID_MOVE;
        }
        return MoveResult.INVALID_MOVE;
    }
    
    //cell is zero based
    func checkVictory(cell: Int)->Bool{
        let row = 3 * (cell / 3);
        let column = cell % 3;
        if (board[column] == board[column+3] && board[column] == board[column+6]){
            return true;
        }
        if(board[row] == board[row+1] && board[row] == board[row+2]){ //board[3
            return true;
        }
        let diagonal1 = board[0] != CellValue.EMPTY && board[0] == board[4] && board[4] == board[8];
        let diagonal2 = board[2] != CellValue.EMPTY && board[2] == board[4] && board[4] == board[6];
        return diagonal1 || diagonal2;
    }
    
    
    func isXTurn() ->Bool{
        return isXturn!;
    }

    
    func getMoveCount()->Int{
        return moveCount!;
    }








    
}