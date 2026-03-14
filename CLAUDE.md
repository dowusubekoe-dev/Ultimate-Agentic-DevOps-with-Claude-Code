# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront. Built by Derek Owusu Bekoe from Pravin Mishra Portfolio template.

## No Build Process

This is a pure static site — no Node.js, no build tools, no package manager, no test framework. There are no build, lint, or test commands. Files are served directly by Nginx.

## File Structure

- `index.html` — Main portfolio page (all site content is hardcoded here)
- `style.css` — All styles; uses CSS variables, Grid, Flexbox, and keyframe animations
- `privacy.html`, `terms.html` — Standalone static pages with their own inline styles
- `images/` — Static assets (logo, hero banner, profile photo, book covers)

## Architecture

`index.html` is a single-page layout with sequential sections: navbar → hero → about → services → courses → books → community → contact → footer. Navigation links use anchor IDs (`#about`, `#services`, etc.).

`style.css` uses a yellow (`#facc15`) and blue (`#3b82f6`) color scheme. Responsive breakpoints are at 900px, 768px, and 600px. FontAwesome 6.5.0 is loaded from CDN.

`images/` stores all images used in the website

`privacy.html` is the Privacy policy page

`terms.html` is the Terms and conditions page

`README.md` — Repository documentation

The only JavaScript is two inline snippets in `index.html`: a hamburger menu toggle and dynamic copyright year display.

## Conventions

Project rules that must be followed:

- Only HTML5 and CSS3 are allowed.
- No JavaScript framework such as React, Vue, or Angular.
- All images stored in `images/`
- No package managers or build tools.
- The website should remain a static site

## Custom Skills

Four Claude Code skills are defined in `.claude/skills/` and invoked with `/skill-name`:

| Skill | Description |
|---|---|
| `/scaffold-terraform [region] [project-name]` | Generates `terraform/` directory with complete S3+CloudFront config (defaults: `us-east-1`, `agentic-ai-portfolio-site`) |
| `/tf-plan` | Runs `terraform plan` and summarizes risks/blast radius |
| `/tf-apply` | Runs `terraform apply -auto-approve` and reports outputs |
| `/deploy` | Syncs site files to S3 and invalidates CloudFront cache |

**Typical AWS workflow:** `/scaffold-terraform` → review → `/tf-plan` → `/tf-apply` → `/deploy`

The Terraform infrastructure provisions: private S3 bucket + CloudFront distribution with OAC (not legacy OAI), HTTPS redirect, and `index.html` as default root. State backend config is in `terraform/backend.tf` (commented out by default — see inline instructions for migrating state to S3).

## Deployment

**Option A — Nginx on Ubuntu VM:**

```bash
sudo cp -r . /var/www/html/
sudo systemctl restart nginx
# Access via: http://<public-ip>
```

Minimum Nginx config:

```nginx
server {
    listen 80;
    root /var/www/html;
    index index.html;
}
```

**Option B — AWS S3 + CloudFront:** Use the custom skills above.

## DMI Ownership Proof

Students must add their deployment info to the footer of `index.html` before submitting. The footer is near the end of the file, inside `.footer-bottom`. Required format:

```html
<p><strong>Deployed by:</strong> DMI Cohort 2 | Your Name | Group X | Week 1 | DD-MM-YYYY</p>
```
