export PIXELFORGE_ROOT="${PIXELFORGE_ROOT:-$HOME/Workspace/projects/pixelForge}"

source "$PIXELFORGE_ROOT/src/core/engine.sh"

source "$PIXELFORGE_ROOT/src/providers/user.sh"
source "$PIXELFORGE_ROOT/src/providers/host.sh"
source "$PIXELFORGE_ROOT/src/providers/cwd.sh"

source "$PIXELFORGE_ROOT/src/widgets/user.sh"
source "$PIXELFORGE_ROOT/src/widgets/host.sh"
source "$PIXELFORGE_ROOT/src/widgets/cwd.sh"

source "$PIXELFORGE_ROOT/src/core/prompt.sh"

PROMPT_COMMAND="pf_prompt_update"
