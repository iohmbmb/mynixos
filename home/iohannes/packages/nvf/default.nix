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
              filetypes = ["html"];
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
          nvim-toggle-term = {
            package = pkgs.vimPlugins.toggleterm-nvim;
            setup = "require('toggleterm').setup{}";
          };
          vim-godot = {
            package = pkgs.vimPlugins.vim-godot;
          };
          tiny-inline-diagnostic = {
            package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
            setup = "require('tiny-inline-diagnostic').setup() vim.diagnostic.config({ virtual_text = false })";
          };
        };

        startPlugins = ["plenary-nvim" pkgs.vimPlugins.flutter-tools-nvim pkgs.vimPlugins.nvim-dap pkgs.vimPlugins.nvim-tree-lua pkgs.vimPlugins.nvim-treesitter-parsers.qmljs pkgs.vimPlugins.toggleterm-nvim pkgs.vimPlugins.vim-godot pkgs.vimPlugins.tiny-inline-diagnostic-nvim];
      };
    };
  };
}
