//
//  WNLoginViewController.m
//  WorkshopNativo-iOS
//
//  Created by Roman Guarino on 27/05/2019.
//  Copyright © 2019 WorkshopNativo. All rights reserved.
//

#import "WNLoginViewController.h"
#import "WNProfileViewController.h"
#import "WNUserModel.h"

@interface WNLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtUser;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation WNLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    _txtPassword.secureTextEntry = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)login:(UIButton *)sender {
    if([_txtUser.text isEqual:@""] ||  [_txtPassword.text isEqual: @""]) {
        [self showAlertError:@"Debes completar todos los campos"];
    }
    else if (![_txtPassword.text isEqual: @"password"]) {
        [self showAlertError:@"Contraseña inválida. Prueba con 'password'"];
    }
    else {
        WNUserModel *userModel = [[WNUserModel alloc] init];
        userModel.user = _txtUser.text;
        
        WNProfileViewController *profileViewController = [[WNProfileViewController alloc] initWithModel:userModel];
        [self.navigationController pushViewController:profileViewController animated:YES];
    }
}

- (void) showAlertError:(NSString *) message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Atención"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
