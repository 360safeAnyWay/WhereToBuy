#import "LeafNotification.h"
#define DEFAULT_EDGE 24.0f
#define DEFAULT_SPACE_IMG_TEXT 22.0f
#define DEFAULT_RATE_WIDTH 0.8f
#define DEFAULT_DURATION 2.0f
#define DEFAULT_ANIMATON_DURATION 2.0f
#define DEFAULT_HEIGHT 35.0f

@interface LeafNotification()
@property(nonatomic,strong) UIViewController *controller;
@property(nonatomic,strong) NSString *text;
@property(nonatomic,strong) UIImageView *flagImageView;
@property(nonatomic,strong) UILabel *textLabel;

@end
@implementation LeafNotification

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.backgroundColor = [UIColor orangeColor].CGColor;
        self.layer.cornerRadius = 5.0f;
        self.layer.opacity = 1.0f;
        
        _textLabel = [[UILabel alloc] initWithFrame:frame];
        //        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor blackColor];
        [self.textLabel setTextAlignment:NSTextAlignmentLeft];
        _flagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, DEFAULT_EDGE, DEFAULT_EDGE)];
        self.duration = DEFAULT_DURATION;
        
        [self addSubview:self.textLabel];
        [self addSubview:self.flagImageView];
    }
    return self;
}

-(void)setType:(LeafNotificationType)type{
    if(LeafNotificationTypeWarrning == type){
        self.flagImageView.image = [UIImage imageNamed:@"notification_warring"];
    }else if(LeafNotificationTypeSuccess){
        self.flagImageView.image = [UIImage imageNamed:@"notification_success"];
    }
}
-(instancetype)initWithController:(UIViewController *)controller text:(NSString *)text{
    if([self initWithFrame:CGRectMake(0, -DEFAULT_HEIGHT, controller.view.bounds.size.width*DEFAULT_RATE_WIDTH, DEFAULT_HEIGHT)]){
        self.text = text;
        self.controller = controller;
        self.textLabel.text = text;
        self.flagImageView.image = [UIImage imageNamed:@"notification_warring"];
        [self.textLabel sizeToFit];
        CGSize size = self.textLabel.bounds.size;
        if(size.width>self.bounds.size.width-DEFAULT_EDGE-2*DEFAULT_SPACE_IMG_TEXT){
            self.flagImageView.center = CGPointMake(DEFAULT_EDGE/2+DEFAULT_SPACE_IMG_TEXT, DEFAULT_HEIGHT/2+DEFAULT_SPACE_IMG_TEXT/2 - 10);
        }else{
            CGFloat edge_left = (self.bounds.size.width-size.width-DEFAULT_SPACE_IMG_TEXT*2-DEFAULT_EDGE)/2;
            self.flagImageView.center = CGPointMake(edge_left+DEFAULT_SPACE_IMG_TEXT+DEFAULT_EDGE/2, DEFAULT_HEIGHT/2+DEFAULT_SPACE_IMG_TEXT/2 - 10);
        }
        self.textLabel.center = CGPointMake(CGRectGetMaxX(self.flagImageView.frame)+DEFAULT_SPACE_IMG_TEXT+size.width/2, self.flagImageView.center.y);
        
        self.center = CGPointMake(self.controller.view.bounds.size.width/2,self.center.y);
    }
    return self;
}
-(void)showWithAnimation:(BOOL)animation{
    CGRect frame = self.frame;
    if([self.controller.parentViewController isKindOfClass:[UINavigationController class]] && !self.controller.navigationController.navigationBar.isHidden){
        frame.origin.y = 64-DEFAULT_SPACE_IMG_TEXT;
    }else{
        frame.origin.y = DEFAULT_SPACE_IMG_TEXT;
    }
    if(animation){
        [UIView animateWithDuration:DEFAULT_ANIMATON_DURATION animations:^{
            self.frame = frame;
        } completion:^(BOOL finished) {
            [self showHandle];
        }];
    }else{
        self.frame = frame;
        [self showHandle];
    }
}
-(void)showHandle{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DEFAULT_DURATION * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissWithAnimation:YES];
    });
}
-(void)dismissWithAnimation:(BOOL)animation{
    CGRect frame = self.frame;
    frame.origin.y = -DEFAULT_HEIGHT;
    if(animation){
        [UIView animateWithDuration:DEFAULT_ANIMATON_DURATION animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else{
        //        self.frame = frame;
        [self removeFromSuperview];
    }
}
+(void)showInController:(UIViewController *)controller withText:(NSString *)text{
    [self showInController:controller withText:text type:LeafNotificationTypeWarrning];
}
+(void)showInController:(UIViewController *)controller withText:(NSString *)text type:(LeafNotificationType)type{
    LeafNotification *notification = [[LeafNotification alloc] initWithController:controller text:text];
    [controller.view addSubview:notification];
    notification.type = type;
    [notification showWithAnimation:YES];
    
}
@end