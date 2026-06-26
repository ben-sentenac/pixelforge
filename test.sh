set -euo pipefail

export PIXELFORGE_ROOT="$PWD"

source src/core/engine.sh

source src/providers/user.sh
source src/providers/host.sh
source src/providers/cwd.sh

source src/widgets/user.sh
source src/widgets/host.sh
source src/widgets/cwd.sh

source src/core/prompt.sh

pf_prompt_update
printf "%q\n" "$PS1"
echo