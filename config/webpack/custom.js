const path = require('path');
module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(
        __dirname,
        '..',
        '..',
        'app/javascript/src',
      ),
      assets: path.resolve(__dirname, '..', '..', 'app/assets'),
    },
  },
};
