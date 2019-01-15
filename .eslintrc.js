module.exports = {
  extends: ['prettier', 'plugin:require-path-exists/recommended'],
  plugins: ['require-path-exists'],
  parserOptions: {
    ecmaVersion: 2018,
  },
  env: {
    es6: true,
    node: true,
  },
  rules: {
    'no-undef': ['error'],
    'no-unused-vars': ['error'],
    'no-param-reassign': ['error', {
      props: true,
      ignorePropertyModificationsFor: ['memo', 'acc'], // allow reducer accumulators to be modified
    }],
    'complexity': ['error', 10], // allow max cyclomatic complexity of 10
    'require-jsdoc': [0],
    'valid-jsdoc': ['warn'],
  },
};
