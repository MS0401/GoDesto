//
//  Cropper.h
//  Crop
//
//  Created by Franco Santa Cruz on 2/6/15.
//  Copyright (c) 2015 BirdMaker. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    CropperActionDidCrop = 1,
    CropperActionCancel
    
}CropperAction;


@interface Cropper : UIView

@property (copy, nonatomic) void (^cropAction)(CropperAction action, UIImage *image);
@property (nonatomic, assign) BOOL isCirculCroppingEnabeled;
@property (nonatomic, assign) BOOL isSquareCroppingEnabeled;
@property (nonatomic, assign) BOOL isProfilePictureCroppingEnabeled;

- (instancetype)initWithImageView:(UIImageView*)imageView;
- (instancetype)initWithScrollView:(UIScrollView*)scrollView;
- (instancetype)initWithScrollView:(UIScrollView*)scrollView andFrame:(CGRect)frame;
- (UIImage*)generateCroppedImage;


- (IBAction)crop:(id)sender:(UIImage *)image;
- (void)cropImage:(UIImage *)image;
-(CGRect)getRectForCropping;
- (void)finishCropper;
@end
