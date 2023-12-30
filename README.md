
# Swap File SD/USB Creation Script

This Bash script automates the creation of a swap file on a specified USB path, providing users with a convenient way to enhance their system's memory management.

## Features

- **User Interaction:** The script prompts the user to enter a desired swap file name, size, and provides feedback throughout the process.

- **Automatic Activation:** The created swap file is automatically added to `/etc/fstab`, ensuring it is activated at system boot.

- **Flexible Size:** Users can specify the size of the swap file, allowing customization based on their system requirements.

## How to Use

1. Clone the repository:

    ```bash
    git clone <repository-url>
    ```

2. Navigate to the script directory:

    ```bash
    cd Swap_Memory_sd_Script
    ```

3. Make the script executable:

    ```bash
    chmod +x SwapVram.sh
    ```

4. Run the script as root:

    ```bash
    sudo ./SwapVram.sh
    ```

5. Follow the prompts to enter the swap file name and size.

6. The script will create the swap file, activate it, and add an entry to `/etc/fstab` for automatic activation at boot.

## Why It's Beneficial

- **Memory Management:** Swap files provide additional virtual memory, helping to prevent system slowdowns and crashes when physical memory (RAM) is insufficient.

- **Customization:** Users can easily customize the swap file name and size, tailoring it to their specific needs and system resources.

- **Automation:** The script automates the process, reducing the complexity of manually creating and configuring swap files.

## Caution

- Ensure that the specified USB path is correct and points to an appropriate storage device.

- Be cautious when specifying the size of the swap file, as it may affect disk space.

---

Feel free to customize the content based on your specific preferences and additional details you might want to include.
