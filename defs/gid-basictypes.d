//!kind basictypes Namespace
//!inhibit imports init funcs

public import std.bitmanip : bitfields;

import core.stdc.config : c_long, c_ulong;

// gulong/glong change size depending on if Windows or not
alias gulong = c_ulong;
alias glong = c_long;

alias gboolean = int;
