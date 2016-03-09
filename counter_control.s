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
        subui $sp, $sp, 5
        
        # Leaving the first 2 spaces for parameter
        
        # Back uping the registers
        sw      $10, 0 ($sp)            # value - paramerter
        sw      $11, 1 ($sp)            # direction - parameter
        sw      $12, 2 ($sp)
        sw      $13, 3 ($sp)
        sw      $ra, 4 ($sp)
        
        
        lw      $12, 5($sp)                  # loading the switches value to the $12
        lw      $13, 5 ($sp)                 # loading the switches value to the $12
 
        # Storing the value in the stack 0 for direction 
       
        andi    $12, $12, 127           # Checking the least significant 7 switches   
        sw      $12, 0 ($sp)            # pass the parameter to the Counter.s
        
     
        
        # Direction paramerter    - Checking Most Singficant bits 
        
        andi    $13, $13, 128            # checking the direction whether zero or 1 - 0x80 - 128
        srli    $13, $13, 7              # Checking the first 7 bits
        sw      $13, 1 ($sp)
        
       
        jal     counter  

        


clearing_reg: 
        
        #lw      $10, 0 ($sp)
        #lw      $11, 1 ($sp)
        lw      $12, 2 ($sp)
        lw      $13, 3 ($sp)                    # this reg store the putstr - Done and show the program finished             
        lw      $ra, 4 ($sp)
        
        addui   $sp, $sp, 5
        jr      $ra
        
######################### Notes ##################
# Chaning Effects by changing bitwise
# andi          
# ori           - countdown from the biggest number        

