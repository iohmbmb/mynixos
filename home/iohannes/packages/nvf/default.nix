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
            })";
          };
          neoscroll = {
            package = pkgs.vimPlugins.neoscroll-nvim;
          };
        };

        startPlugins = ["plenary-nvim" pkgs.vimPlugins.flutter-tools-nvim pkgs.vimPlugins.nvim-dap pkgs.vimPlugins.nvim-tree-lua pkgs.vimPlugins.nvim-treesitter-parsers.qmljs pkgs.vimPlugins.toggleterm-nvim pkgs.vimPlugins.vim-godot pkgs.vimPlugins.tiny-inline-diagnostic-nvim pkgs.vimPlugins.snacks-nvim pkgs.vimPlugins.codecompanion-nvim pkgs.vimPlugins.noice-nvim pkgs.vimPlugins.codecompanion-spinner-nvim pkgs.vimPlugins.noice-nvim pkgs.vimPlugins.neoscroll-nvim pkgs.vimPlugins.nvim-treesitter-parsers.yaml];
      };
    };
  };
}
