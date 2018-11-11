//
//  CompletedTest.swift
//  TodoListTests
//
//  Created by Sandesh Basnet on 10/24/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import XCTest
@testable import TodoList



class CompletedTest: XCTestCase {
    
    var completed:[TaskLists] = []
    var todo:[TaskLists] = []
    
    var testData = ["4", "3"]
    
    var testTodo = ["1", "2"]
    
    
    var todoManager = TodoListManager()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        super.setUp()
        
        self.completed = todoManager.getList()
        self.todo = todoManager.getTodo()
    }
    
    func test_getData() {
        
        var count:Int = 0;
        
        for val in completed {
            
            XCTAssertEqual(val.title, testData[count])
            count = count + 1
        }
    }
    
    func test_getTodoData() {
        
        var count:Int = 0;
        
        for val in todo {
            
            XCTAssertEqual(val.title, testTodo[count])
            count = count + 1
            
        }
    }
    
    
    

  

}
