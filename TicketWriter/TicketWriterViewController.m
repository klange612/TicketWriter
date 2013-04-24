//
//  TicketWriterViewController.m
//  TicketWriter
//
//  Created by Kurt Lange2 on 4/24/13.
//  Copyright (c) 2013 Kurt Lange. All rights reserved.
//

#import "TicketWriterViewController.h"

@interface TicketWriterViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;

@property (weak, nonatomic) IBOutlet UIButton *evidencePhotoButton;


@property (weak, nonatomic) IBOutlet UIButton *submitViolationButton;

@end

@implementation TicketWriterViewController

@synthesize PickerView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	violations = [[NSArray alloc] initWithObjects:@"Double Parked", @"Fire Hydrant", @"Other", nil];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [violations objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Picker Selected: %@, row: %i", [violations objectAtIndex:row], row);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [violations count];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
