//
//  CardChooserViewController.m
//  CardViewer
//
//  Created by Jorn Nordahl on 2/21/13.
//  Copyright (c) 2013 Jorn Nordahl. All rights reserved.
//

#import "CardChooserViewController.h"
#import "CardDisplayViewController.h"

@interface CardChooserViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UISlider *changeRank;

@property (nonatomic) NSUInteger rank;
@property (nonatomic, readonly) NSString *suit;

@end

@implementation CardChooserViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCard"])
    {
        if ([segue.destinationViewController isKindOfClass:[CardDisplayViewController class]])
        {
            CardDisplayViewController *viewController = (CardDisplayViewController *) segue.destinationViewController;
            
            viewController.suit = self.suit;
            viewController.rank = self.rank;
            
            viewController.title = [[self rankAsString] stringByAppendingString:self.suit];
        }
    }
    
    
    
    //segue.destinationViewController;
}


-(void) setRank:(NSUInteger)rank
{
    _rank = rank;
    self.rankLabel.text = [self rankAsString];
}

-(NSString *) suit
{
    return [self.suitSegmentedControl titleForSegmentAtIndex:self.suitSegmentedControl.selectedSegmentIndex];
}


-(NSString *) rankAsString
{
    return @[@"?", @"A",@"2",@"3",@"4",@"5",@"6",@"7", @"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

- (IBAction)changeRank:(UISlider *)sender {
    self.rank = round(sender.value);
}





@end
