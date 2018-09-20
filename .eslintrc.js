module.exports = {
  extends: ['airbnb'],
  rules: {
    indent: ['error', 2, {
      MemberExpression: 0, // indent the multi-line property chains with 0 spaces
    }],
    'require-jsdoc': [0],
    'valid-jsdoc': ['warn'],
    'no-param-reassign': ['error', {
      props: true,
      ignorePropertyModificationsFor: ['memo', 'acc'], // allow reducer accumulators to be modified
    }],
    'complexity': ['error', 10], // allow max cyclomatic complexity of 10
  },
};
