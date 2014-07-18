//
//  dragViewController.m
//  LearnNumbers
//
//  Created by BSA Univ15 on 10/07/14.
//  Copyright (c) 2014 BSA Univ15. All rights reserved.
//

#import "dragViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RandomNumClass.h"

@interface dragViewController (){
    RandomNumClass *ranclass;
    NSArray *getarray;
    int ImgCount;
    int randomImgNum[10];
    int rancount[10];
    int i;
    int j;
    
    NSString *imageName;
    UIImage *img1;
    NSString *imageName2;
    UIImage *img2;
  
   
    NSData *binaryimg1;
    NSData *binaryimg2;
    
}
@property(strong,nonatomic)NSData *binaryimg1;
@property(strong,nonatomic)NSData *binaryimg2;

@property(strong,nonatomic)NSArray *imagesArrayTopFrame;
@property(strong,nonatomic)NSArray *imagesArrayBottomFrame;

@end

@implementation dragViewController

@synthesize binaryimg2,binaryimg1;

@synthesize imagesArrayTopFrame;

@synthesize imagesArrayBottomFrame;

@synthesize dragViews = dragViews_;

@synthesize goodFrames =goodFrames_;

@synthesize badFrames = badFrames_;

@synthesize canDragMultipleViewsAtOnce =canDragMultipleViewsAtOnce_;

@synthesize canUseTheSameFrameManyTimes =canUseTheSameFrameManyTimes_;


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ranclass=[[RandomNumClass alloc]init];
    getarray=[ranclass doRandom];
     NSLog(@"Random Numbers %@",getarray.description);
    
    self.view.backgroundColor = [UIColor underPageBackgroundColor];
    
    
    int device = 2;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        device = 4;
    }

    
    self.goodFrames = [NSMutableArray arrayWithCapacity:device];
    self.badFrames = [NSMutableArray arrayWithCapacity:device];
    self.imagesarr=[NSMutableArray arrayWithCapacity:device];
    
    NSMutableArray *goodFrames = [NSMutableArray arrayWithCapacity:device];
    NSMutableArray *badFrames = [NSMutableArray arrayWithCapacity:device];
    
   // goodFrames=[NSMutableArray arrayWithObject:@"num1.png"];
    
    self.dragViews = [NSMutableArray arrayWithCapacity:device];
    
    
    
    imagesArrayTopFrame = [[NSArray alloc] initWithObjects:@"1.png", @"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png",@"16.png",@"17.png",@"18.png",@"19.png",@"20.png", nil];
    
   imagesArrayBottomFrame=[[NSArray alloc] initWithObjects:@"1.png", @"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png",@"16.png",@"17.png",@"18.png",@"19.png",@"20.png", nil];
    

    
    
    for (i = 0; i<=device; i++) {
        
        
        randomImgNum[i] = arc4random_uniform(20);
        
        rancount[i]=randomImgNum[i];
        
        imageName = [imagesArrayTopFrame objectAtIndex:randomImgNum[i]];
        
        img1 = [UIImage imageNamed:imageName];
        
        imageName2 = [imagesArrayBottomFrame objectAtIndex:randomImgNum[i]];
        
        img2 = [UIImage imageNamed:imageName2];
        
        binaryimg1 = UIImageJPEGRepresentation(img1, 1);
        binaryimg2 = UIImageJPEGRepresentation(img2, 1);
        
        if ([binaryimg1 isEqualToData:binaryimg2]) {
            NSLog(@"Same image");
            self.flag=YES;
        }
        else{
           NSLog(@"not same image");
            self.flag=NO;
        }
        
        CGRect endFrame =   CGRectMake(30 + i * 103, 150, 50, 50);
      
        UIImageView *img=[[UIImageView alloc]init];
        
       // img.alpha=0.10;
//        UILabel *lab=[[UILabel alloc]init];
//        lab.text=[NSString stringWithFormat:@"  %@", [getarray objectAtIndex:i]];
//        
//        lab.font=[UIFont fontWithName:@"HelveticaNeue" size:25];
//        [lab setFrame:endFrame];

        [img setFrame:endFrame];
        
        [img setImage:[UIImage imageNamed:[imagesArrayTopFrame objectAtIndex:randomImgNum[i]]]];
        [[self view]addSubview:img];
        
//        CGRect badFrame =   CGRectMake(30 + i * 103, 290, 50, 50);
        
        
      //  [img setImage:[UIImage imageNamed:[imagesArray objectAtIndex:0]]];
        
//        for (int j=0; j<=device; j++)
//        {
//             UIImageView *img=[[UIImageView alloc]init];
//             [img setFrame:endFrame];
//            
//             [img setImage:[UIImage imageNamed:[imagesArray objectAtIndex:j]]];
//            [[self view]addSubview:img];
//        }
       
        
      
        
        [goodFrames addObject:[TKCGRect from:endFrame forView:self.view]];
//        [badFrames addObject:[TKCGRect from:badFrame forView:self.view]];
     
        UIView *endView = [[UIView alloc] initWithFrame:endFrame];
        endView.layer.borderColor = [UIColor greenColor].CGColor;
        endView.layer.borderWidth = 1.0f;

        
        [self.view addSubview:endView];
        
        [self.goodFrames addObject:endView];
        
//        UIView *badView = [[UIView alloc] initWithFrame:badFrame];
//        badView.layer.borderWidth = 1.0f;
//        badView.layer.borderColor = [UIColor redColor].CGColor;
//        [self.view addSubview:badView];
//        
//        [self.badFrames addObject:badView];
    
    
    }
    
    self.canUseTheSameFrameManyTimes = NO;
    self.canDragMultipleViewsAtOnce = NO;

    
    
    
    for (j = 0; j<=device; j++) {
        
        //int randomImgNum = arc4random_uniform(5);
        UIImage *image = [UIImage imageNamed:[imagesArrayBottomFrame objectAtIndex:rancount[j]]];
        
        CGRect startFrame = CGRectMake(30 + j * 103, 40, 50, 50);
        
        
        TKDragView *dragView = [[TKDragView alloc] initWithImage:image
                                                      startFrame:startFrame
                                                      goodFrames:goodFrames
                                                       badFrames:badFrames
                                                     andDelegate:self];
        
        
        //dragView.dragsAtCenter = YES;
        dragView.canDragMultipleDragViewsAtOnce = NO;
        dragView.canUseSameEndFrameManyTimes = NO;
        
        [self.dragViews addObject:dragView];
        
        [self.view addSubview:dragView];
        
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
        [g setNumberOfTapsRequired:2];
        [dragView addGestureRecognizer:g];
    }
    
//    CGFloat width = self.view.frame.size.width /2;
    
//    UIButton *allowMultidrag = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    allowMultidrag.frame = CGRectMake(6, 400, width*0.9 , 44);
//    [allowMultidrag setTitle:@"Multidrag : OFF" forState:UIControlStateNormal];
//    [allowMultidrag addTarget:self action:@selector(allowMultidrag:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:allowMultidrag];
//    
//    UIButton *allowTakeSameSpot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    allowTakeSameSpot.frame = CGRectMake(width, 400, width*0.9, 44);
//    [allowTakeSameSpot addTarget:self action:@selector(allowTakeSameSpot:) forControlEvents:UIControlEventTouchUpInside];
//    [allowTakeSameSpot setTitle:@"Same frame: OFF" forState:UIControlStateNormal];
//    [self.view addSubview:allowTakeSameSpot];
    
    
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark - Private

- (void)allowMultidrag:(UIButton * )button{
    
    self.canDragMultipleViewsAtOnce = !self.canDragMultipleViewsAtOnce;
    
    for (TKDragView *drag in self.dragViews) {
        drag.canDragMultipleDragViewsAtOnce = !drag.canDragMultipleDragViewsAtOnce;
    }
    
    if (self.canDragMultipleViewsAtOnce) {
        [button setTitle:@"Multidrag: ON" forState:UIControlStateNormal];
    }
    else{
        [button setTitle:@"Multidrag: OFF" forState:UIControlStateNormal];
    }
    
    
}

- (void)allowTakeSameSpot:(UIButton * )button{
    
    self.canUseTheSameFrameManyTimes = !self.canUseTheSameFrameManyTimes;
    
    for (TKDragView *drag in self.dragViews) {
        drag.canUseSameEndFrameManyTimes = !drag.canUseSameEndFrameManyTimes;
    }
    
    if (self.canUseTheSameFrameManyTimes) {
        [button setTitle:@"Same frame: ON" forState:UIControlStateNormal];
    }
    else{
        [button setTitle:@"Same frame: OFF" forState:UIControlStateNormal];
    }
}

- (void)taped:(UITapGestureRecognizer *)tap{
    
}


#pragma mark - TKDragViewDelegate

- (void)dragViewDidStartDragging:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

- (void)dragViewDidEndDragging:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}


- (void)dragViewDidEnterStartFrame:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.alpha = 0.5;
    }];
}

- (void)dragViewDidLeaveStartFrame:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.alpha = 1.0;
    }];
}


- (void)dragViewDidEnterGoodFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
    if (_flag==YES) {
        
    
    UIView *view = [self.goodFrames objectAtIndex:index];
    
    if (view) view.layer.borderWidth = 4.0f;
        
    }
    //view.hidden=YES;
    
    
    
    
}

- (void)dragViewDidLeaveGoodFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
    UIView *view = [self.goodFrames objectAtIndex:index];
    
    if (view) view.layer.borderWidth = 1.0f;
    //view.hidden=YES;
}


//- (void)dragViewDidEnterBadFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
//    
//    UIView *view = [self.badFrames objectAtIndex:index];
//    
//    if (view) view.layer.borderWidth = 4.0f;
//}
//
//- (void)dragViewDidLeaveBadFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
//    
//    UIView *view = [self.badFrames objectAtIndex:index];
//    
//    if (view) view.layer.borderWidth = 1.0f;
//}


- (void)dragViewWillSwapToEndFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
    
    
    
}

//- (void)dragViewDidSwapToEndFrame:(TKDragView *)dragView atIndex:(NSInteger)index{
//    
//    
//    [UIView animateWithDuration:0.2
//                          delay:0.1
//                        options:UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                         dragView.transform = CGAffineTransformMakeRotation(M_PI);
//                     }
//                     completion:^(BOOL finished) {
//                         
//                     }];
//}


- (void)dragViewWillSwapToStartFrame:(TKDragView *)dragView{
    [UIView animateWithDuration:0.2 animations:^{
        dragView.alpha = 1.0f;
    }];
}

- (void)dragViewDidSwapToStartFrame:(TKDragView *)dragView{
    
}

@end
