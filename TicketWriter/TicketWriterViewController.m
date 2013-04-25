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

@property (weak, nonatomic) IBOutlet UIButton *submitViolationButton;

@end

@implementation TicketWriterViewController
@synthesize PickerView;
@synthesize imageView;

/*
-(IBAction)useCamera:(id)sender
{
    [self startCameraControllerFromViewController:self usingDelegate:self];
    
}


- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller

                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   
                                                   UINavigationControllerDelegate>) delegate {
    
    
    
    if (([UIImagePickerController isSourceTypeAvailable:
          
          UIImagePickerControllerSourceTypeCamera] == NO)
        
        || (delegate == nil)
        
        || (controller == nil))
        
        return NO;
    
    
    
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    
    // Displays a control that allows the user to choose picture or
    
    // movie capture, if both are available:
    
    cameraUI.mediaTypes =
    
    [UIImagePickerController availableMediaTypesForSourceType:
     
     UIImagePickerControllerSourceTypeCamera];
    
    
    
    // Hides the controls for moving & scaling pictures, or for
    
    // trimming movies. To instead show the controls, use YES.
    
    cameraUI.allowsEditing = NO;
    
    
    
    cameraUI.delegate = delegate;
    
    
    
    [controller presentModalViewController: cameraUI animated: YES];
    
    return YES;
    
}

// For responding to the user tapping Cancel.

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    
}



// For responding to the user accepting a newly-captured picture or movie

- (void) imagePickerController: (UIImagePickerController *) picker

 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    UIImage *originalImage, *editedImage, *imageToSave;
    
    
    
    // Handle a still image capture
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        
        == kCFCompareEqualTo) {
        
        
        
        editedImage = (UIImage *) [info objectForKey:
                                   
                                   UIImagePickerControllerEditedImage];
        
        originalImage = (UIImage *) [info objectForKey:
                                     
                                     UIImagePickerControllerOriginalImage];
        
        
        
        if (editedImage) {
            
            imageToSave = editedImage;
            
        } else {
            
            imageToSave = originalImage;
            
        }
        
        
        
        // Save the new image (original or edited) to the Camera Roll
        
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        
    }
    
    
    
    // Handle a movie capture
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        
        == kCFCompareEqualTo) {
        
        
        
        NSString *moviePath = [[info objectForKey:
                                
                                UIImagePickerControllerMediaURL] path];
        
        
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
            
            UISaveVideoAtPathToSavedPhotosAlbum (
                                                 
                                                 moviePath, nil, nil, nil);
            
        }
        
    }
    
    
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    
    
}

/*

-(BOOL)launchCameraControllerFromViewController: (UIViewController *)controller usingDelegate:(id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>)delegate {
    BOOL cameraAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (!cameraAvailable || (delegate = nil) || (controller = nil)) {
        NSLog(@"missing either camera, delegate or controller");
        return NO;
    }
    UIImagePickerController *cameraController = [[UIImagePickerController alloc]init];
    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    cameraController.allowsEditing = NO;
    cameraController.delegate = delegate;
    
    [controller presentViewController:cameraController animated:YES completion:nil];
     
    return 0;
}

 
 -(IBAction)evidencePhotoButton
 {
 UIImagePickerController *photo = [[UIImagePickerController alloc] init];
 photo.delegate = self;
 photo.sourceType = UIImagePickerControllerSourceTypeCamera;
 //    photo.mediaTypes = @[(NSString *) kUTTypeImage];
 [self presentViewController:photo animated:YES completion:nil];
 }

 - (void) useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
//        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
//        _newMedia = YES;
    }
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    if (CFStringCompare((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil);
    }
    if (CFStringCompare((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
        UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
    }
    }
[picker dismissViewControllerAnimated:YES completion:nil];
//[picker dismissModalViewControllerAnimated: YES];
[self.imageView setImage:imageToSave];

}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

*/

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
