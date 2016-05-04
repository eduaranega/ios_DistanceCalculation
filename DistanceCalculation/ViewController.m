//
//  ViewController.m
//  DistanceCalculation
//
//  Created by Eduardo Aranega on 5/3/16.
//  Copyright © 2016 Eduardo Aranega. All rights reserved.
//

#import "ViewController.h"
#import <DistanceGetter/DGDistanceRequest.h>

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *request;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;

@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;

@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController

- (IBAction)calculateButtonTapped:(id)sender {

    self.calculateButton.enabled = NO;

    self.request = [DGDistanceRequest alloc];
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationB.text;
    NSString *destC = self.endLocationC.text;

    NSArray *destinations = @[destA,destB,destC];

    self.request = [self.request initWithLocationDescriptions:destinations
                                            sourceDescription:start];

    // define the callback
    self.request.callback = ^void(NSArray *responses) {
        self.distanceC.text = @"callback";
        self.calculateButton.enabled = YES;
        self.request = nil;
    };

    // send a start messega to the object
    [self.request start];

}


@end
