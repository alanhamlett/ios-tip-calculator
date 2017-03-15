//
//  ViewController.m
//  TipCalculator
//
//  Created by alan_hamlett on 3/13/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *lowTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *mediumTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation TipViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Tip Calculator";
  [self updateValues];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
  [self.view endEditing:true];
  [self updateValues];
}

- (IBAction)onBillChanged:(UITextField *)sender {
  [self updateValues];
}

- (IBAction)onTipSelected:(UISegmentedControl *)sender {
  [self.view endEditing:true];
  [self updateValues];
}

- (void)updateValues {

  // get bill amount
  float billAmount = self.billTextField.text.floatValue;

  // compute tip & total
  NSArray *tipValues = @[@0.15, @0.20, @0.25];
  float tipPercent = [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
  float tipAmount = tipPercent * billAmount;
  float totalAmount = billAmount + tipAmount;

  // update UI
  self.lowTipLabel.text = [NSString stringWithFormat:@"($%0.2f)", [tipValues[0] floatValue] * billAmount];
  self.mediumTipLabel.text = [NSString stringWithFormat:@"($%0.2f)", [tipValues[1] floatValue] * billAmount];
  self.highTipLabel.text = [NSString stringWithFormat:@"($%0.2f)", [tipValues[2] floatValue] * billAmount];
  self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}


@end
