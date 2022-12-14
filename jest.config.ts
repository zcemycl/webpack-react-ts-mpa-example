import type {Config} from '@jest/types';

const config: Config.InitialOptions = {
    roots: ['<rootDir>'],
    verbose: true,
    testEnvironment: 'jsdom',
    preset: 'jest-puppeteer',
    transform: {
        '^.+\\.(ts|tsx|js|jsx)$': 'ts-jest',
    },      
    // setupFiles: ['<rootDir>/test/dom.js'],
    // setupFilesAfterEnv: ['<rootDir>/test/setup/setup-matchers.js'],
    moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx'],
    collectCoverageFrom: [
        '<rootDir>/src/**/*.{ts,tsx}'
    ]
}

export default config;