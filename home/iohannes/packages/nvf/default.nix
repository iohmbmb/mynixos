{pkgs, ...}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "frappe";
        };

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

        luaConfigPost = 
        ''
          -- search for project godot and start listening to the server
          local projectfile = vim.fn.getcwd() .. '/project.godot'
          if projectfile then
            vim.fn.serverstart './godothost'
          end
          -- Suppress "No information available" hover notifications
          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              silent = true, -- This flag suppresses the "no information" popup
            })
        '';
        keymaps = [];
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

        statusline.lualine.enable = true;
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
              filetypes = ["aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "edge" "eelixir" "elixir" "ejs" "erb" "eruby" "gohtml" "gohtmltmpl" "haml" "handlebars" "hbs" "html" "htmlangular" "html-eex" "heex" "jade" "leaf" "liquid" "markdown" "mdx" "mustache" "njk" "nunjucks" "php" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact" "reason" "rescript" "typescript" "typescriptreact" "vue" "svelte" "templ"];
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
          dart.enable = true;
          go.enable = true;
          html = {
            enable = true;
            treesitter = {
              enable = true;
              autotagHtml = true;
            };
          };
          css.enable = true;
          ts.enable = true;
          markdown.enable = true;
          csharp = {
            enable = true;
            lsp.enable = true;
          };
        };
        extraPlugins = {
          flutter-tools = {
            package = pkgs.vimPlugins.flutter-tools-nvim;
            setup = "require('flutter-tools').setup {}";
          };
          nvim-dap = {
            package = pkgs.vimPlugins.nvim-dap;
          };
          nvim-tree = {
            package = pkgs.vimPlugins.nvim-tree-lua;
            setup = "require('nvim-tree').setup()";
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
          codecompanion = {
            package = pkgs.vimPlugins.codecompanion-nvim;
            setup = "require('codecompanion').setup({
              interactions = {
                chat = {
                  adapter = 'ollama',
                },
                inline = {
                  adapter = 'ollama',
                },
                background = {
                  adapter = 'ollama',
                },
              },
              extensions = {
                spinner = {},
              },
              opts = {
                log_level = 'DEBUG',
              }
            })";
          };
          codecompanion-spinner = {
            package = pkgs.vimPlugins.codecompanion-spinner-nvim;
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
            return "qwen2.5-coder:7b-base"
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
            n_completions = 1,
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
                hover = { enabled = false },
                signature = { enabled = false },
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
          lspsaga = {
          package = pkgs.vimPlugins.lspsaga-nvim;
            setup = ''
              require('lspsaga').setup({
            -- Customize your UI elements here if needed
                ui = {
                  border = "rounded", -- Gives popups nice smooth borders
                },
                hover = {
                  open_link = "gx",   -- Key to open links inside documentation popups
                },
            -- ADD BREADCRUMB CUSTOMIZATION HERE:
                symbol_in_winbar = {
                  enable = true,
            -- You can use a stylized arrow if your font supports it (e.g., "  " or "  ")
                  separator = " › ",    
                  show_file = true,     
                  hide_keyword = true,  
                  folder_level = 0,     
                  color_mode = true,    -- True matches the icon's color to your theme
                },
                lightbulb = { enable = false },
              })

            -- Keybindings to trigger Lspsaga's clean overlays
              vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga Hover Documentation" })
              vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Lspsaga Go To Definition" })
              vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Lspsaga Peek Definition" })
              vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "Lspsaga LSP Finder" })
              
              vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                  -- Stop completely if the cursor is already in a floating popup window
                  if vim.api.nvim_win_get_config(0).relative ~= "" then
                    return 
                  end
                  -- Use Lspsaga's beautiful engine instead of the plain native vim.lsp.buf.hover()
                  vim.cmd("Lspsaga hover_doc")
                  end,
                })
                -- Safe Winbar Guard 
                -- Stops Lspsaga breadcrumbs from rendering inside tiny floating notifications
                vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
                  pattern = "*",
                  callback = function()
                    if vim.api.nvim_win_get_config(0).relative ~= "" then
                      vim.opt_local.winbar = nil
                    end
                  end,
                })
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
                }
              })
            -- Easy tab cycling
              vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
              vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
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

        startPlugins = ["plenary-nvim" pkgs.vimPlugins.flutter-tools-nvim pkgs.vimPlugins.nvim-dap pkgs.vimPlugins.nvim-tree-lua pkgs.vimPlugins.nvim-treesitter-parsers.qmljs pkgs.vimPlugins.toggleterm-nvim pkgs.vimPlugins.vim-godot pkgs.vimPlugins.tiny-inline-diagnostic-nvim pkgs.vimPlugins.snacks-nvim pkgs.vimPlugins.noice-nvim pkgs.vimPlugins.noice-nvim pkgs.vimPlugins.neoscroll-nvim pkgs.vimPlugins.nvim-treesitter-parsers.yaml];
      };
    };
  };
}
