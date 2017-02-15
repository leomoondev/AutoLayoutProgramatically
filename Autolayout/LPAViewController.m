//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) UIView *redBoxView;

@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@property (nonatomic, weak) UIView *purpleBoxView;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    //UIView and set its frame to CGRectZero
    UIView *purpleBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:purpleBoxView];

    UIView *firstBlueBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    firstBlueBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    firstBlueBoxView.backgroundColor = [UIColor blueColor];
    [framingView addSubview:firstBlueBoxView];

    UIView *secondBlueBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    secondBlueBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    secondBlueBoxView.backgroundColor = [UIColor blueColor];
    [framingView addSubview:secondBlueBoxView];
    
    UIView *thirdBlueBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    thirdBlueBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    thirdBlueBoxView.backgroundColor = [UIColor blueColor];
    [framingView addSubview:thirdBlueBoxView];
    
    UIView *redBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    redBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    redBoxView.backgroundColor = [UIColor redColor];
    [framingView addSubview:redBoxView];
    
    UIView *leftOrangeBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    leftOrangeBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    leftOrangeBoxView.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:leftOrangeBoxView];
    
    UIView *rightOrangeBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    rightOrangeBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    rightOrangeBoxView.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:rightOrangeBoxView];
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    [NSLayoutConstraint constraintWithItem:purpleBoxView
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.framingView
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0
                                  constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.framingView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:-20].active = YES ;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:(305.0/500.0)
                                  constant:1].active = YES;
    
    [NSLayoutConstraint constraintWithItem:firstBlueBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:firstBlueBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:framingView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:firstBlueBoxView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:firstBlueBoxView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:0.5 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:secondBlueBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:secondBlueBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:secondBlueBoxView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.f constant:0.f].active = YES;

    [NSLayoutConstraint constraintWithItem:secondBlueBoxView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.f constant:0.f].active = YES;
    
    [NSLayoutConstraint constraintWithItem:thirdBlueBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:thirdBlueBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:framingView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:thirdBlueBoxView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:thirdBlueBoxView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.5 constant:0.0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.framingView
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0
                                  constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.framingView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:20].active = YES ;
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:144].active = YES;
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:leftOrangeBoxView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:-8].active = YES;
    
    [NSLayoutConstraint constraintWithItem:leftOrangeBoxView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:redBoxView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:10].active = YES ;
    
    [NSLayoutConstraint constraintWithItem:leftOrangeBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:30].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:leftOrangeBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:70].active = YES;
    
    [NSLayoutConstraint constraintWithItem:redBoxView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:rightOrangeBoxView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:8].active = YES;
    
    [NSLayoutConstraint constraintWithItem:rightOrangeBoxView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:redBoxView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:10].active = YES ;
    
    [NSLayoutConstraint constraintWithItem:rightOrangeBoxView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:30].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:rightOrangeBoxView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:50].active = YES;
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
