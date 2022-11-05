-- ====================================================
-- PLUGINS
-- ====================================================

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Editing
    -- =====================================

    use 'tpope/vim-commentary'              -- add and remove comments
    use 'majutsushi/tagbar'                 -- see breakdown of tags in a file
    use 'bronson/vim-trailing-whitespace'   -- removes trailing whitespace
    use 'tpope/abolish'                     -- tbc
    use 'tpope/vinegar'                     -- removes netrw header
    use 'tpope/vim-surround'                -- ability to surround ",{([ etc
    use 'simnalamburt/vim-mundo'            -- vim undo tree visualiser
    use 'roxma/vim-paste-easy'              -- automatically sets paste

    -- Appearance
    -- =====================================

    use 'vim/CSApprox'                      -- gVim colorschemes in term vim
    use 'arcticicestudio/nord.vim'          -- nord colorscheme
    use 'frenzyexists/aquarium.vim'         -- aquarium colorscheme

    -- Completion
    -- =====================================

    use 'neoclide/coc.nvim', {'branch': 'release'}

    -- Snippets
    -- =====================================

    use 'SirVer/ultisnips'                  -- snippets
    use 'honza/vim-snippets'                -- snippets

    -- Finances
    -- =====================================

    use 'anekos/hledger'                    -- finance hledger syntax

    -- Languages
    -- =====================================

    use 'sheerun/polyglot'                  -- language syntax pack

    -- web
    -- ---------------------

    use 'mattn/emmet-vim'                   -- 'shortcuts' for web dev
    use 'ap/vim-css-color'                  -- color highlights for css codes

    -- game development
    -- ---------------------

    use 'calviken/vim-gdscript3'            -- gd-script syntax

    -- writing
    -- ---------------------

    use 'junegunn/limelight.vim'            -- highlights current paragraph
    use 'junegunn/goyo.vim'                 -- distraction free writing
    use 'kblin/vim-fountain'                -- screenplay language syntax
    use 'ahayworth/ink-syntax-vim'          -- ink language syntax
    use 'andymass/grammarous'               -- grammar checker
    use 'epwalsh/obsidian'                  -- Note taking

    -- Utilities
    -- =====================================

    use 'sbdchd/neoformat'                  -- code formatting

    -- Searching
    -- =====================================

    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}

    -- Testing
    -- =====================================

    use 'kassio/neoterm' -- terminal wrapper
    use 'janko-m/vim-test' -- testing commands

    -- Version Control
    -- =====================================

    use { 'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false
      })
    end
  }

  -- General Development
  -- ======================================

  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'scrooloose/nerdcommenter' -- commenting shortcuts

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = { "ruby" }
    }
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
  )

  require'lspsaga'.init_lsp_saga {
    error_sign = '!',
    warn_sign = '^',
    hint_sign = '?',
    infor_sign = '~',
    border_style = "round",
    code_action_prompt = {
      enable = false
    }
  }



  -- End of file
  -- ==========================================

  end)












