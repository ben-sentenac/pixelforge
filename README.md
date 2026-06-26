# PixelForge

PixelForge is a small Bash terminal theme inspired by pixel art, retro consoles, and old-school developer workstations.

The goal is not only to make the terminal look fun, but also to understand how Bash prompts, ANSI escape sequences, colors, and shell customization work.

## architecture

                         Bash
                           │
                    PROMPT_COMMAND
                           │
                    pf_prompt_update()
                           │
                        Engine
                           │
                     Configuration
                           │
                       Registry
                           │
                      Providers
                           │
                     Render Model
                           │
                       Widgets
                           │
                        Layout
                           │
                      Theme API
                           │
             ┌─────────────┴─────────────┐
             │                           │
         Palette                     Icons
             │                           │
             └─────────────┬─────────────┘
                           │
                          PS1