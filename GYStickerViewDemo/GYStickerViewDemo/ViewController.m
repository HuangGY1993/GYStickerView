//
//  ViewController.m
//  GYStickerViewDemo
//
//  Created by zhangqi on 2017/3/22.
//  Copyright © 2017年 HuangGY. All rights reserved.
//

#import "ViewController.h"
#import "GYStickerView.h"

@interface ViewController ()

@property (nonatomic) GYStickerViewCtrlType ctrlType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ctrlType = GYStickerViewCtrlTypeGesture;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addStickerViewWithContentView:(UIView *)contentView {
    GYStickerView *stickerView = [[GYStickerView alloc] initWithContentView:contentView];
    stickerView.ctrlType = self.ctrlType;
    stickerView.scaleMode = GYStickerViewScaleModeBounds;
    stickerView.originalPoint = CGPointMake(-0.2, -0.2);
    [stickerView showCtrlPoint:YES];
    stickerView.scaleFit = YES;
    [stickerView setTransformCtrlImage:[UIImage imageNamed:@"image_btn_resize"]];
    [stickerView setResizeCtrlImage:[UIImage imageNamed:@"image_btn_resize"] rotateCtrlImage:[UIImage imageNamed:@"image_btn_rotate"]];
    [stickerView setRemoveCtrlImage:[UIImage imageNamed:@"image_btn_remove"]];
    [self.view addSubview:stickerView];
}

- (IBAction)addImageStickerView:(id)sender {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 250, 100, 100)];
    imageView.image = [UIImage imageNamed:@"testImage"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self addStickerViewWithContentView:imageView];
}

- (IBAction)addTextStickerView:(id)sender {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(150, 250, 100, 100)];
    textView.text = @"Hello,Genie!\nHello,Genie!!!";
    [self addStickerViewWithContentView:textView];
}

- (IBAction)selectCtrlType:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    switch (seg.selectedSegmentIndex) {
        case 0:
            self.ctrlType = GYStickerViewCtrlTypeGesture;
            break;

        case 1:
            self.ctrlType = GYStickerViewCtrlTypeOne;
            break;

        default:
            self.ctrlType = GYStickerViewCtrlTypeTwo;
            break;
    }

}

@end
