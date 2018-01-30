//
//  ViewController.m
//  demo66
//
//  Created by SP-iMac on 2018/1/27.
//  Copyright © 2018年 SP-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *redView1;

@property(nonatomic,strong)UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //sdfsdfsdfggggg
    //dsfsdfsdf
    //diadanadnf,nfd
    UIDynamicAnimator *dynami = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(150, 400, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    view.transform = CGAffineTransformMakeRotation(M_PI/4);
    view1.backgroundColor = [UIColor grayColor];
//    view.transform = CGAffineTransformMakeRotation(M_PI/4);
    self.redView = view;
    self.redView1 = view1;
    [self.view addSubview:self.redView];
//    [self.view addSubview:self.redView1];
    self.animator = dynami;
    
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self testGravityAndCollsion];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:point];
    
    snap.damping=arc4random_uniform(10)/10.0;
    [self.animator removeAllBehaviors];
    [self.animator addBehavior:snap];
}

- (void)testGravity
{
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
    [gravity addItem:self.redView];
    [self.animator addBehavior:gravity];
}

- (void)testGravityAndCollsion
{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
//    gravity.angle = (M_PI+M_PI_2);
    
    [gravity addItem:self.redView];
    
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
    collision.collisionMode = UICollisionBehaviorModeEverything;
    [collision addItem:self.redView];
    [collision addItem:self.redView1];
    
    collision.translatesReferenceBoundsIntoBoundary=YES;
    
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
