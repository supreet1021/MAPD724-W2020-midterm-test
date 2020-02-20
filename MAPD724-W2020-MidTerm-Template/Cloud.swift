
//Cloud.swift
//Name:Supreet Kaur
//Student Id:301093932import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.x < -450)
        {
            self.Reset()
        }
        
    }
    
    func Move()
    {
        self.position.y -= self.dy!
        self.position.x -= self.dx!
    }
    
    override func Reset()
    {
        self.position.x = 450
        let randomY:Int = (randomSource?.nextInt(upperBound: 360))! - 180
        self.position.y = CGFloat(randomY)
        self.dx = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        self.dy = CGFloat((randomSource?.nextUniform())! * -3.0) + 1.5
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 3
        self.Reset()
        self.alpha = 0.5
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
    
    
}
