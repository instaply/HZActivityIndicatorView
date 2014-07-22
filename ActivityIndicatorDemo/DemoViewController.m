//
//  DemoViewController.m
//  ActivityIndicatorDemo
//
//  Created by Hezi Cohen on 10/7/11.
//  Copyright (c) 2011 Hezi Cohen. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
// Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
// 
// Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
// 
// Neither the name of the project's author nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "DemoViewController.h"

#import "HZActivityIndicatorView.h"

@interface DemoViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *stepsField;
@property (strong, nonatomic) IBOutlet UITextField *indicatorRadiusField;
@property (strong, nonatomic) IBOutlet UITextField *stepDurationField;
@property (strong, nonatomic) IBOutlet UITextField *finSizeWidthField;
@property (strong, nonatomic) IBOutlet UITextField *finSizeHeightField;
@property (strong, nonatomic) IBOutlet UISwitch *topLeftField;
@property (strong, nonatomic) IBOutlet HZActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UISwitch *topRightField;
@property (strong, nonatomic) IBOutlet UISwitch *bottomLeftField;
@property (strong, nonatomic) IBOutlet UISwitch *bottomRightField;
@property (strong, nonatomic) IBOutlet UITextField *cornerRadiiWidthField;
@property (strong, nonatomic) IBOutlet UITextField *cornerRadiiHeightField;
- (IBAction)valueChanged:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *sizeField;
- (IBAction)generateButtonTapped:(id)sender;
@end

@implementation DemoViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator.color = [UIColor whiteColor];
    self.activityIndicator.backgroundColor = [UIColor blackColor];
    [self.activityIndicator setHidesWhenStopped:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.stepsField.text = [NSString stringWithFormat:@"%d", self.activityIndicator.steps];
    self.indicatorRadiusField.text = [NSString stringWithFormat:@"%d", self.activityIndicator.indicatorRadius];
    self.stepDurationField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.stepDuration];
    self.finSizeWidthField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.finSize.width];
    self.finSizeHeightField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.finSize.height];
    self.topLeftField.on = self.activityIndicator.roundedCoreners & UIRectCornerTopLeft;
    self.topRightField.on = self.activityIndicator.roundedCoreners & UIRectCornerTopRight;
    self.bottomLeftField.on = self.activityIndicator.roundedCoreners & UIRectCornerBottomLeft;
    self.bottomRightField.on = self.activityIndicator.roundedCoreners & UIRectCornerBottomRight;
    self.cornerRadiiWidthField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.cornerRadii.width];
    self.cornerRadiiHeightField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.cornerRadii.height];
    self.sizeField.text = [NSString stringWithFormat:@"%.1f", self.activityIndicator.frame.size.width];
    
    [self.activityIndicator startAnimating];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self updateActivityIndicator];
}

- (IBAction)valueChanged:(id)sender {
    [self updateActivityIndicator];
}

- (void)updateActivityIndicator {
    [self.activityIndicator stopAnimating];
    
    NSUInteger steps = [self.stepsField.text integerValue];
    self.activityIndicator.steps = steps;
    
    NSUInteger indicatorRadius = [self.indicatorRadiusField.text integerValue];
    self.activityIndicator.indicatorRadius = indicatorRadius;
    
    CGFloat stepDuration = [self.stepDurationField.text floatValue];
    self.activityIndicator.stepDuration = stepDuration;
    
    CGFloat finSizeWidth = [self.finSizeWidthField.text floatValue];
    CGFloat finSizeHeight = [self.finSizeHeightField.text floatValue];
    self.activityIndicator.finSize = CGSizeMake(finSizeWidth, finSizeHeight);
    
    UIRectCorner roundedCorners = 0;
    if(self.topLeftField.on) roundedCorners |= UIRectCornerTopLeft;
    if(self.topRightField.on) roundedCorners |= UIRectCornerTopRight;
    if(self.bottomLeftField.on) roundedCorners |= UIRectCornerBottomLeft;
    if(self.bottomRightField.on) roundedCorners |= UIRectCornerBottomRight;
    self.activityIndicator.roundedCoreners = roundedCorners;
    
    CGFloat cornerRadiiWidth = [self.cornerRadiiWidthField.text floatValue];
    CGFloat cornerRadiiHeight = [self.cornerRadiiHeightField.text floatValue];
    self.activityIndicator.cornerRadii = CGSizeMake(cornerRadiiWidth, cornerRadiiHeight);
    
    CGFloat size = [self.sizeField.text floatValue];
    self.activityIndicator.frame = CGRectMake(self.activityIndicator.frame.origin.x, self.activityIndicator.frame.origin.y, size, size);
    
    [self.activityIndicator startAnimating];
}
- (IBAction)generateButtonTapped:(id)sender {
    NSMutableString *code = [NSMutableString string];
    [code appendString:@"HZActivityIndicatorView *activityIndicator = [[HZActivityIndicatorView alloc] init];\n"];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.steps = %d;\n", [self.stepsField.text integerValue]]];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.indicatorRadius = %.1f;\n", [self.indicatorRadiusField.text floatValue]]];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.stepDuration = %.1f;\n", [self.indicatorRadiusField.text floatValue]]];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.finSize = CGSizeMake(%.1f, %.1f);\n", [self.finSizeWidthField.text floatValue], [self.finSizeHeightField.text floatValue]]];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.cornerRadii = CGSizeMake(%.1f, %.1f);\n", [self.cornerRadiiWidthField.text floatValue], [self.cornerRadiiHeightField.text floatValue]]];
    [code appendString:[NSString stringWithFormat:@"activityIndicator.frame = CGRectMake(activityIndicator.frame.origin.x, activityIndicator.frame.origin.y, %.1f, %.1f);\n", [self.sizeField.text floatValue], [self.sizeField.text floatValue]]];
    if(self.topLeftField.on && self.topRightField.on && self.bottomLeftField.on && self.bottomRightField.on){
        [code appendString:@"activityIndicator.roundedCoreners = UIRectCornerAllCorners;\n"];
    } else {
        [code appendString:@"UIRectCorner roundedCorners = 0;\n"];
        if(self.topLeftField.on) [code appendString:@"roundedCorners |= UIRectCornerTopLeft;\n"];
        if(self.topRightField.on) [code appendString:@"roundedCorners |= UIRectCornerTopRight;\n"];
        if(self.bottomLeftField.on) [code appendString:@"roundedCorners |= UIRectCornerBottomLeft;\n"];
        if(self.bottomRightField.on) [code appendString:@"roundedCorners |= UIRectCornerBottomRight;\n"];
        [code appendString:@"activityIndicator.roundedCoreners = roundedCorners;\n"];
    }
    
    NSLog(@"Code: \n%@", code);
}
@end
