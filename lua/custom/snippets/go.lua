local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

return {
  -- 	if err != nil {
  --
  -- }
  s('iferr', {
    t 'if err != nil {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),

  -- finbox specific snippets
  -- switch {
  -- case errors.Is(err, sql.ErrNoRows):
  -- 	logger.WithContextV3(ctx, nil).Errorf("[]  err %v", err)
  -- 	errorHandler.CustomError(w, "", "")
  -- 	return
  -- case err != nil:
  -- 	logger.WithContextV3(ctx, nil).Errorf("[]  err %v", err)
  -- 	errorHandler.ReportToSentryV3(ctx, err, errorHandler.ErrorFields{})
  -- 	errorHandler.CustomError(w, "", "")
  -- 	return
  -- 	}
  s('swerr', {
    t 'switch {',

    -- case: sql.ErrNoRows
    t { '', 'case errors.Is(err, sql.ErrNoRows):' },
    t { '', '\tlogger.WithContextV3(ctx, nil).Errorf("[' },
    i(1),
    t '] ',
    i(2),
    t ' err %v", err)',
    t { '', '\terrorHandler.CustomError(w, ' },
    i(3, '""'),
    t ', ',
    i(4, '""'),
    t ')',
    t { '', '\treturn' },

    -- case: err != nil
    t { '', 'case err != nil:' },
    t { '', '\tlogger.WithContextV3(ctx, nil).Errorf("[' },
    rep(1),
    t '] ',
    i(5),
    t ' err %v", err)',
    t { '', '\terrorHandler.ReportToSentryV3(ctx, err, errorHandler.ErrorFields{})' },
    t { '', '\terrorHandler.CustomError(w, ' },
    i(6, '""'),
    t ', ',
    i(7, '""'),
    t ')',
    t { '', '\treturn' },

    t { '', '}' },
    i(0),
  }),
}
