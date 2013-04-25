//
//  TicketWriterViewController.h
//  TicketWriter
//
//  Created by Kurt Lange2 on 4/24/13.
//  Copyright (c) 2013 Kurt Lange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface TicketWriterViewController : UIViewController <UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)evidencePhotoButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)useCamera:(id)sender;

@end

NSArray * violations;
