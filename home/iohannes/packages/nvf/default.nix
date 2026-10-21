{pkgs, ...}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        ui = {
          borders = {
            plugins = {
              nvim-cmp = {
                enable = true;
                style = "rounded";
              };
            };
          };
        };
        keymaps = [
          {
            key = "<C-k>";
            mode = "n";
            silent = true;
            action = "<cmd>lua vim.lsp.buf.hover({ focusable = false })<cr>";
          }
        ];
        maps = {
          normal = {
            # Map Ctrl-n in normal mode
            "<C-n>" = {
              action = "<cmd>NvimTreeToggle<CR>";
              silent = true;
              desc = "Toggle file explorer";
            };
            # Map space-v in normal mode
            "<C-t>" = {
              action = "<cmd>ToggleTerm size=10<CR>";
              silent = true;
              desc = "Toggle terminal";
            };
            # Mapping for fzf-lua
            "<C-f>" = {
              action = "<cmd>FzfLua files<CR>";
              silent = true;
              desc = "Let search the files";
            };
            "<C-r>" = {
              action = "<cmd>FzfLua live_grep<CR>";
              silent = true;
              desc = "Search for strings live";
            };
            "<C-b>" = {
              action = "<cmd>FzfLua buffers<CR>";
              silent = true;
              desc = "Open the list of buffers";
            };
          };
          terminal = {
            # Map space-v in normal mode
            "<C-t>" = {
              action = "<cmd>ToggleTerm size=10<CR>";
              silent = true;
              desc = "Toggle terminal";
            };
          };
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
          termguicolors = true;
        };

        treesitter = {
          enable = true;
          highlight.enable = true;
        };

        fzf-lua.enable = true;

        visuals.indent-blankline = {
          enable = true;
          setupOpts.scope.enabled = true;
        };

        
        statusline.lualine = {
          enable = true;
          setupOpts = {
            options = {
              theme = {
                normal = {
                  a = {
                    fg = "#1e1e2e";
                    bg = "#c191ff";
                    gui = "bold";
                  };
                  b = {
                    fg = "#bdbdbd";
                    bg = "NONE";
                  };
                  c = {
                    fg = "#84c26b";
                    bg = "NONE";
                  };
                };

                insert = {
                  a = {
                    fg = "#1e1e2e";
                    bg = "#84c26b";
                    gui = "bold";
                  };
                };

                visual = {
                  a = {
                    fg = "#1e1e2e";
                    bg = "#65c3cc";
                    gui = "bold";
                  };
                };

                replace = {
                  a = {
                    fg = "#1e1e2e";
                    bg = "#ed8796";
                    gui = "bold";
                  };
                };

                command = {
                  a = {
                    fg = "#1e1e2e";
                    bg = "#e5c07b";
                    gui = "bold";
                  };
                };

                inactive = {
                  a = {
                    fg = "#45475a";
                    bg = "NONE";
                  };
                  b = {
                    fg = "#45475a";
                    bg = "NONE";
                  };
                  c = {
                    fg = "#45475a";
                    bg = "NONE";
                  };
                };
              };

              component_separators = {
                left = "|";
                right = "|";
              };

              section_separators = {
                left = "";
                right = "";
              };

              globalstatus = true;
            };
          };
        };

        telescope.enable = true;
        autocomplete.nvim-cmp = {
          enable = true;
        };
        lsp = {
          enable = true;
          lspconfig = {enable = true;};
          servers = {
            html = {
              capabilities = { 
                textDocument = { 
                  completion = { 
                    completionItem = { 
                      snippetSupport = true; 
                    }; 
                  }; 
                }; 
              };
              cmd = ["vscode-html-language-server" "--stdio"];
              filetypes = ["html" "htmlangular"];
            };
            tailwindcss-language-server = {
              capabilities = { 
                textDocument = { 
                  completion = { 
                    completionItem = { 
                      snippetSupport = true; 
                    }; 
                  }; 
                }; 
              };
              root_markers = ["tailwind.config.js" "postcss.config.js" "package.json" ".git"];
              cmd = ["tailwindcss-language-server" "--stdio"];
              filetypes = ["aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "edge" "eelixir" "elixir" "ejs" "erb" "eruby" "gohtml" "gohtmltmpl" "haml" "handlebars" "hbs" "html" "htmlangular" "html-eex" "heex" "jade" "leaf" "liquid" "markdown" "mdx" "mustache" "njk" "nunjucks" "php" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact" "reason" "rescript" "vue" "svelte" "templ"];
              settings = {
                tailwindCSS = {
                  includeLanguages = {
                    htmlangular = "html";
                  };
                };
              };
            };
            gdscript = {
              capabilities = {
                textDocument = {
                  completion = { dynamicRegistration = true; };
                  hover = { dynamicRegistration = true; };
                };
                filetypes = ["gd" "gdshader"];
              };
            };
          };
        };
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
          python.enable = true;
          go.enable = true;
          html = {
            enable = true;
            treesitter = {
              enable = true;
              autotagHtml = true;
            };
          };
          css.enable = true;
          typescript.enable = true;
          markdown.enable = true;
          csharp = {
            enable = true;
            lsp.enable = true;
          };
        };
        extraPlugins = {
          vscode-nvim = {
            package = pkgs.vimPlugins.vscode-nvim;
            setup = ''
              local c = require("vscode.colors").get_colors()
              require('vscode').setup({
                style = 'dark',
                color_overrides = {
                  vscLineNumber = '#FFFFFF',
                },
                group_overrides = {

                  Normal = { bg = '#1e1f22' },
                  NormalNC = { bg = '#1e1f22' },
                  SignColumn = { bg = '#1e1f22' },
                  EndOfBuffer = { bg = '#1e1f22' },

                  -- Variables
                  ["@variable"] = { fg = "#bdbdbd" },
                  ["@variable.member"] = { fg = "#65c3cc" },
                  ["@variable.parameter"] = { fg = "#ed8796" },
                  ["@parameter"] = { fg = "#ed8796" },

                  -- Functions and methods
                  ["@function"] = { fg = "#38c596", bold = true },
                  ["@function.call"] = { fg = "#38c596", bold = true },
                  ["@function.method"] = { fg = "#38c596", bold = true },
                  ["@function.method.call"] = {
                    link = "@function.method"
                  },

                  -- Keywords and control flow
                  ["@keyword"] = { fg = "#6c95eb" },
                  ["@keyword.conditional"] = {
                    fg = "#6c95eb",
                    bold = true
                  },
                  ["@keyword.repeat"] = {
                    fg = "#6c95eb",
                    bold = true
                  },
                  ["@keyword.return"] = { fg = "#6c95eb" },
                  ["@keyword.exception"] = { fg = "#6c95eb" },

                  -- Constants and booleans
                  ["@boolean"] = {
                    fg = "#6c95eb",
                    italic = true
                  },
                  ["@number"] = { fg = "#e791bc", bold = true },
                  ["@float"] = { fg = "#e791bc", bold = true },
                  ["@constant"] = { fg = "#e791bc" },

                  -- Types and classes
                  ["@type"] = { fg = "#c191ff" },
                  ["@type.builtin"] = { fg = "#c191ff" },
                  ["@constructor"] = { fg = "#c191ff", bold = true },
                  ["@lsp.type.class"] = {
                    fg = "#c191ff",
                    bold = true
                  },
                  ["@lsp.type.interface"] = { fg = "#c191ff" },
                  ["@lsp.type.enum"] = { fg = "#c191ff" },

                  -- Comments
                  ["@comment"] = {
                    fg = "#84c26b",
                    italic = true
                  },
                  ["Comment"] = {
                    fg = "#84c26b",
                    italic = true
                  },

                  -- Traditional Vim syntax fallbacks
                  Keyword = { fg = "#6c95eb" },
                  Conditional = { fg = "#6c95eb", bold = true },
                  Repeat = { fg = "#6c95eb", bold = true },
                  Function = { fg = "#38c596", bold = true },
                  Type = { fg = "#c191ff" },
                  Number = { fg = "#e791bc", bold = true },
                  Boolean = { fg = "#6c95eb", italic = true },
                },
              })
            '';
          };
          nvim-dap = {
            package = pkgs.vimPlugins.nvim-dap;
          };
          nvim-tree = {
            package = pkgs.vimPlugins.nvim-tree-lua;
            setup = ''
            require('nvim-tree').setup({
              view = {
                  width = 32,
                  side = "left",
                  signcolumn = "yes",
                },

                renderer = {
                  root_folder_label = false,
                  group_empty = true,
                  indent_width = 2,

                  indent_markers = {
                    enable = true,
                    inline_arrows = true,
                    icons = {
                      corner = "└",
                      edge = "│",
                      item = "│",
                      bottom = "─",
                      none = " ",
                    },
                  },

                  icons = {
                    padding = {
                      icon = " ",
                      folder_arrow = " ",
                    },
                    show = {
                      file = true,
                      folder = true,
                      folder_arrow = true,
                      git = true,
                    },
                    glyphs = {
                      folder = {
                        arrow_closed = "›",
                        arrow_open = "⌄",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                      },
                    },
                  },
                },

                filters = {
                  dotfiles = false,
                },

                git = {
                  enable = true,
                  show_on_dirs = true,
                },
            })'';
          };
          nvim-treesitter-parsers-qmljs = {
            package = pkgs.vimPlugins.nvim-treesitter-parsers.qmljs;
            setup = "vim.lsp.config['qmlls'] = {cmd = {'qmlls', '-E'}}";
          };
          nvim-treesitter-parsers-yaml = {
            package = pkgs.vimPlugins.nvim-treesitter-parsers.yaml;
          };
          nvim-toggle-term = {
            package = pkgs.vimPlugins.toggleterm-nvim;
            setup = "require('toggleterm').setup{}";
          };
          vim-godot = {
            package = pkgs.vimPlugins.vim-godot;
          };
          tiny-inline-diagnostic = {
            package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
            setup = "require('tiny-inline-diagnostic').setup() vim.diagnostic.config({virtual_text = false})";
          };
          snacks = {
            package = pkgs.vimPlugins.snacks-nvim;
            setup = "require('snacks').setup({terminal = {enabled = true}, input = {enable = true}, picker = {enable = true}})";
          };
          minuet-ai = {
            package = pkgs.vimPlugins.minuet-ai-nvim;
            setup = ''
              -- Instantly reads your machine's network name without hitting the network API
              local function get_active_ollama_model()
              local handle = io.popen("hostname")
              if handle then
               local hostname = handle:read("*a"):gsub("%s+", "") -- Strips trailing spaces/newlines
               handle:close()

              -- Change "my-desktop-hostname" to match your exact desktop system name
              if hostname == "aegis" then
                return "qwen2.5-coder:14b-base"
              end
            end
              -- Automatically falls back to the laptop configuration for anything else
            return "qwen2.5-coder:3b-base"
          end
          require('minuet').setup({
            virtualtext = {
              auto_trigger_ft = { "*" },
              keymap = {
                accept = "<M-j>",
                accept_line = "<M-l>",
                accept_word = "<M-w>",
                prev = "<M-[>",
                next = "<M-]>",
                dismiss = "<C-e>",
              },
            },
            provider = "openai_fim_compatible",
            provider_options = {
              openai_fim_compatible = {
                name = "Ollama",
                end_point = "http://127.0.0.1:11434/v1/completions",
                model = get_active_ollama_model(), 
                api_key = "TERM", 
                optional = {
                  max_tokens = 256,
                  temperature = 0.2, -- Low temperature ensures strict structural coding logic
                },
              },
            },
            throttle = 2000, 
            debounce = 400,  
              })
          '';
          };
          nvim-web-devicons = {
            package = pkgs.vimPlugins.nvim-web-devicons;
          };
          noice = {
            package = pkgs.vimPlugins.noice-nvim;
            setup = "require('noice').setup({
              presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,
              },
              lsp = {
                override = {
                  ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                  ['vim.lsp.util.stylize_markdown'] = true,
                  ['cmp.entry.get_documentation'] = true, -- Integrates docs cleanly with completion popups
                },
                hover = { 
                  enabled = true,
                  silent = false,
                  opts = {
                    focusable = true,
                    win_options = {
                      winblend = 0,
                    },
                  },
                },
                signature = { enabled = true },
              },
              routes = {
                {
                  filter = {
                    event = 'notify',
                    find = 'No information available',
                  },
                  opts = { skip = true },
                },
              },
            })";
          };
          trouble = {
            package = pkgs.vimPlugins.trouble-nvim;
            setup = ''
              require("trouble").setup({})
              vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Project Diagnostics (Trouble)" })
              vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
            '';
          };
          bufferline = {
            package = pkgs.vimPlugins.bufferline-nvim;
            setup = ''
              require("bufferline").setup({
                options = {
                  mode = "buffers",
                  diagnostics = "nvim_lsp", -- Show error counts on tabs
                  show_buffer_close_icons = true,
                  show_close_icon = false,
                  buffer_close_icon = "x",
                  close_command = "bdelete %d",
                  close_icon = "x",
                  indicator = {
                    style = "icon",
                    icon = " ",
                  },
                  left_trunc_marker = "",
                  modified_icon = "●",
                  offsets = { { filetype = "NvimTree", text = "╭─ EXPLORER ─╮", text_align = "center" } },
                  right_mouse_command = "bdelete! %d",
                  right_trunc_marker = "",
                  show_close_icon = false,
                  show_tab_indicators = true,
                },
                highlights = {
                  fill = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "StatusLineNC" },
                  },
                  background = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "StatusLine" },
                  },
                  buffer_visible = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "Normal" },
                  },
                  buffer_selected = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "Normal" },
                  },
                  separator = {
                      fg = { attribute = "bg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "StatusLine" },
                  },
                  separator_selected = {
                      fg = { attribute = "fg", highlight = "Special" },
                      bg = { attribute = "bg", highlight = "Normal" },
                  },
                  separator_visible = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "StatusLineNC" },
                  },
                  close_button = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "StatusLine" },
                  },
                  close_button_selected = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "Normal" },
                  },
                  close_button_visible = {
                      fg = { attribute = "fg", highlight = "Normal" },
                      bg = { attribute = "bg", highlight = "Normal" },
                  },
                },
              })
            '';
          };
          gitsigns = {
            package = pkgs.vimPlugins.gitsigns-nvim;
            setup = ''
              require('gitsigns').setup({
                current_line_blame = true, 
                signcolumn = true,          -- Keep gutter indicators active
              })
            '';
          };
          autopairs = {
            package = pkgs.vimPlugins.nvim-autopairs;
            setup = ''
              require("nvim-autopairs").setup({
                check_ts = true, -- Integrates with Treesitter to handle language edge cases
              })
            '';
          };
          indent-blankline = {
            package = pkgs.vimPlugins.indent-blankline-nvim;
            setup = ''
            -- ibl is the modern namespace for indent-blankline v3
                require("ibl").setup({
                scope = { enabled = true }, -- Dynamically highlights your active code block
              })
            '';
          };
          neoscroll = {
            package = pkgs.vimPlugins.neoscroll-nvim;
            setup = ''
              require('neoscroll').setup({
            -- Use the plugin's default smooth bindings (<C-u>, <C-d>, <C-b>, <C-f>, etc.)
              mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
              hide_cursor = true,          -- Hide cursor while scrolling for a cleaner look
              stop_eof = true,             -- Stop scrolling at the end of file
              respect_scrolloff = false,   -- Stop scrolling when the cursor hits scrolloff margin
              cursor_scrolls_alone = true, -- The cursor will keep scrolling when the window can't scroll
            })
          '';
          };
          
        };

        luaConfigRC = {
          vscode-theme = ''
            vim.cmd.colorscheme "vscode"
          '';

          kitty-font-size = ''
              local group = vim.api.nvim_create_augroup(
                "KittyNvimFontSize",
                { clear = true }
              )

              local function set_font_size(size)
                vim.fn.jobstart({
                  "kitten", "@", "set-font-size", tostring(size),
                }, { detach = true })
              end

              vim.api.nvim_create_autocmd("VimEnter", {
                group = group,
                callback = function()
                  set_font_size(20)
                end,
              })

              vim.api.nvim_create_autocmd("VimLeave", {
                group = group,
                callback = function()
                  set_font_size(0)
                end,
              })
            '';

          nvimtree-theme = ''
            local group = vim.api.nvim_create_augroup(
              "NvimTreeRiderTheme",
              { clear = true }
            )

            local function set_tree_colors()
              local bg = "#1e1f22"

              vim.api.nvim_set_hl(0, "NvimTreeNormal", {
                fg = "#bcbec4",
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeNormalNC", {
                fg = "#bcbec4",
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", {
                fg = bg,
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
                fg = "#3c3f41",
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeFolderName", {
                fg = "#bcbec4",
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", {
                fg = "#589df6",
                bg = bg,
                bold = true,
              })

              vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {
                fg = "#589df6",
                bg = bg,
                bold = true,
              })

              vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {
                fg = "#45494a",
                bg = bg,
              })

              vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
                bg = "#2b2d30",
              })
            end

            vim.api.nvim_create_autocmd("ColorScheme", {
              group = group,
              callback = set_tree_colors,
            })

            vim.api.nvim_create_autocmd("FileType", {
              group = group,
              pattern = "NvimTree",
              callback = set_tree_colors,
            })

            set_tree_colors()
          '';

          kitty-background = ''
            local group = vim.api.nvim_create_augroup(
              "KittyNvimBackground",
              { clear = true }
            )

            local function sync_terminal_background()
              local normal = vim.api.nvim_get_hl(0, {
                name = "Normal",
                link = false,
              })

              if normal.bg == nil then
                return
              end

              io.stdout:write(
                ("\027]11;#%06x\027\\"):format(normal.bg)
              )
              io.stdout:flush()
            end

            vim.api.nvim_create_autocmd(
              { "UIEnter", "ColorScheme" },
              {
                group = group,
                callback = sync_terminal_background,
              }
            )

            vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, 
            {
              group = group,
              callback = function()
                io.stdout:write("\027]110\007\027]111\007")
                io.stdout:flush()
              end,
            })
          '';
        };        

        startPlugins = ["plenary-nvim" pkgs.vimPlugins.nvim-dap pkgs.vimPlugins.nvim-tree-lua pkgs.vimPlugins.nvim-treesitter-parsers.qmljs pkgs.vimPlugins.toggleterm-nvim pkgs.vimPlugins.vim-godot pkgs.vimPlugins.tiny-inline-diagnostic-nvim pkgs.vimPlugins.snacks-nvim pkgs.vimPlugins.noice-nvim pkgs.vimPlugins.neoscroll-nvim pkgs.vimPlugins.nvim-treesitter-parsers.yaml];
      };
    };
  };
}
