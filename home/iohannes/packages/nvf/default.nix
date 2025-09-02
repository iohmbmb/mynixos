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

        visuals.indent-blankline = {
          enable = true;
          setupOpts.scope.enabled = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
          python.enable = true;
          dart.enable = true;
          go.enable = true;
          html.enable = true;
          markdown.enable = true;
          ts.enable = true;
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
            setup = "require('lspconfig').qmlls.setup {cmd = {'qmlls', '-E'}}";
          };
          nvim-toggle-term = {
            package = pkgs.vimPlugins.toggleterm-nvim;
            setup = "require('toggleterm').setup{}";
          };
        };

        startPlugins = ["plenary-nvim" pkgs.vimPlugins.flutter-tools-nvim pkgs.vimPlugins.nvim-dap pkgs.vimPlugins.nvim-tree-lua pkgs.vimPlugins.nvim-treesitter-parsers.qmljs pkgs.vimPlugins.toggleterm-nvim];
      };
    };
  };
}
