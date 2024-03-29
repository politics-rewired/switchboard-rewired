module.exports = {
  clearMocks: true,
  coverageDirectory: 'coverage',
  testEnvironment: 'node',
  testMatch: ['**/?(*.)+(spec|test).[t]s?(x)'],
  preset: 'ts-jest',
  globalSetup: './src/__tests__/setup.ts',
  globalTeardown: './src/__tests__/teardown.ts',
};
