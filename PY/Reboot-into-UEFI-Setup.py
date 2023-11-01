import os
import platform

# Function to reboot into UEFI on Windows
def reboot_to_uefi_windows():
    try:
        os.system("shutdown /r /fw")
    except Exception as e:
        print("An error occurred:", str(e))

# Function to reboot into UEFI on Linux
def reboot_to_uefi_linux():
    try:
        os.system("systemctl reboot --firmware-setup")
    except Exception as e:
        print("An error occurred:", str(e))

# Function to reboot into UEFI boot device on MacOS
def reboot_to_uefi_macos():
    try:
        os.system("sudo nvram -p efi-boot-device")
        os.system("sudo reboot")
    except Exception as e:
        print("An error occurred:", str(e))

# Main function to reboot into UEFI based on the current platform
def reboot_to_uefi():
    current_platform = platform.system()
    if current_platform == "Windows":
        reboot_to_uefi_windows()
    elif current_platform == "Linux":
        reboot_to_uefi_linux()
    elif current_platform == "Darwin":
        reboot_to_uefi_macos()
    else:
        print("Unsupported operating system")

if __name__ == "__main__":
    print("Rebooting to UEFI setup...")
    reboot_to_uefi()
