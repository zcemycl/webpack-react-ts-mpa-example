const ci = Boolean(process.env.CI || false);

const baseOptions = {
    server: {
        command: 'npm run start',
        port: 3000
    }
}

const ciPipelineOptions = {
    launch: {
        executablePath: '/usr/bin/google-chrome-stable',
        headless: true,
        slowMo: 250,
        args: [
            '--ignore-certificate-errors',
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-accelerated-2d-canvas',
            '--disable-gpu'
        ]
    },
    server: baseOptions.server
}

module.exports = ci ? ciPipelineOptions : baseOptions;