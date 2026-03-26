# Content Rendering Reference

Optional styling for technical presentations that include code blocks, math notation, or structured content. **Zero external dependencies** — uses semantic HTML, CSS, and native browser MathML.

Load this file only when the presentation contains code, math, or structured technical content.

---

## Code Blocks

Style code with CSS only — no external syntax highlighting library required for basic use.

```css
/* === CODE BLOCK BASE STYLES === */
pre {
    background: var(--code-bg, #1e1e1e);
    color: var(--code-text, #d4d4d4);
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 8px;
    font-family: 'JetBrains Mono', 'Fira Code', monospace;
    font-size: var(--small-size);
    line-height: 1.5;
    overflow-x: auto;
    max-height: min(50vh, 400px);
    tab-size: 4;
}

code {
    font-family: inherit;
}

/* Inline code */
p code, li code {
    background: var(--code-inline-bg, rgba(127, 127, 127, 0.15));
    padding: 0.15em 0.4em;
    border-radius: 4px;
    font-size: 0.9em;
}

/* === LIGHT THEME VARIANT === */
.light-theme pre,
[data-theme="light"] pre {
    --code-bg: #f5f5f5;
    --code-text: #1e1e1e;
    --code-inline-bg: rgba(0, 0, 0, 0.06);
}

/* === SYNTAX COLORS (CSS-only, semantic classes) === */
.keyword { color: #569cd6; }      /* if, else, return, function */
.string  { color: #ce9178; }      /* "hello", 'world' */
.comment { color: #6a9955; font-style: italic; }
.number  { color: #b5cea8; }      /* 42, 3.14 */
.type    { color: #4ec9b0; }      /* class names, types */
.fn      { color: #dcdcaa; }      /* function names */
.op      { color: #d4d4d4; }      /* operators */
```

### Usage in Slides

Wrap code in semantic HTML with syntax classes:

```html
<pre><code><span class="keyword">function</span> <span class="fn">greet</span>(name) {
    <span class="keyword">return</span> <span class="string">`Hello, ${name}!`</span>;
}</code></pre>
```

For simple code display without syntax highlighting, plain `<pre><code>` works fine.

---

## Math Notation (MathML)

Use native browser MathML — no KaTeX or MathJax CDN needed. Supported in all modern browsers (Chrome 109+, Firefox, Safari 16.4+).

```css
/* === MATH STYLES === */
math {
    font-size: 1.1em;
}

/* Display math (block, centered) */
math[display="block"] {
    display: block;
    text-align: center;
    margin: clamp(0.5rem, 1.5vw, 1.5rem) 0;
    font-size: clamp(1rem, 2vw, 1.4rem);
}

/* Inline math */
math:not([display="block"]) {
    vertical-align: middle;
}
```

### Usage Examples

**Quadratic formula (display):**
```html
<math display="block">
    <mi>x</mi><mo>=</mo>
    <mfrac>
        <mrow><mo>−</mo><mi>b</mi><mo>±</mo><msqrt><mrow><msup><mi>b</mi><mn>2</mn></msup><mo>−</mo><mn>4</mn><mi>a</mi><mi>c</mi></mrow></msqrt></mrow>
        <mrow><mn>2</mn><mi>a</mi></mrow>
    </mfrac>
</math>
```

**Inline math:**
```html
<p>The time complexity is <math><mi>O</mi><mo>(</mo><mi>n</mi> <mo>log</mo> <mi>n</mi><mo>)</mo></math>.</p>
```

---

## Structured Content Patterns

### Comparison Tables

```css
.comparison-table {
    width: 100%;
    border-collapse: collapse;
    font-size: var(--body-size);
}

.comparison-table th {
    text-align: left;
    padding: clamp(0.3rem, 1vw, 0.75rem);
    border-bottom: 2px solid var(--accent, currentColor);
    font-weight: 600;
}

.comparison-table td {
    padding: clamp(0.3rem, 1vw, 0.75rem);
    border-bottom: 1px solid rgba(127, 127, 127, 0.2);
}
```

### Definition Lists

```css
dl {
    display: grid;
    grid-template-columns: auto 1fr;
    gap: clamp(0.25rem, 0.5vw, 0.5rem) clamp(0.5rem, 1.5vw, 1.5rem);
    font-size: var(--body-size);
}

dt {
    font-weight: 700;
    color: var(--accent, currentColor);
}
```

---

## Pseudocode

For algorithm presentations, use semantic markup with CLRS-style keywords:

```css
.pseudocode {
    font-family: 'JetBrains Mono', monospace;
    font-size: var(--small-size);
    line-height: 1.8;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    background: var(--code-bg, #1e1e1e);
    border-radius: 8px;
}

.pseudocode .kw { font-weight: 700; color: #569cd6; }  /* if, then, else, while, for, return */
.pseudocode .var { font-style: italic; }
.pseudocode .indent-1 { padding-left: 2em; }
.pseudocode .indent-2 { padding-left: 4em; }
```

### Mathematical Operators in Pseudocode

Use Unicode characters for clarity: `←` (assignment), `≤`, `≥`, `≠`, `∞`, `⌊`, `⌋`, `⌈`, `⌉`.
