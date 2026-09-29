local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
    s(
        'jira',
        fmt('- [ ] [AUT-{}](https://jira.fkn.com.br:8443/browse/AUT-{}) {}', {
            i(1, 'number'),
            rep(1),
            i(2, 'description'),
        })
    ),
}
