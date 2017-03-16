//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by alan_hamlett on 3/15/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadSettings];
}

- (IBAction)onDefaultTipChange:(UISegmentedControl *)sender {
  [self saveSettings];
}

- (void)loadSettings {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSDictionary *tipValues = @{ @0.15: @0, @0.2: @1, @0.25: @2 };
  NSNumber *defaultTip = [defaults objectForKey:@"tipcalculator.settings.default_tip"];
  if ([tipValues objectForKey:defaultTip] == nil)
    defaultTip = @0.2;
  int tipIndex = [tipValues[defaultTip] intValue];
  [self.defaultTipControl setSelectedSegmentIndex:tipIndex];
}

- (void)saveSettings {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSArray *tipValues = @[@0.15, @0.20, @0.25];
  NSNumber *defaultTip = tipValues[self.defaultTipControl.selectedSegmentIndex];
  [defaults setObject:defaultTip forKey:@"tipcalculator.settings.default_tip"];
  [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
