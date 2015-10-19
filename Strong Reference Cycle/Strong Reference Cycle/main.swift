//
//  main.swift
//  Strong Reference Cycle
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Project {
    var name = "";
    var projectDone = false;
    var listOfTasks = [Task]();
    deinit{
        print("\(self.name) project is being deinitialized")
    }
    func checkIfProjectDone()->Bool{
        for task in listOfTasks{
            if(task.done == false){
                return false;
            }
        }
        return true;
    }
    
}

class Task {
    var name = "";
    private var _done = false{
        didSet{
            var allIsDone = true;
            for t in (parent?.listOfTasks)!{
                if t._done == false{
                    allIsDone = false;
                    break;
                }
            }
            if allIsDone{
                print("\(parent?.name) is completed.");
            }
        }
    }
    var done: Bool{
        set{
            _done = newValue;
        }
        get{
            return _done;
        }
    }
    weak var parent: Project?
    deinit{
        print("\(self.name) task is being deinitialized")
    }
}

var p: Project? = Project();
p!.name = "Cook Dinner";

let taskNames = ["Choose Menu", "Buy Groceries", "Prepare Ingridients", "Cook Food"];

for name in taskNames{
    var t = Task();
    t.name = name;
    t.parent = p;
    p!.listOfTasks.append(t);
}

if let projectDone = p?.checkIfProjectDone(){
    print(projectDone ? "the project done." : "the project didn't done.");
}
if let projectDone = p?.checkIfProjectDone(){
    print(projectDone ? "the project done." : "the project didn't done.");
}
print("done.")


