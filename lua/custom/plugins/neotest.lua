return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest', -- vitest
  },
  keys = {
    {
      '<leader>nr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run nearest test',
    },
    {
      '<leader>nf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run current file',
    },
    {
      '<leader>na',
      function()
        require('neotest').run.run { suite = true }
      end,
      desc = 'Run all tests',
    },
    {
      '<leader>no',
      function()
        require('neotest').output.open()
      end,
      desc = 'Show test output',
    },
    {
      '<leader>np',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle output panel',
    },
    {
      '<leader>nv',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle summary',
    },
  },
  config = function()
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        require 'neotest-vitest' {
          filter_dir = function(name, rel_path, root)
            return name ~= 'node_modules'
          end,
        },
      },
    }

    -- Auto-open output panel after test run
    neotest.listeners = neotest.listeners or {}
    neotest.listeners.results = function(_, results)
      if results and next(results) ~= nil then
        neotest.summary.open()
      end
    end
  end,
}
