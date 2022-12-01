#include <stdio.h>

int main() {
	
    char s[100];
    
    printf("Enter input string :");
    scanf("%s",s);
    
    int count=0, count1=0, i;
    
    for (i = 0; s[i] != '\0'; i++);
    if(s[i-1] == s[i-2])
        printf("String is accepted");
    else
        printf("String is not accepted");
        
    return 0;
}

