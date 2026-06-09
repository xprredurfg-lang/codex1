#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT_DIR"

mkdir -p external/ai-image-prompt-skills

add_submodule_if_missing() {
  local url="$1"
  local path="$2"

  if [ -d "$path/.git" ] || git config --file .gitmodules --get-regexp "submodule\..*\.path" 2>/dev/null | grep -q " $path$"; then
    echo "[skip] submodule already exists: $path"
    return 0
  fi

  if [ -e "$path" ]; then
    echo "[skip] path already exists but is not a submodule: $path"
    return 0
  fi

  echo "[add] $url -> $path"
  git submodule add "$url" "$path"
}

add_submodule_if_missing "https://github.com/YouMind-OpenLab/ai-image-prompts-skill.git" "external/ai-image-prompt-skills/YouMind-OpenLab_ai-image-prompts-skill"
add_submodule_if_missing "https://github.com/wuyoscar/GPT-Image2-Skill.git" "external/ai-image-prompt-skills/wuyoscar_GPT-Image2-Skill"
add_submodule_if_missing "https://github.com/ConardLi/garden-skills.git" "external/ai-image-prompt-skills/ConardLi_garden-skills"
add_submodule_if_missing "https://github.com/smixs/visual-skills.git" "external/ai-image-prompt-skills/smixs_visual-skills"
add_submodule_if_missing "https://github.com/devanshug2307/Awesome-AI-Image-Prompts.git" "external/ai-image-prompt-skills/devanshug2307_Awesome-AI-Image-Prompts"
add_submodule_if_missing "https://github.com/creatify-ai/ai-ad-prompt-guide.git" "external/ai-image-prompt-skills/creatify-ai_ai-ad-prompt-guide"
add_submodule_if_missing "https://github.com/jezweb/claude-skills.git" "external/ai-image-prompt-skills/jezweb_claude-skills"
add_submodule_if_missing "https://github.com/pauhu/gemini-image-prompting-handbook.git" "external/ai-image-prompt-skills/pauhu_gemini-image-prompting-handbook"
add_submodule_if_missing "https://github.com/backblaze-b2-samples/image-generation-prompt-flow.git" "external/ai-image-prompt-skills/backblaze-b2-samples_image-generation-prompt-flow"
add_submodule_if_missing "https://github.com/K-Dense-AI/claude-scientific-writer.git" "external/ai-image-prompt-skills/K-Dense-AI_claude-scientific-writer"

echo ""
echo "Submodule setup complete."
echo "Next commands:"
echo "  git add .gitmodules external/ai-image-prompt-skills"
echo "  git commit -m 'Add AI image prompt skill repositories as submodules'"
echo "  git push"
