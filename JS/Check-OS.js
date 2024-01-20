const os = require('os');

const platform = os.platform();
const version = os.release();

function getOperatingSystemInfo(platform, version) {
    switch (platform) {
        case 'win32':
            return mapWindowsVersion(version);
        case 'darwin':
            return `macOS (Version ${version})`;
        case 'linux':
            return `Linux (Kernel ${version})`;
        default:
            return 'Unknown Operating System';
    }
}

function mapWindowsVersion(version) {
    const buildNumber = os.platform() === 'win32' ? os.release().split('.')[2] : null;

    switch (version) {
        case '5.1':
            return 'Windows XP';
        case '5.2':
            return 'Windows Server 2003';
        case '6.0':
            return 'Windows Vista';
        case '6.1':
            return 'Windows 7';
        case '6.2':
            return 'Windows 8';
        case '6.3':
            return 'Windows 8.1';
        case '10.0':
            return buildNumber && buildNumber >= 22000 ? 'Windows 11' : 'Windows 10';
        default:
            return `Windows (Version ${version})`;
    }
}

const operatingSystemInfo = getOperatingSystemInfo(platform, version);
console.log(`Your operating system is ${operatingSystemInfo}!`);
