/****************************************************************************
 Copyright (c) 2010 cocos2d-x.org

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/
#import <UIKit/UIKit.h>
#import "AppController.h"
#import "cocos2d.h"
#import "EAGLView.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "CCVideoPlayer.h"
#include "QVideoPlayer.h"
#import <MSDK/MSDK.h>
#import <MSDKXG/MSDKXG.h>
#import "QMSDKBridge.h"
#import "QTssSDK.h"
#import "QMSCSDK.h"

@implementation AppController

#pragma mark -
#pragma mark Application lifecycle

// cocos2d application instance
static AppDelegate s_sharedApplication;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    _window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    EAGLView *__glView = [EAGLView viewWithFrame: [_window bounds]
                                     pixelFormat: kEAGLColorFormatRGBA8
                                     depthFormat: GL_DEPTH24_STENCIL8_OES
                              preserveBackbuffer: NO
                                      sharegroup: nil
                                   multiSampling: NO
                                 numberOfSamples: 0];
    // Enable multi-touches
    [__glView setMultipleTouchEnabled:YES];

    // Use RootViewController manage EAGLView
    viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    viewController.wantsFullScreenLayout = YES;
    viewController.view = __glView;

    // Set RootViewController to window
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        [_window addSubview: viewController.view];
    }
    [_window setRootViewController:viewController];
    [_window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    cocos2d::CCApplication::sharedApplication()->run();
    [CCVideoPlayer setDelegate:self];
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    [[UIApplication sharedApplication] setIdleTimerDisabled: YES];
    
    WGPlatformObserver *ob = [MSDKService getObserver];
    if (!ob)
    {
        QMSDKBridge* msdkBridge = QMSDKBridge::sharedInstance();
        [MSDKService setObserver:msdkBridge];
        msdkBridge->setObServer();
    }
    QTssSDK::getInstance()->initTssSdk();
    
    [MSDKXG WGRegisterAPNSPushNotification:launchOptions];
    
    QMSCSDK::getInstance()->init();
    return YES;
}

-(void)playVedio:(NSString *) file{
    CCSize size = CCDirector::sharedDirector()->getWinSize();
    [CCVideoPlayer setScrrenSize:CGSizeMake(size.width, size.height)];
    [CCVideoPlayer setNoSkip:true];
    [CCVideoPlayer playMovieWithFile:file];
}

- (void) movieStartsPlaying
{
    
}

- (void) moviePlaybackFinished
{
    QVideoPlayer::sharedQVideoPlayer()->onCompletion();
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    cocos2d::CCDirector::sharedDirector()->pause();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    [MSDKXG WGCleanBadgeNumber];
    cocos2d::CCDirector::sharedDirector()->resume();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    
    cocos2d::CCApplication::sharedApplication()->applicationDidEnterBackground();
    QTssSDK::getInstance()->setGameStatusBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    if ([CCVideoPlayer isPlaying]) {
        [CCVideoPlayer cancelPlaying];
    }
    cocos2d::CCApplication::sharedApplication()->applicationWillEnterForeground();
    QTssSDK::getInstance()->setGameStatusFrontground();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [MSDKXG WGSuccessedRegisterdAPNSWithToken:deviceToken];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [MSDKXG WGFailedRegisteredAPNS];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [MSDKXG WGReceivedMSGFromAPNSWithDict:userInfo];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    WGPlatform* plat = WGPlatform::GetInstance();
    WGPlatformObserver *ob = plat->GetObserver();
    if (!ob)
    {
        QMSDKBridge* msdkBridge = QMSDKBridge::sharedInstance();
        plat->WGSetObserver(msdkBridge);
    }
    
    if([sourceApplication isEqualToString:@"com.qtz.game.launch"])
    {
        return [self qHandleOpenURL:url];
    }
    
    return [WGInterface HandleOpenURL:url];
}

- (void)dealloc {
    [super dealloc];
}

- (UIViewController*)getViewController
{
    return viewController;
}

//- (BOOL)shouldAutorotate
//{
//    return [_window keyWindow];
//}

-(BOOL) qHandleOpenURL:(NSURL *)url
{
    NSString *host = [url host];
    NSNumber *port = [url port];
    NSString *path = [url path];
    NSString *strUrl = NULL;
    
    if(port)
    {
        strUrl = [NSString stringWithFormat:@"%@:%@%@", host, port, path];
    }
    else
    {
        strUrl = [NSString stringWithFormat:@"%@%@", host, path];
    }
    
    const char* key = "update_info_url";
    cocos2d::CCString *value = cocos2d::CCString::create([strUrl UTF8String]);
    cocos2d::CCConfiguration::sharedConfiguration()->setObject(key, value);
    
    //NSLog(@"%@", strUrl);
    //UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:strUrl delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"关闭", nil];
    //[sheet showInView:self.getViewController.view];
    
    return YES;
}

@end

