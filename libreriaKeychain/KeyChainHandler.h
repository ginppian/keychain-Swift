//
//  KeyChainHandler.h
//  Bancomer
//
//  Created by Mike on 08/06/15.
//  Copyright (c) 2015 GoNet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeyChainItemWrapper.h"

#define KEYCHAIN_STORENAME                      @"BConnectKeyChain"
#define KEYCHAIN_DATA_KEY                       @"acct"
#define KEYCHAIN_SEED_KEY                       @"seed"
#define KEYCHAIN_ACTIVATION_TIME_KEY            @"activationTime"
#define KEYCHAIN_TELEPHONE_KEY                  @"numCel"
#define KEYCHAIN_CENTER_KEY                     @"centro"
#define KEYCHAIN_CONTRATACION_BT_KEY            @"contratacionBT"
#define KEYCHAIN_ACTIVA_TOKEN_KEY               @"activaToken"
#define KEYCHAIN_OTP_KEY                        @"otp"
#define KEYCHAIN_IS_ONLYSOFTTOKEN_KEY           @"onlySofttoken"
//Apps Verticales
#define KEYCHAIN_URLSCHEME_KEY                  @"URLScheme"
#define KEYCHAIN_STRING_ST_KEY                  @"StringST"
#define TIPO_SOLICITUD                          @"tipoSolicitud"
#define TIPO_TOKEN                              @"tipoToken"

@interface KeyChainHandler : NSObject  {
@private KeychainItemWrapper *keychainItemWrapper;
}
//Apps verticales
+ (KeyChainHandler*) getInstance;
+ (void) deleteInstance;
- (BOOL)isKeyChainValido;
- (void)inicializarKeyChain;
- (NSString *)leerDeKeyChain:(NSString *)clave;
- (void)guardarEnKeyChain:(NSString *)valor clave:(NSString *)clave;
- (void)borrarDeKeyChain:(NSString *)clave;
- (void)borrarKeyChain;
//Metodo keychain para cronto
-(void)guardarDataEnKeychain:(NSData *)data clave:(NSString *)key;
-(NSData*)leerDataDeKeychain:(NSString*)key;
//Método para validar el centro
-(BOOL)isCenterValido;
//Método para validarl el esquema
-(BOOL)isSchemeValido;

@end
