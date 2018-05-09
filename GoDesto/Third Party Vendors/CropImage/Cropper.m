//
//  Cropper.m
//  Crop
//
//  Created by Franco Santa Cruz on 2/6/15.
//  Copyright (c) 2015 BirdMaker. All rights reserved.
//

#import "Cropper.h"

typedef enum : NSUInteger {
    PanStateNone,
    PanStateMoving,
    PanStateChangingSize,
} PanState;

typedef enum : NSUInteger {
    None,
    Left = 1 << 0,
    Top = 1 << 1,
    Right = 1 << 2,
    Bottom = 1 << 3,
} ResizingState;


@interface Cropper ()
{
    UIView *viewCrop;
    BOOL isRectDraw;
}

//@property (assign, nonatomic) CGRect croppingRect;
@property (strong, nonatomic) UIView *croppingView;

@property (assign, nonatomic) CGPoint lastDistance;
@property (assign, nonatomic) CGPoint lastDistancePan;
@property (strong, nonatomic) UIView *bar;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic, assign) PanState panState;
@property (nonatomic, assign) ResizingState resizingState;



@end

@implementation UIImageView (util)

-(CGRect)cropRectForFrame:(CGRect)frame
{
    NSAssert(self.contentMode == UIViewContentModeScaleAspectFit, @"content mode must be aspect fit");
    
    CGFloat widthScale = self.bounds.size.width / self.image.size.width;
    CGFloat heightScale = self.bounds.size.height / self.image.size.height;
    
    float x, y, w, h, offset;
    if (widthScale<heightScale) {
        offset = (self.bounds.size.height - (self.image.size.height*widthScale))/2;
        x = frame.origin.x / widthScale;
        y = (frame.origin.y-offset) / widthScale;
        w = frame.size.width / widthScale;
        h = frame.size.height / widthScale;
    } else {
        offset = (self.bounds.size.width - (self.image.size.width*heightScale))/2;
        x = (frame.origin.x-offset) / heightScale;
        y = frame.origin.y / heightScale;
        w = frame.size.width / heightScale;
        h = frame.size.height / heightScale;
    }
    return CGRectMake(x, y, w, h);
}

@end

@implementation UIScrollView (util)

-(CGRect)cropRectForFrame:(CGRect)frame
{
    //NSAssert(self.contentMode == UIViewContentModeScaleAspectFit, @"content mode must be aspect fit");
    
    CGFloat widthScale = self.bounds.size.width / self.frame.size.width;
    CGFloat heightScale = self.bounds.size.height / self.frame.size.height;
    
    float x, y, w, h, offset;
    if (widthScale<heightScale) {
        offset = (self.bounds.size.height - (self.frame.size.height*widthScale))/2;
        x = frame.origin.x / widthScale;
        y = (frame.origin.y-offset) / widthScale;
        w = frame.size.width / widthScale;
        h = frame.size.height / widthScale;
    } else {
        offset = (self.bounds.size.width - (self.frame.size.width*heightScale))/2;
        x = (frame.origin.x-offset) / heightScale;
        y = frame.origin.y / heightScale;
        w = frame.size.width / heightScale;
        h = frame.size.height / heightScale;
    }
    return CGRectMake(x, y, w, h);
}


@end

@implementation Cropper

- (instancetype)initWithImageView:(UIImageView*)imageView
{
    [imageView setNeedsLayout];
    [imageView layoutIfNeeded];
    self = [super initWithFrame:imageView.frame];
    if (self) {
        [self removeFromSuperview];
        [viewCrop removeFromSuperview];
        //self.imageView = imageView;
        [self setupInitialCroppingRect];
        [self setBackgroundColor:[UIColor clearColor]];
       // self.userInteractionEnabled = YES;
       // self.multipleTouchEnabled = YES;
        //[self addGestures];
        [self addButtonsBar];
        
        UIView *sup = [[imageView superview] superview];
        [self addViewToHierarchy:imageView parent:sup];
        
    }
    return self;
}

- (instancetype)initWithScrollView:(UIScrollView*)scrollView{
    [scrollView setNeedsLayout];
    [scrollView layoutIfNeeded];
    
    self = [super initWithFrame:scrollView.frame];
    if (self) {
        [self removeFromSuperview];
        [viewCrop removeFromSuperview];
        self.scrollView = scrollView;
        [self setupInitialCroppingRect];
        [self setBackgroundColor:[UIColor clearColor]];
         self.userInteractionEnabled = NO;
         self.multipleTouchEnabled = NO;
        //[self addGestures];
        [self addButtonsBar];
        
        UIView *sup = [scrollView superview];
        [self addScrollViewToHierarchy:scrollView parent:sup];
        
    }
    return self;
}

- (instancetype)initWithScrollView:(UIScrollView*)scrollView andFrame:(CGRect)frame{
    [scrollView setNeedsLayout];
    [scrollView layoutIfNeeded];
    
    self = [super initWithFrame:frame];
    if (self) {
        [self removeFromSuperview];
        [viewCrop removeFromSuperview];
        self.scrollView = scrollView;
        [self setupInitialCroppingRect];
        [self setBackgroundColor:[UIColor clearColor]];
        self.userInteractionEnabled = NO;
        self.multipleTouchEnabled = NO;
        //[self addGestures];
        [self addButtonsBar];
        
        UIView *sup = [scrollView superview];
        [self addScrollViewToHierarchy:scrollView parent:sup];
        
    }
    return self;
}

- (UIImage*)image
{
    return self.imageView.image;
}

// add contraints so the view is always align with imageview
- (void)addViewToHierarchy:(UIImageView*)imageView parent:(UIView*)sup
{
    //add
    [sup addSubview:self];
    
    // add contraints so the view is always align with imageview
    //
    // left
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    // right
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // top
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    // bottom
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

- (void)addScrollViewToHierarchy:(UIScrollView*)imageView parent:(UIView*)sup
{
    //add
    [sup addSubview:self];
    
    // add contraints so the view is always align with imageview
    //
    // left
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    // right
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // top
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    // bottom
    [sup addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}


- (void)cancel:(id)sender
{
    if( self.cropAction )
    {
        self.cropAction(CropperActionCancel, nil);
        [self finishCropper];
    }
}

- (IBAction)crop:(id)sender
{
    if( self.cropAction )
    {
        UIImage *image = [self generateCroppedImage];
        self.cropAction(CropperActionDidCrop, image);
        [self finishCropper];
    }
}
- (void)cropImage:(UIImage *)scrollimage{
    if( self.cropAction )
    {
        UIImage *image = [self generateCroppedImage:scrollimage];
        self.cropAction(CropperActionDidCrop, image);
        [self finishCropper];
    }
}

- (void)finishCropper
{
    [self removeFromSuperview];
}

- (void)addButtonsBar
{
//    UIView *bar = [[UIView alloc] initWithFrame:CGRectZero];
//    // set instance
//    self.bar = bar;
//    // set to manage via autolayout
//    [bar setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
//    [bar setBackgroundColor:[UIColor blackColor]];
//    [self addSubview:bar];
//    id views = @{@"bar":bar};
//    id metrics = @{@"buttonHeight":@40};
//    // add constraints
//    //
//    // Vertical
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[bar(buttonHeight)]"
//                                                                 options:0
//                                                                 metrics:metrics
//                                                                   views:views]];
//    // Horizontal
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bar]|"
//                                                                 options:0
//                                                                 metrics:metrics
//                                                                   views:views]];
    
//    // create crop & cancel buttons
//    UIButton *crop = [UIButton buttonWithType:UIButtonTypeSystem];
//    [crop addTarget:self action:@selector(crop:) forControlEvents:UIControlEventTouchUpInside];
//    [crop setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [crop setTitle:@"Crop" forState:UIControlStateNormal];
//    // add
//    [bar addSubview:crop];
//    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeSystem];
//    [cancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
//    [cancel setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
//    // add
//    [bar addSubview:cancel];
//    // set constraints
//    
//    id array = @[ crop, cancel, bar ];
//    // force buttons calculate their width & height
//    [array makeObjectsPerformSelector:@selector(setNeedsLayout)];
//    [array makeObjectsPerformSelector:@selector(layoutIfNeeded)];
//    
//    
//    CGFloat separationBetweenButtons = 9;
//    // center constant
//    CGFloat firstButtonCenterXConstant = cancel.frame.size.width/2 + separationBetweenButtons/2;
//    
//    // add bar & buttons constraints
//    [bar addConstraint:[NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:crop attribute:NSLayoutAttributeCenterX multiplier:1 constant:firstButtonCenterXConstant]];
//    // bar & crop center y
//    [bar addConstraint:[NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:crop attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
//    // bar & cancel center y
//    [bar addConstraint:[NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cancel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
//    // separation cancel & crop
//    [bar addConstraint:[NSLayoutConstraint constraintWithItem:crop attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cancel attribute:NSLayoutAttributeLeft multiplier:1 constant:-1*separationBetweenButtons]];
    
}

- (void)setupInitialCroppingRect
{
    // create initial cropping rect
//    CGFloat w = self.frame.size.width / 4 * 3;
//    CGFloat h = self.frame.size.height / 4 * 3;
//    CGFloat x = (self.frame.size.width - w) / 2;
//    CGFloat y = (self.frame.size.height - h) / 2;
    
//    if(self.isCirculCroppingEnabeled)
//    {
//        viewCrop = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 320, 320)];
//        viewCrop.backgroundColor = [UIColor blackColor];
//        viewCrop.layer.cornerRadius = 160;
//        viewCrop.layer.masksToBounds = YES;
//        [self addSubview:viewCrop];
//
//    }
//    else
//    {
//        viewCrop = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 320, 320)];
//        viewCrop.backgroundColor = [UIColor yellowColor];
//        [self addSubview:viewCrop];
//
//    }
//   
   
    //viewCrop.frame = CGRectMake(x, y, w, h);
    // invalidate view so initial rect gets drawn
    [self setNeedsDisplay];
}

- (UIImage*)generateCroppedImage:(UIImage *)image
{
    //CGRect rect = [self.imageView cropRectForFrame:viewCrop.frame];
    CGRect rect = [self.scrollView cropRectForFrame:viewCrop.frame];
    // begin
    UIGraphicsBeginImageContext(rect.size);
    // translated rectangle for drawing sub image
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, self.image.size.width, self.image.size.height);
    // draw image
   // UIImage *scrollImage = [self snapShotScrollView:self.scrollView];
    //[self.image drawInRect:drawRect];
   // UIImageWriteToSavedPhotosAlbum(scrollImage, self, nil, nil);
    [image drawInRect:drawRect];
    // grab image
    UIImage* croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    // end
    UIGraphicsEndImageContext();
    
    return croppedImage;
}

-(CGRect)getRectForCropping{
 
    CGRect rect;
    if(self.isSquareCroppingEnabeled){
        CGFloat w = self.frame.size.width - 355;
        CGFloat h = self.frame.size.height - 220;
        CGFloat x = w / 2;
        CGFloat y = h / 2;
        rect = CGRectMake(x, y, viewCrop.frame.size.width, viewCrop.frame.size.height);
    }else{
        CGFloat w = self.frame.size.width - viewCrop.frame.size.width;
        CGFloat h = self.frame.size.height - viewCrop.frame.size.height;
        CGFloat x = w / 2;
        CGFloat y = h / 2;
        rect = CGRectMake(x, y, viewCrop.frame.size.width, viewCrop.frame.size.height);
//        CGFloat w = self.frame.size.width / 4 * 3;
//        CGFloat h = self.frame.size.height / 4 * 3;
//        CGFloat x = (self.frame.size.width - w) / 2;
//        CGFloat y = (self.frame.size.height - h) / 2;
//        rect = CGRectMake(x, y, viewCrop.frame.size.width, viewCrop.frame.size.height);
    }
    if( self.cropAction )
    {
        self.cropAction(CropperActionCancel, nil);
        [self finishCropper];
    }
    return rect;
}

- (void)addGestures
{
    // create pinch
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    // add
    [self addGestureRecognizer:
        pinch
     ];
    
    // create & configure pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.maximumNumberOfTouches = 1;
    pan.minimumNumberOfTouches = 1;
    // add pan
    [self addGestureRecognizer:pan];
    
    [pinch addTarget:self action:@selector(genericGesture:)];
    [pan addTarget:self action:@selector(genericGesture:)];
}

#pragma mark - Gestures

- (void)genericGesture:(UIGestureRecognizer*)gesture
{
    CGFloat duration = 0.1;
    if( gesture.state == UIGestureRecognizerStateBegan )
    {
        [UIView animateWithDuration:duration animations:^{
            [self.bar setAlpha:0];
        }];
    }
    else if( gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled )
    {
        [UIView animateWithDuration:duration animations:^{
            [self.bar setAlpha:1];
        }];
    }
}

- (void)printState:(UIGestureRecognizer*)g
{
    id array = @{
                 
                 @(UIGestureRecognizerStatePossible):@"Possible",
                 
                 @(UIGestureRecognizerStateBegan):@"Began",
                 @(UIGestureRecognizerStateChanged):@"Changed",
                 @(UIGestureRecognizerStateEnded):@"Ended",
                 @(UIGestureRecognizerStateCancelled):@"Cancelled",
                 @(UIGestureRecognizerStateFailed):@"Failed",
                 @(UIGestureRecognizerStateRecognized):@"Recognized",
                 };
    NSLog(@"g = %@, state = %@",[g class], array[@(g.state)]);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
//    [touches arra]
    if( touches.count != 1 ){
        return;
    }

    CGFloat padding2 = 10;
    UITouch *touch = [touches.objectEnumerator nextObject];
    CGPoint point = [touch locationInView:self];
//    CGRect left = CGRectMake(_croppingRect.origin.x-padding2,
//                             _croppingRect.origin.y+cornerPadding,
//                             padding2*2,
//                             _croppingRect.size.height-(cornerPadding*2));
//    CGRect top = CGRectMake(_croppingRect.origin.x + cornerPadding,
//                            _croppingRect.origin.y - padding2,
//                            _croppingRect.size.width - (cornerPadding*2),
//                            padding2*2);
//    CGRect right = CGRectMake(_croppingRect.origin.x + _croppingRect.size.width - padding2,
//                              _croppingRect.origin.y - cornerPadding,
//                              padding2*2,
//                              _croppingRect.size.height - (cornerPadding*2));
//    CGRect bottom = CGRectMake(_croppingRect.origin.x + cornerPadding,
//                               _croppingRect.origin.y + _croppingRect.size.height - padding2,
//                               _croppingRect.size.width - (cornerPadding*2),
//                               padding2*2);
//    CGRect left = CGRectMake(0,
//                             0,
//                             viewCrop.frame.origin.x + padding2,
//                             self.frame.size.height);
//    CGRect top = CGRectMake(0,
//                            0,
//                            self.frame.size.width,
//                            viewCrop.frame.origin.y + padding2);
//    CGRect right = CGRectMake(viewCrop.frame.origin.x + viewCrop.frame.size.width - padding2,
//                              0,
//                              self.frame.size.width,
//                              self.frame.size.height);
//    CGRect bottom = CGRectMake(0,
//                               viewCrop.frame.origin.y + viewCrop.frame.size.height - padding2,
//                               self.frame.size.width,
//                               self.frame.size.height);
//
//    
//    if( CGRectContainsPoint(left, point) )
//    {
//        _resizingState |= Left;
//    }
//    if( CGRectContainsPoint(top, point) )
//    {
//        _resizingState |= Top;
//    }
//    if( CGRectContainsPoint(right, point) )
//    {
//        _resizingState |= Right;
//    }
//    if( CGRectContainsPoint(bottom, point) )
//    {
//        _resizingState |= Bottom;
//    }
//    else
//    {
//        CGRect leftCorner = CGRectMake(_croppingRect.origin.x - cornerPadding, _croppingRect.origin.y - cornerPadding, cornerPadding, cornerPadding);
//        
//    }

}

- (void)pan:(UIPanGestureRecognizer*)pan
{
//    [self printState:pan];
    if( pan.state == UIGestureRecognizerStateEnded || !pan.numberOfTouches )
    {
        _panState = PanStateNone;
        _resizingState = None;
        return;
    }
    CGFloat padding = 5;
//    CGFloat padding2 = 5;
    CGPoint point = [pan locationOfTouch:0 inView:self];
    if( pan.state == UIGestureRecognizerStateBegan ){
        if( _resizingState != None ){
            NSLog(@"PanStateChangingSize");
            _panState = PanStateChangingSize;
            // resizing, no op
        } else if( CGRectContainsPoint(CGRectMake(viewCrop.frame.origin.x+padding, viewCrop.frame.origin.y+padding, viewCrop.frame.size.width-(padding*2), viewCrop.frame.size.height-(padding*2)), point) ){
            // moving
            NSLog(@"PanStateMoving");
            _panState = PanStateMoving;
        } else {
            NSLog(@"PanStateNone");
            _panState = PanStateNone;
            _resizingState = None;
            // cancel
            [pan setEnabled:NO];
            [pan setEnabled:YES];
            return;
        }
    }

    if( pan.state == UIGestureRecognizerStateChanged )
    {
         CGRect cropFrame = viewCrop.frame;
       
        if( _panState == PanStateMoving ){
       
           
            // x
            cropFrame.origin.x += (point.x-_lastDistancePan.x);
            // x checks
            cropFrame.origin.x = cropFrame.origin.x < 0 ? 0 : cropFrame.origin.x;
            cropFrame.origin.x = CGRectGetMaxX(cropFrame) > self.bounds.size.width ? self.bounds.size.width - cropFrame.size.width : cropFrame.origin.x;
            
            // y
            cropFrame.origin.y += (point.y-_lastDistancePan.y);
            // y checks
            cropFrame.origin.y = cropFrame.origin.y < 0 ? 0 : cropFrame.origin.y;
            cropFrame.origin.y = CGRectGetMaxY(cropFrame) > self.bounds.size.height ? self.bounds.size.height - cropFrame.size.height : cropFrame.origin.y;
            viewCrop.frame = cropFrame;
        } else if( _panState == PanStateChangingSize ){
            CGFloat distance;
            if( (_resizingState&Left) ){
                distance = _lastDistancePan.x - point.x;
                cropFrame.origin.x -= distance;
                cropFrame.size.width += distance;
                viewCrop.frame = cropFrame;
            }
            if( (_resizingState&Top) ){
                distance = _lastDistancePan.y - point.y;
                cropFrame.origin.y -= distance;
                cropFrame.size.height += distance;
                viewCrop.frame = cropFrame;

            }
            if( (_resizingState&Right) ){
                distance = _lastDistancePan.x - point.x;
                cropFrame.size.width -= distance;
                viewCrop.frame = cropFrame;

            }
            if( (_resizingState&Bottom) ){
                distance = _lastDistancePan.y - point.y;
                cropFrame.size.height -= distance;
                viewCrop.frame = cropFrame;

   
            }
            
        }
        // make redraw happen
        [self setNeedsDisplay];

    }
   //  advance last distance
    _lastDistancePan = point;

    
 
}

- (void)pinch:(UIPinchGestureRecognizer*)pinch
{
    if( pinch.state == UIGestureRecognizerStateEnded || [pinch numberOfTouches] != 2 )
    {
        return;
    }
    
    // get points
    CGPoint point1 = [pinch locationOfTouch:0 inView:self];
    CGPoint point2 = [pinch locationOfTouch:1 inView:self];
    // calc diff
    int xDiff = abs(point1.x-point2.x);
    int yDiff = abs(point1.y-point2.y);
    
    if( pinch.state == UIGestureRecognizerStateChanged )
    {
        [self growWidth:(xDiff-_lastDistance.x)];
        [self growHeight:(yDiff-_lastDistance.y)];
        [self setNeedsDisplay];
    }
    
    _lastDistance.x = xDiff;
    _lastDistance.y = yDiff;
    
}

#pragma mark - Helper



- (void)growWidth:(int)distance
{
//    _croppingRect.origin.x -= (distance/3.0);
//    _croppingRect.size.width += (distance*2.0/3.0);
//    // checks    
//    _croppingRect.origin.x = _croppingRect.origin.x < 0 ? 0 : _croppingRect.origin.x;
//    _croppingRect.size.width = _croppingRect.size.width < 20 ? 20 : _croppingRect.size.width;
//    _croppingRect.size.width = _croppingRect.size.width > self.bounds.size.width ? self.bounds.size.width : _croppingRect.size.width;
}

- (void)growHeight:(int)distance
{
//    _croppingRect.origin.y -= (distance/3.0);
//    _croppingRect.size.height += (distance*2.0/3.0);
//    // checks
//    _croppingRect.origin.y = _croppingRect.origin.y < 0 ? 0 : _croppingRect.origin.y;
//    _croppingRect.size.height = _croppingRect.size.height < 20 ? 20 : _croppingRect.size.height;
//    _croppingRect.size.height = _croppingRect.size.height > self.bounds.size.height ? self.bounds.size.height : _croppingRect.size.height;
}

#pragma mark - Draw

- (void)drawRect:(CGRect)rect
{
    
        if(isRectDraw == false)
    {
        isRectDraw = true;
        
        if(self.isProfilePictureCroppingEnabeled){
            CGFloat x = (self.frame.size.width - 300) / 2;
            CGFloat y = (self.frame.size.height - 300) / 2;
            viewCrop = [[UIView alloc]initWithFrame:CGRectMake(x, y, 300, 300)];
            viewCrop.backgroundColor = [UIColor clearColor];
            [self addSubview:viewCrop];

        }
        else
        {
            CGFloat x = (self.frame.size.width - 312) / 2;
            CGFloat y = (self.frame.size.height - 390) / 2;
            viewCrop = [[UIView alloc]initWithFrame:CGRectMake(x, y, 312, 390)];
            viewCrop.backgroundColor = [UIColor clearColor];
            [self addSubview:viewCrop];
            
        }

        
//        if(self.isSquareCroppingEnabeled){
//            CGFloat x = (self.frame.size.width - 355) / 2;
//            CGFloat y = (self.frame.size.height - 220) / 2;
//            viewCrop = [[UIView alloc]initWithFrame:CGRectMake(x, y, 355, 220)];
//            viewCrop.backgroundColor = [UIColor clearColor];
//            [self addSubview:viewCrop];
//        }
//        else if(self.isCirculCroppingEnabeled)
//        {
//            CGFloat x = (self.frame.size.width - 300) / 2;
//            CGFloat y = (self.frame.size.height - 300) / 2;
//
//            viewCrop = [[UIView alloc]initWithFrame:CGRectMake(x, y, 300, 300)];
//            viewCrop.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CircularFrame"]];
//           
//            [self addSubview:viewCrop];
//            
//        }
//        else
//        {
//            CGFloat x = (self.frame.size.width - 312) / 2;
//            CGFloat y = (self.frame.size.height - 390) / 2;
//            viewCrop = [[UIView alloc]initWithFrame:CGRectMake(x, y, 312, 390)];
//            viewCrop.backgroundColor = [UIColor clearColor];
//            [self addSubview:viewCrop];
//            
//        }
    }

    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(c, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor);
    // fill bkg with black transparent
    CGContextFillRect(c, self.bounds);
    
    // set clear the cropping rect
    CGContextClearRect(c, viewCrop.frame);

    // set cropping rect border
    CGContextSetStrokeColorWithColor(c, [UIColor clearColor].CGColor);//colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor);
    CGContextStrokeRect(c, viewCrop.frame);
    
    CGFloat minHeightToShow = 100;
    UIColor *horizColor = [UIColor colorWithWhite:1 alpha:(viewCrop.frame.size.height/minHeightToShow)-0.5];
    // draw lines
    // horizontal
//    CGFloat yPart = viewCrop.frame.size.height/3;
//    CGFloat yLine;
//    yLine = viewCrop.frame.origin.y + yPart;
//
//    CGContextBeginPath(c);
//    CGContextMoveToPoint(c, viewCrop.frame.origin.x,  yLine);
//    CGContextAddLineToPoint(c, viewCrop.frame.origin.x + viewCrop.frame.size.width, yLine);
//    CGContextSetStrokeColorWithColor(c, horizColor.CGColor);
//    CGContextStrokePath(c);
//    
//    yLine = self.croppingRect.origin.y + (yPart * 2);
//    
//    CGContextBeginPath(c);
//    CGContextMoveToPoint(c, self.croppingRect.origin.x, yLine);
//    CGContextAddLineToPoint(c, self.croppingRect.origin.x + self.croppingRect.size.width, yLine);
//    CGContextSetStrokeColorWithColor(c, horizColor.CGColor);
//    CGContextStrokePath(c);
//
//    CGFloat minWidthToShow = 100;
//    UIColor *vertColor = [UIColor colorWithWhite:1 alpha:(self.croppingRect.size.width/minWidthToShow)-0.5];
//
//    // vertical
//    CGFloat xPart = self.croppingRect.size.width/3;
//    CGFloat xLine;
//    xLine = self.croppingRect.origin.x + xPart;
//    
//    CGContextBeginPath(c);
//    CGContextMoveToPoint(c, xLine,  self.croppingRect.origin.y);
//    CGContextAddLineToPoint(c, xLine, self.croppingRect.origin.y + self.croppingRect.size.height);
//    CGContextSetStrokeColorWithColor(c, vertColor.CGColor);
//    CGContextStrokePath(c);
//
//    xLine = self.croppingRect.origin.x + (xPart * 2);
//    
//    CGContextBeginPath(c);
//    CGContextMoveToPoint(c, xLine,  self.croppingRect.origin.y);
//    CGContextAddLineToPoint(c, xLine, self.croppingRect.origin.y + self.croppingRect.size.height);
//    CGContextSetStrokeColorWithColor(c, vertColor.CGColor);
//    CGContextStrokePath(c);

    // vamos rafa
    CGContextBeginPath(c);
   // CGContextMoveToPoint(c, xLine,  viewCrop.frame.origin.y);

    
    
}
- (UIImage*)snapShot:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*)snapShotScrollView:(UIScrollView *)scrView
{
    CGRect rect = scrView.bounds;
    //scrView.bounds.size = scrView.contentSize;
    UIImage *image = [self snapShot:scrView];
    return image;
}


//func snapShot(view:UIView) -> UIImage
//{
//    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
//    view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    
//    return image
//}
//
//func snapShotScrollView(scrollView:UIScrollView) -> UIImage
//{
//    let bounds = scrollView.bounds
//    scrollView.bounds.size = scrollView.contentSize
//    let image = snapShot(scrollView)
//    scrollView.bounds = bounds
//    return image
//}


@end
