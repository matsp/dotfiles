-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment

keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- 'o'pen / 'c'lose
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- switch windows
keymap.set("n", "<C-J>", "<C-W>j", { desc = "Switch to window below" }) -- switch to window below
keymap.set("n", "<C-K>", "<C-W>k", { desc = "Switch to window above" }) -- switch to window above
keymap.set("n", "<C-L>", "<C-W>l", { desc = "Switch to window right" }) -- switch to window right
keymap.set("n", "<C-H>", "<C-W>h", { desc = "Switch to window left" })  -- switch to window left
keymap.set("t", "<C-J>", "<C-W>j", { desc = "Switch to window below" }) -- switch to window below
keymap.set("t", "<C-K>", "<C-W>k", { desc = "Switch to window above" }) -- switch to window above
keymap.set("t", "<C-L>", "<C-W>l", { desc = "Switch to window right" }) -- switch to window right
keymap.set("t", "<C-H>", "<C-W>h", { desc = "Switch to window left" })  -- switch to window left



-- TODO: check later if really needed
--" vertical / horizontal split window
--nmap <leader>vs :vs<space>
--nmap <leader>hs :split<space>
--" resize window
--" vertical/horizontal 'i'ncrease / 'd'ecrease
keymap.set("n", "<leader>vi", ":vertical resize +5<cr>")
keymap.set("n", "<leader>vd", ":vertical resize -5<cr>")
keymap.set("n", "<leader>hi", ":resize +5<cr>")
keymap.set("n", "<leader>hd", ":resize -5<cr>")
-- nmap <leader>vi :vertical resize +5<cr>
-- nmap <leader>vd :vertical resize -5<cr>
-- nmap <leader>hi :resize +5<cr>
-- nmap <leader>hd :resize -5<cr>
--tmap <leader>vi <c-w>:vertical resize +5<cr>
--tmap <leader>vd <c-w>:vertical resize -5<cr>
--tmap <leader>hi <c-w>:resize +5<cr>
--tmap <leader>hd <c-w>:resize -5<cr>




-- disable arrow keys
-- TODO: remove if you reach legend status
keymap.set("n", "<Up>", "<Nop>", { silent = true })    -- disable arrow keys
keymap.set("i", "<Up>", "<Nop>", { silent = true })    -- disable arrow keys
keymap.set("n", "<Down>", "<Nop>", { silent = true })  -- disable arrow keys
keymap.set("i", "<Down>", "<Nop>", { silent = true })  -- disable arrow keys
keymap.set("n", "<Left>", "<Nop>", { silent = true })  -- disable arrow keys
keymap.set("i", "<Left>", "<Nop>", { silent = true })  -- disable arrow keys
keymap.set("n", "<Right>", "<Nop>", { silent = true }) -- disable arrow keys
keymap.set("i", "<Right>", "<Nop>", { silent = true }) -- disable arrow keys
