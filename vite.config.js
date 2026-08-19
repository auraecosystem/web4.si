import { defineConfig } from 'vite';
import { web4HtmlPlugin } from './plugins/vite-plugin-web4-html';

export default defineConfig({
  plugins: [
    web4HtmlPlugin({
      schemaPath: './www/web4.si/html.yaml',
      sanitizerBinary: './build/web4-si-domainprep',
      targetDomain: 'münchen.docs.web4.si'
    })
  ],
  build: {
    outDir: 'dist/html'
  }
});
