# GYStickerView
### iOS 一款可绕指定点旋转、缩放的多功能贴纸
#### 支持双指手势操作，单指移动控制图操作，满足你所有需求


#####先上效果图：

![image](https://github.com/HuangGY1993/GYStickerView/blob/master/GYStickerView.gif)


#####示例用法：

######CtrlTypeGesture:双指手势模式，支持等比缩放，绕中心旋转，可设置ScaleMode
示例代码：

        GYStickerView *stickerView = [[GYStickerView alloc] initWithContentView:yourCustomView];
        stickerView.ctrlType = GYStickerViewCtrlTypeGesture;
        stickerView.scaleMode = GYStickerViewScaleModeTransform;
        [self.view addSubview:stickerView];
效果：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/GYStickerView.gif)

        SpectrumView * spectrumView = [[SpectrumView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 100,180,200, 40.0)];
        spectrumView.text = [NSString stringWithFormat:@"%d",0];
        __weak SpectrumView * weakWaver = spectrumView;
        spectrumView.itemLevelCallback = ^() {

        [self.audioRecorder updateMeters];

        //取得第一个通道的音频，音频强度范围是-160到0
        float power = [self.audioRecorder averagePowerForChannel:0];
        weakWaver.level = power;

        };
        [self.view addSubview:spectrumView];


使用前请注意：

        SpectrumView.frame.size.width / SpectrumView.numberOfItems >= 5

        默认SpectrumView.numberOfItems = 20 (可修改，必须为偶数)，所以SpectrumView.frame.size.width默认要大于100
        例如：SpectrumView * spectrumView = [[SpectrumView alloc] initWithFrame:CGRectMake(0,0,100,40)];
