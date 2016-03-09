.global counter_ctrl
.text

####################################################################
#       Ko Phyo (1219104)
#       Stack Pointer Position
#
#       $sp     0 #      value
#               1 #      direction
#               2 #     register ($)
#               3 #     register ($)
#               4 #     return register ($ra)            
#               5 #     The value of the switches pass by the main
##################################################################

counter_ctrl: 

        # Creating stack spaces. The first 2 is for the parameter
        subui $sp, $sp, 7
        
        # Leaving the first 2 spaces for parameter
        
        # Back uping the registers
        
        sw      $12, 2 ($sp)
        sw      $13, 3 ($sp)
        sw      $3, 4 ($sp)
        sw      $2, 5 ($sp)
        sw      $ra, 6 ($sp)
        
        
        lw      $12, 7($sp)                  # loading the switches value to the $12
       
        
value: 
        # Storing the value in the stack 0 for direction 

        andi    $12, $12, 127           # Checking the least significant 7 switches   
        sw      $12, 0 ($sp)            # pass the parameter to the Counter.s
        
direction: 
        # Shifting the first 4 bits
        lw      $3, 7 ($sp)
        srli    $3, $3, 4
        
        # Getting the last 4 bits 
        lw      $2, 7 ($sp)
        andi    $2, $2, 15
        
        # Checking $3 >= $2
        sge     $13, $3, $2        
        bnez    $13, add_1              # Branch to add_1 for to pass parameter value - 1
      
        
add_0: 
        addi $13, $0, 0
        sw      $13, 1 ($sp)
        
        
        jal     counter 
        j       clearing_reg            # This is very important otherwise, 
                                        # the program counter will keep going to next line and passing 
                                        # parameter value - 1
        
add_1: 
        addi $13, $0, 1
        sw      $13, 1 ($sp)
        jal     counter  
        
        
        

clearing_reg: 
        lw      $12, 2 ($sp)
        lw      $13, 3 ($sp)                    # this reg store the putstr - Done and show the program finished             
        lw      $3, 4 ($sp)
        lw      $2, 5 ($sp)
        lw      $ra, 6 ($sp)
       
        
        
        addui   $sp, $sp, 7
        jr      $ra
        
######################### Notes ##################
# Chaning Effects by changing bitwise
# andi          
# ori           - countdown from the biggest number        

