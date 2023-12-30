#!/bin/bash
set -e  # bail if anything goes wrong

USB_PATH="/dev/mmcblk0"

is_root(){
   if [ "$(id -u)" -ne 0 ]; then
      return 1
   fi
   return 0
}

get_swap_amount(){
    # Obtain the amount of swap in Gigabytes
    awk '/SwapTotal/{printf "%.2f", ($2/1048576)}' /proc/meminfo
}

create_swap_file(){
   # This function creates a swap file on the fixed USB path and enables it
   printf "Current swap amount: %f\n" "$(get_swap_amount)"
   
   # Prompt user for the swap file name and size
   read -p "Enter the desired swap file name (e.g., swapfile): " SWAP_NAME
   read -p "Enter the desired size of the swap file in GB (e.g., 1): " SWAP_SIZE
   SWAP_FILE="/mnt/${SWAP_NAME}"

   printf "Working on creating a %s GB swap file at %s on %s\n" "$SWAP_SIZE" "$SWAP_FILE" "$USB_PATH"
   
   # Calculate the size in MB
   SWAP_SIZE_MB=$(echo "$SWAP_SIZE * 1024" | bc)
   
   # Create a swap file with the specified size
   dd if=/dev/zero of="$SWAP_FILE" bs=1M count="$SWAP_SIZE_MB"
   chmod 600 "$SWAP_FILE"
   mkswap "$SWAP_FILE" && 
   swapon "$SWAP_FILE" && 
   printf "\nCreated and turned on %s\n" "$SWAP_FILE"
   printf "Current swap amount: %f\n" "$(get_swap_amount)"

   # Add entry to /etc/fstab for automatic activation at boot
   echo "$SWAP_FILE none swap sw 0 0" >> /etc/fstab
   printf "Entry added to /etc/fstab for automatic activation at boot\n"
}

main(){
    # Check if we're root. If yes, create the swap file
    if is_root; then
        create_swap_file
    else
        printf ">>> ERR: $0 must run as root\n" > /dev/stderr
        exit 1
    fi
}

main
