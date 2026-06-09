# AI 图片提示词与 Skill 项目仓库入口

这个目录用于集中管理一批 GitHub 上优秀的 AI 图片生成提示词库、图片生成 Skill、视觉 Prompt 工程案例。

当前采用 **Git submodule 子模块方案**，而不是把外部仓库源码直接复制进本仓库。

原因：

- 部分项目体积较大，例如图片提示词库和 Gallery 仓库可能达到数百 MB。
- 子模块方式不会显著膨胀本仓库。
- 你可以在本地一次性递归下载完整内容。
- 后续也可以单独更新某个外部项目。

## 使用方式

### 方式一：在 GitHub 网页端运行 Actions

进入本仓库：

```text
Actions → Add AI Image Skill Repositories as Submodules → Run workflow
```

运行完成后，仓库会新增 `external/ai-image-prompt-skills/` 目录，每个项目以子模块形式挂载。

然后你在本地下载：

```bash
git clone --recurse-submodules https://github.com/xprredurfg-lang/codex1.git
```

如果你已经克隆过本仓库：

```bash
git pull
git submodule update --init --recursive
```

### 方式二：本地执行脚本

```bash
bash ai-image-prompt-skill-repos/scripts/add_submodules.sh
```

然后提交并推送：

```bash
git add .gitmodules external/ai-image-prompt-skills
git commit -m "Add AI image prompt skill repositories as submodules"
git push
```

### 方式三：只想直接下载完整仓库，不提交为子模块

```bash
bash ai-image-prompt-skill-repos/scripts/clone_full_repos.sh
```

这会把所有项目 clone 到：

```text
_downloaded_ai_image_prompt_skill_repos/
```

## 项目清单

详见：

```text
ai-image-prompt-skill-repos/repo_manifest.json
```

## 建议优先阅读

1. `wuyoscar/GPT-Image2-Skill`
2. `ConardLi/garden-skills` 中的 `skills/gpt-image-2`
3. `YouMind-OpenLab/ai-image-prompts-skill`
4. `Creatify-AI/ai-ad-prompt-guide`
5. `jezweb/claude-skills` 中的 `plugins/design-assets/skills/ai-image-generator`

## 后续整理建议

后续可以基于这些项目，抽取一套你自己的制造质量图片设计 Skill：

```text
manufacturing-quality-image-skill/
├── SKILL.md
├── references/
│   ├── 工装规范.md
│   ├── 车型规范.md
│   ├── 中文文字规范.md
│   ├── 工厂场景规范.md
│   └── 禁止项清单.md
├── templates/
│   ├── 16比9汇报信息图.md
│   ├── 廉洁漫画成品页.md
│   ├── 视频分镜板.md
│   ├── 首帧尾帧.md
│   └── 工业管理信息图.md
└── examples/
    ├── 合规守护者.md
    ├── 清风有路.md
    ├── 未来星答辩图.md
    └── IOT质检系统图.md
```
