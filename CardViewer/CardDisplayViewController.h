//
//  CardDisplayViewController.h
//  CardViewer
//
//  Created by Jorn Nordahl on 2/21/13.
//  Copyright (c) 2013 Jorn Nordahl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardDisplayViewController : UIViewController

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;

@end
