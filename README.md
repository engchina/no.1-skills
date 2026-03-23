# no.1-skills

A curated collection of agent skills that extend AI coding assistants (Claude Code, OpenAI Codex, GitHub Copilot, and others) with specialized knowledge, workflows, and tool integrations.

## What Are Skills?

Skills are modular, self-contained folders that give AI agents procedural knowledge they don't natively possess. Each skill contains a `SKILL.md` file with frontmatter metadata (used to decide when the skill triggers) and Markdown instructions, plus optional bundled scripts, reference documents, and assets.

Skills use a three-level progressive disclosure model:

1. **Metadata** (name + description) — always in context, ~100 words
2. **SKILL.md body** — loaded when the skill triggers
3. **Bundled resources** — scripts, references, and assets loaded only as needed

## Skills in This Collection

### skill-creator

Guides an AI agent through creating or updating a skill from scratch. Covers the full lifecycle: gathering concrete usage examples, planning reusable scripts/references/assets, initializing the skill folder with `init_skill.py`, writing effective `SKILL.md` frontmatter and instructions, validating with `quick_validate.py`, and forward-testing with subagents.

Trigger: user wants to create a new skill or improve an existing one.

### skill-installer

Installs skills from the curated list at `openai/skills` or from any GitHub repository path (including private repos). Lists available skills, shows which are already installed, and places them into `$CODEX_HOME/skills`.

Trigger: user asks to list installable skills, install a named skill, or install from a GitHub repo.

### pdf

Full PDF processing toolkit covering text and table extraction, merging, splitting, page rotation, watermarks, password protection, image extraction, OCR on scanned PDFs, fillable form filling, and PDF creation from scratch.

Libraries used: `pypdf`, `pdfplumber`, `reportlab`, `pytesseract`, `pdf2image`.
CLI tools: `pdftotext`, `qpdf`, `pdftk`.

Trigger: any task involving a `.pdf` file.

### pptx

PowerPoint presentation creation, editing, and analysis. Supports reading content with `markitdown`, editing existing decks by unpacking/repacking OOXML, creating from scratch with `pptxgenjs`, and visual QA by converting slides to images via LibreOffice + Poppler. Includes opinionated design guidance: color palettes, typography pairings, layout patterns, and a mandatory QA verification loop.

Trigger: any task involving a `.pptx` file, deck, slides, or presentation.

### frontend-slides

HTML-first presentation generation for decks that need to feel designed, distinctive, and browser-native. Creates zero-dependency slide decks from scratch, converts `.pptx` files into interactive web slides, and enforces strict viewport-fitting rules so every slide renders cleanly without scrolling.

Source: [zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides)

Trigger: user wants to build a presentation in HTML, convert a `.pptx` deck to web slides, or improve an existing HTML presentation.

### xlsx

Spreadsheet creation, editing, and analysis. Covers data analysis with `pandas`, formula-based Excel models with `openpyxl`, mandatory formula recalculation via LibreOffice (`scripts/recalc.py`), and financial model color-coding and formatting conventions. Enforces zero formula errors as a hard requirement.

Trigger: any task where the deliverable or primary input is an `.xlsx`, `.xlsm`, `.csv`, or `.tsv` file.

### skywork-design

Image generation and editing via the Skywork Image API. Supports text-to-image, image-to-image editing, multiple reference images, aspect ratio and resolution control, and scenario-specific guidance for posters, logos, branding, infographics, brochures, and social media visuals.

Trigger: user wants to generate or edit images, posters, logos, or other visual assets.

### docx

Word document creation, editing, and analysis. Supports creating new documents with `docx-js` (with precise control over page size, styles, lists, tables, images, hyperlinks, footnotes, headers/footers, and TOC), and editing existing documents by unpacking OOXML XML, applying tracked changes and comments, then repacking. Includes `.doc` to `.docx` conversion via LibreOffice.

Trigger: any task involving a `.docx` file, or requests for Word documents, reports, memos, or letters.

### skywork-doc

Professional document generation via the Skywork Office Doc API. Creates polished `docx`, `pdf`, `html`, or `md` outputs from prompts or uploaded reference files, and can automatically gather supporting material through built-in web search when needed.

Trigger: user wants a structured document output that goes beyond a short plain-text reply, especially reports, proposals, resumes, research summaries, or file-based rewrites.

### agent-browser

CLI-driven browser automation for AI agents using `agent-browser`. Follows a snapshot-interact-re-snapshot loop using stable element refs (`@e1`, `@e2`, ...). Supports form filling, authentication with state persistence, parallel sessions, data extraction, JavaScript evaluation, screenshot and PDF capture, and mobile Safari via iOS Simulator.

Trigger: any task requiring programmatic web interaction — navigating pages, filling forms, clicking buttons, scraping data, or testing web apps.

### find-skills

Helps users discover and install skills from the open agent skills ecosystem via the `npx skills` CLI. Searches `skills.sh`, presents results with install commands, and can install skills directly with `npx skills add <package> -g -y`.

Trigger: user asks "how do I do X", "find a skill for X", or expresses interest in extending agent capabilities.

### skywork-excel

AI-powered Excel and structured analysis workflow backed by the Skywork Excel service. Handles spreadsheet creation, data transformation, charting, dashboard-style outputs, and HTML analysis reports, with built-in web search for current data and support for uploaded Excel, CSV, PDF, and image inputs.

Trigger: user wants Excel files, charts, structured analysis reports, or data work that combines uploaded files with up-to-date information.

### skywork-music-maker

Music generation workflow powered by the Mureka API. Covers lyrics writing, full song generation, instrumental creation, reference-track uploads, vocal cloning, and structured prompt conversion from natural-language music requests.

Trigger: user wants to create a song, beat, instrumental, lyrics, or any other AI-generated music asset.

### skywork-ppt

Presentation workflow built on Skywork's PPT backend. Supports generating new decks from a topic, imitating the style of an existing `.pptx`, AI-based editing of existing presentations, and local slide operations such as delete, reorder, extract, and merge.

Trigger: user wants to create, restyle, edit, or locally manipulate a PowerPoint presentation.

### skywork-search

Real-time web search through the Skywork search API. Runs up to three focused queries per invocation and returns structured results with source URLs and snippets that can be synthesized into research notes or fed into document/presentation workflows.

Trigger: user asks for current information, research, fact-finding, or any task that explicitly requires internet search.

### summarize

Fast URL, file, and YouTube summarization via the `summarize` CLI. Works well as a fallback for transcript extraction, quick article briefings, and turning local files or video links into short, medium, or long summaries with provider-selectable models.

Trigger: user asks to summarize a URL, local file, article, podcast, or YouTube/video link, or to extract a transcript.

### self-improving-agent

Captures errors, user corrections, knowledge gaps, and best practices into structured `.learnings/` log files (`ERRORS.md`, `LEARNINGS.md`, `FEATURE_REQUESTS.md`). Supports promotion of broadly applicable learnings to `CLAUDE.md`, `AGENTS.md`, and `.github/copilot-instructions.md`. Integrates with OpenClaw's workspace injection system. Includes hook scripts for automatic error detection and session-start reminders.

Trigger: a command fails unexpectedly, the user corrects the agent, an API behaves differently than expected, or a better approach is discovered for a recurring task.

### tmux

Interactive terminal orchestration via `tmux`. Starts isolated sessions, sends keystrokes to long-running CLIs, captures pane output for inspection, and is especially useful when an agent needs a true TTY for REPLs, interactive tools, or multiple concurrent coding sessions.

Trigger: a task needs remote control of an interactive CLI or background TTY session rather than a one-shot command.

## Directory Structure

```
no.1-skills/
├── agent-browser/          # Browser automation
├── docx/                   # Word document processing
├── find-skills/            # Skill discovery and installation
├── frontend-slides/        # HTML presentation generation
├── pdf/                    # PDF processing
├── pptx/                   # PowerPoint processing
├── self-improving-agent/   # Continuous improvement logging
├── skill-creator/          # Skill authoring guide
├── skill-installer/        # Skill installer from GitHub
├── skywork-design/         # Image generation and editing
├── skywork-doc/            # Professional document generation
├── skywork-excel/          # Excel and structured analysis generation
├── skywork-music-maker/    # AI music generation
├── skywork-ppt/            # Presentation generation and editing
├── skywork-search/         # Real-time web research
├── summarize/              # URL and file summarization
├── tmux/                   # Interactive terminal orchestration
└── xlsx/                   # Spreadsheet processing
```

Each skill folder contains:

```
<skill-name>/
├── SKILL.md                # Required: frontmatter + instructions
├── agents/
│   └── openai.yaml         # UI metadata (display name, short description, default prompt)
├── scripts/                # Executable Python/Bash scripts
├── references/             # Documentation loaded on demand
└── assets/                 # Templates, icons, fonts, sample files
```

## Installing Skills

Use the `skill-installer` skill or the `npx skills` CLI:

```bash
# List available curated skills
npx skills find

# Install a skill globally
npx skills add <owner/repo@skill-name> -g -y

# Or use skill-installer via Codex
# "Install the pdf skill"
```

## Creating Your Own Skills

Use the `skill-creator` skill. The quickest path:

```bash
# Inside your skills directory
python skill-creator/scripts/init_skill.py my-skill --path . --resources scripts,references

# Validate
python skill-creator/scripts/quick_validate.py my-skill/
```

See [skill-creator/SKILL.md](skill-creator/SKILL.md) for the full authoring guide.

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Acknowledgements

This collection was assembled from skills originally developed and published by the following projects and organizations. Deep thanks to each of them for making their work openly available:

- **OpenAI Skills** — [github.com/openai/skills/tree/main/skills](https://github.com/openai/skills/tree/main/skills)
  The foundational skills ecosystem and specification that defines the `SKILL.md` format, progressive disclosure model, and the curated/experimental skill registry.

- **Anthropic Skills** — [github.com/anthropics/skills/tree/main/skills](https://github.com/anthropics/skills/tree/main/skills)
  Skills tailored for Claude-based agents, contributing patterns and integrations optimized for Claude Code and the Anthropic toolchain.

- **OpenClaw** — [github.com/openclaw/openclaw/tree/main/skills](https://github.com/openclaw/openclaw/tree/main/skills)
  The OpenClaw workspace-based skill injection platform, including the `self-improving-agent` skill, inter-session communication tools, and the `SOUL.md` / `TOOLS.md` / `AGENTS.md` workspace structure.

- **Frontend Slides** — [github.com/zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides)
  The original standalone repository for the `frontend-slides` skill, focused on HTML-native, animation-rich presentations and PPT-to-web conversion workflows.

- **Skywork Skills** — [github.com/SkyworkAI/Skywork-Skills](https://github.com/SkyworkAI/Skywork-Skills)
  The upstream source for the `skywork-design`, `skywork-doc`, `skywork-excel`, `skywork-music-maker`, `skywork-ppt`, and `skywork-search` skills, providing hosted creation workflows for images, documents, spreadsheets, presentations, music, and web research.

- **ClawHub** — [clawhub.ai](https://clawhub.ai/)
  The skill discovery and distribution hub that makes community skills findable and installable via a unified registry.
