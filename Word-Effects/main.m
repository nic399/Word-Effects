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
        
        printf("Available Operations: \n");
        printf("1. Uppercase: Convert your entire string to all uppercase \n");
        printf("2. Lowercase: Convert your entire string to lowercase \n");
        printf("3. Numberize: Convert your entire string to an integer. \nNon-integer inputs are invalid for this operation, i.e. 'hello', 'ten', '3.14', 'pi' are all invalid, but '10', '1984', '123456789' will work\n");
        printf("4. Canadaidize: Adds \", eh?\" to the end of your string \n");
        printf("5. Respond: Answers the input string with different responses depending of the end punctuation \n");
        printf("6. De-Space-It: Replaces all of the spaces with a dash ('-') \n");
        printf(" \n");
        printf(" \n");
        
        
        
        // 255 unit long array of character
        char inputChars[255];
        NSString *operationString;
        NSInteger operation;
        do {
            printf("Choose an operation from one of the options above (1-6): \n");
            fgets(inputChars, 255, stdin);
            operationString = [NSString stringWithUTF8String:inputChars];
            operation = [operationString integerValue];
            NSLog(@"Operation: %zd", operation);
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
        
        
        
    }
    return 0;
}
