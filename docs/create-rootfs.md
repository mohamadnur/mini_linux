## File System 
A Linux system expects a specific directory hierarchy. We'll create our root filesystem from scratch, closely mimicking what a real Linux distribution would use, while keeping it minimal.

**Example layout:**

Mini_linux/

    └── root/

        ├── boot/
    
        ├── proc/
    
        ├── sys/
    
        ├── dev/
    
        └── usr/
    
            ├── bin/
        
            ├── sbin/
        
            ├── lib/
        
            └── lib64/
