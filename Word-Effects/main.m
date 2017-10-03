//
//  main.m
//  Word-Effects
//
//  Created by Nicholas Fung on 2017-10-02.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // list all of the operations available to use along with their description
        printf("Available Operations: \n");
        printf("1. Uppercase: Convert your entire string to all uppercase \n");
        printf("2. Lowercase: Convert your entire string to lowercase \n");
        printf("3. Numberize: Convert your entire string to an integer. \nInput must be a numerical number (i.e. '10' not 'ten'), other inputs are invalid for this operation, i.e. 'hello', 'ten', 'pi' are all invalid, but '10', '1984.35', '3.14', '-19294' will work\n");
        printf("4. Canadaidize: Adds \", eh?\" to the end of your string \n");
        printf("5. Respond: Answers the input string with different responses depending of the end punctuation \n");
        printf("6. De-Space-It: Replaces all of the spaces with a dash ('-') \n");
        printf(" \n");
        printf(" \n");
        
        
        
        // 255 unit long array of character
        char inputChars[255];
        
        // convert the c string to an NSString and then to an NSInteger
        NSString *operationString;
        NSInteger operation;
        
        // ask for the user's choice of operation and
        // continue asking until they provide a valid response
        do {
            printf("Choose an operation from one of the options above (1-6): \n");
            fgets(inputChars, 255, stdin);
            operationString = [NSString stringWithUTF8String:inputChars];
            operation = [operationString integerValue];
            NSLog(@"Operation: %zd", operation);
            if (operation < 1 || operation > 6) {
                NSLog(@"Invalid selection! Please try again");
            }
        } while (operation < 1 || operation > 6);
        
        
        printf("Input a string: ");
        // limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        // print as a c string
        printf("Your string is %s\n", inputChars);
        
        // convert char array to an NSString object
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        
        // print NSString object
        NSLog(@"Input was : %@", inputString);
        
        // modified string to display to the user after the operation is complete
        NSString* outputString;
        NSString* trimmedString;
        trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        // perform the operation that the user selected on their inputted string
        switch (operation) {
            
            // to uppercase
            case 1:
            outputString = [trimmedString uppercaseString];
            break;
            
            // to lowercase
            case 2 :
            outputString = [trimmedString lowercaseString];
            break;
            
            // to a number
            case 3:
            // if the string is in a valid decimal format, then [inputString doubleValue] will
            // return a non-zero value OR if it returns 0, check to see if the original string
            // was just '0', with is a valid number
            if ([[trimmedString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"0"] || [inputString doubleValue] != 0.000) {
                outputString = inputString;
            }
            else{
                NSLog(@"Not a valid operation on the input string");
            }
            break;
            
            // Canadianize
            case 4:
            outputString = [trimmedString stringByAppendingString:@", eh?"];
            break;
            
            // Respond
            case 5:
            if ([trimmedString hasSuffix:@"?"]) {
                outputString = @"I don't know";
            }
            else if ([trimmedString hasSuffix:@"!"]) {
                outputString = @"Whoa, calm down!";
            }
            else {
                outputString = @"OK";
            }
            break;
            
            // replace spaces with dashes
            case 6:
            outputString = [trimmedString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            break;
            
            default:
            break;
            
            
        }
        NSLog(@"%@", outputString);
    }
    
    return 0;
}























