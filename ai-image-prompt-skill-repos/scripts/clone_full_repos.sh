#!/usr/bin/env bash
set -euo pipefail

DOWNLOAD_DIR="${1:-_downloaded_ai_image_prompt_skill_repos}"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

clone_or_pull() {
  local url="$1"
  local dir="$2"

  if [ -d "$dir/.git" ]; then
    echo "[pull] $dir"
    git -C "$dir" pull --ff-only || true
  else
    echo "[clone] $url -> $dir"
    git clone --depth 1 "$url" "$dir"
  fi
}

clone_or_pull "https://github.com/YouMind-OpenLab/ai-image-prompts-skill.git" "YouMind-OpenLab_ai-image-prompts-skill"
clone_or_pull "https://github.com/wuyoscar/GPT-Image2-Skill.git" "wuyoscar_GPT-Image2-Skill"
clone_or_pull "https://github.com/ConardLi/garden-skills.git" "ConardLi_garden-skills"
clone_or_pull "https://github.com/smixs/visual-skills.git" "smixs_visual-skills"
clone_or_pull "https://github.com/devanshug2307/Awesome-AI-Image-Prompts.git" "devanshug2307_Awesome-AI-Image-Prompts"
clone_or_pull "https://github.com/creatify-ai/ai-ad-prompt-guide.git" "creatify-ai_ai-ad-prompt-guide"
clone_or_pull "https://github.com/jezweb/claude-skills.git" "jezweb_claude-skills"
clone_or_pull "https://github.com/pauhu/gemini-image-prompting-handbook.git" "pauhu_gemini-image-prompting-handbook"
clone_or_pull "https://github.com/backblaze-b2-samples/image-generation-prompt-flow.git" "backblaze-b2-samples_image-generation-prompt-flow"
clone_or_pull "https://github.com/K-Dense-AI/claude-scientific-writer.git" "K-Dense-AI_claude-scientific-writer"

echo ""
echo "All repositories cloned into: $DOWNLOAD_DIR"
