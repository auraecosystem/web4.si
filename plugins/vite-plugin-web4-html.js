import fs from 'fs';
import path from 'path';
import yaml from 'js-yaml';
import { execFileSync } from 'child_process';

export function web4HtmlPlugin(options = {}) {
  let schema = null;
  let sanitizedDomain = '';

  // Executes compiled Vala ICU binary
  function runDomainSanitizer(rawDomain) {
    const binaryPath = path.resolve(process.cwd(), options.sanitizerBinary || './build/web4-si-domainprep');
    try {
      const output = execFileSync(binaryPath, [rawDomain], { encoding: 'utf8' });
      const match = output.match(/Punycode\/ASCII\s*:\s*(.+)/);
      return match ? match[1].trim() : rawDomain;
    } catch (err) {
      console.warn(`[web4-html] ICU Sanitizer fallback for "${rawDomain}":`, err.message);
      return rawDomain;
    }
  }

  return {
    name: 'vite-plugin-web4-html',

    configResolved(config) {
      const schemaFile = path.resolve(config.root, options.schemaPath);
      schema = yaml.load(fs.readFileSync(schemaFile, 'utf8'));

      // Sanitize target domain from options or frontmatter default
      const rawDomain = options.targetDomain || 'münchen.docs.web4.si';
      sanitizedDomain = runDomainSanitizer(rawDomain);
      console.log(`[web4-html] Target domain sanitized: ${rawDomain} -> ${sanitizedDomain}`);
    },

    transformIndexHtml(html) {
      if (!schema) return html;

      // 1. Resolve metadata tags with ICU Punycode output
      const canonicalUrl = schema.layout.head.meta_tags.canonical.replace('${sanitized_domain}', sanitizedDomain);
      const ogUrl = schema.layout.head.meta_tags.og_url.replace('${sanitized_domain}', sanitizedDomain);

      const metaTags = `
    <link rel="canonical" href="${canonicalUrl}">
    <meta property="og:url" content="${ogUrl}">
    <meta name="generator" content="${schema.layout.head.meta_tags.generator}">`;

      // 2. Inject stylesheets and scripts from schema
      const stylesheets = schema.layout.head.stylesheets
        .map(s => `<link rel="${s.rel}" type="${s.type}" href="${s.href}">`)
        .join('\n    ');

      return html.replace('</head>', `${metaTags}\n    ${stylesheets}\n</head>`);
    }
  };
}
