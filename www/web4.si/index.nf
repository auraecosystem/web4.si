---
title: "Web4 Systems Architecture"
domain: "web4.si"
version: "1.0.0"
layout: "default"
author: "KUBU LEE"
---

# Web4 Architecture Specifications

Welcome to the **web4.si** root documentation node. This portal compiles `.nf` markup structures into zero-dependency static web interfaces.

## Engine Subsystems

* **Lexer/Parser Pipeline:** ANTLR4 syntax definitions mapping raw token streams to abstract syntax tree (AST) nodes.
* **HTML Exporter:** AST translation governed by `www/web4.si/html.yaml`.
* **Domain Prep & UTS #46:** Punycode and Unicode validation via ICU `icu-uc` Vala wrappers.
* **Style Hydration:** Vite + SCSS reactive theme switching.
